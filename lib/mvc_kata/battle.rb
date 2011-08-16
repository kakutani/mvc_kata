# -*- coding: utf-8 -*-
module MvcKata
  class Battle
    include R18n::Helpers
    class << self
      def start!(locale)
        b = new(locale)
        b.start
      end
      def setup_r18n(locale)
        i18n_path = File.expand_path('../../../i18n/', __FILE__)
        R18n.set(locale, i18n_path)
      end
    end

    def initialize(locale)
      @i18n = self.class.setup_r18n(locale)

      @enemy_classes = [Slime, Dragon]
      @player = Player.new
      @turn_count = 0
    end

    def start
      @enemy = @enemy_classes.sample.new
      encount
    end

    def finish_battle
      puts t.message.beat_enemy(@enemy.name)

      puts
      puts "==========================="
      puts t.message.turn_count(@turn_count)

      gets
    end

    def game_over
      puts t.message.you_loose(@player.name)

      puts
      puts "==========================="
      puts t.message.game_over

      gets
    end

    def check_enemy_hp
      if @enemy.hp <= 0
        @enemy.hp = 0
        finish_battle()
      else
        enemy_attack()
      end
    end

    def check_player_hp
      if @player.hp <= 0
        @player.hp = 0
        game_over()
      else
        query_command()
      end
    end


    def player_hoimi
      cure_point = rand(8) + 1

      puts
      puts "==========================="
      puts t.message.hoimi_spelled(@player.name)
      @player.hp = [@player.hp + cure_point, @player.max_hp].min
      puts t.message.hoimi_cured(@player.name, cure_point)

      gets

      enemy_attack()
    end

    def encount
      puts "==========================="
      puts t.message.encount(@player.name, @enemy.name)
      gets
      query_command()
    end

    def enemy_attack
      damage_point = rand(@enemy.attack_power) + 1

      puts
      puts "==========================="
      puts t.message.attack(@enemy.name)
      @player.hp -= damage_point
      puts t.message.do_damage(@player.name, damage_point)

      gets

      check_player_hp()
    end

    def player_attack
      damage_point = rand(@player.attack_power) + 1

      puts
      puts "==========================="
      puts t.message.attack(@player.name)
      @enemy.hp -= damage_point
      puts t.message.do_damage(@enemy.name, damage_point)

      gets

      check_enemy_hp()
    end


    def query_command
      @turn_count += 1

      puts
      puts "==========================="
      puts t.message.hp_status(@player.name, @player.hp)
      puts t.message.battle_1
      puts t.message.battle_2
      puts t.message.query_command

      command = gets.chomp

      case command
      when t.command.hoimi, "2"
        player_hoimi()
      when t.command.escape, "3"
        player_escape()
      when "q"
        exit 0
      else
        player_attack()
      end
    end
  end
end

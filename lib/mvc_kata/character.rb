# -*- coding: utf-8 -*-
class Character
  attr :hp, true
  attr :max_hp, true
  attr :name, true
  attr :attack_power, true
end

class Enemey < Character
  attr :exp, true
end

class Slime < Enemey
  def initialize
    self.name = "SLIME"
    self.max_hp = 10
    self.hp = self.max_hp
    self.attack_power = 4
    self.exp = 1
  end
end

class Dragon < Enemey
  def initialize
    self.name = "DRAGON"
    self.max_hp = 20
    self.hp = self.max_hp
    self.attack_power = 8
    self.exp = 3000
  end
end

class Player < Character
  attr :mp, true

  def initialize
    self.name = "PLAYER"
    self.max_hp = 10
    self.hp = self.max_hp
    self.mp = 20
    self.attack_power = 3
  end
end

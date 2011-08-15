# -*- coding: utf-8 -*-
Given /^戦闘スクリプトを起動する$/ do
  smart_ui = File.expand_path("#{File.dirname(__FILE__)}/../../smart_ui.rb")
  run_interactive "ruby #{smart_ui}"
  type "\n"
end

Then /^"([^"]*)"と出力されること$/ do |output| #"
  assert_partial_output(output, all_output)
end

Then /^"([^"]*)"を入力$/ do |input| #"
  type input
end

Then /^終了する$/ do
  type "q"
end

Then /^たたかう$/ do
  type "1\n"
  type "\n" #playerのこうげき
  type "\n" #enemyのこうげき
end

When /^次へ$/ do
  type "\n"
end

When /^(?:プレイヤー|敵)のこうげき$/ do
  type "\n"
end

When /^ホイミをとなえる$/ do
  type "2\n"
  type "\n" # player のホイミ
  type "\n" # emeny のこうげき
end

Then /^敵に攻撃していること$/ do
  all_output.should match(/に\d+のダメージ/)
end

Then /^敵から攻撃されていること$/ do
  all_output.should match(/PLAYERに\d+のダメージ/)
end

Then /^体力が回復していること$/ do
  out = all_output
  out.should include("PLAYERはホイミをとなえた")
  out.should match(/HPが[1-8]回復した/)
end

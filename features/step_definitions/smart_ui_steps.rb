# -*- coding: utf-8 -*-
Given /^戦闘スクリプトを起動する$/ do
  run_interactive "smart_ui"
  type "\n"
end

Given /^英語版で戦闘スクリプトを起動する$/ do
  run_interactive "smart_ui english"
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

When /^終了する$/ do
  type "q"
end

Then /^"([^"]*)"と出力されること$/ do |output| #"
  assert_partial_output(output, all_output)
end

Then /^"([^"]*)"を入力$/ do |input| #"
  type input
end


Then /^たたかう$/ do
  type "1\n"
  type "\n" #playerのこうげき
  type "\n" #enemyのこうげき
end

Then /^敵に攻撃していること$/ do
  all_output.should match(/に\d+のダメージ/)
end

Then /^敵から攻撃されていること$/ do
  all_output.should match(/PLAYERに\d+のダメージ/)
end

Then /^player should attack the enemy$/ do
  out = all_output
  out.should include("PLAYER attack.")
  out.should match(/(?:DRAGON|SLIME)\sdamaged/)
end

Then /^player should hit by the enemy$/ do
  all_output.should match(/PLAYER damaged/)
end


Then /^体力が回復していること$/ do
  out = all_output
  out.should include("PLAYERはホイミをとなえた")
  out.should match(/HPが[1-8]回復した/)
end

Then /^player's HP should be cured$/ do
  all_output.should include("PLAYER call hoimi.")
end

# -*- coding: utf-8 -*-
Feature: 日本語のエンドツーエンドのテスト
  Scenario: 起動
    Given 戦闘スクリプトを起動する
    When 終了する
    Then "があらわれた"と出力されること
    And "コマンド?"と出力されること

  Scenario: 戦闘
    Given 戦闘スクリプトを起動する
    When たたかう
    And 終了する
    And 敵に攻撃していること
    And 敵から攻撃されていること

  Scenario: ホイミ
    Given 戦闘スクリプトを起動する
    When ホイミをとなえる
    And 終了する
    Then 体力が回復していること
    And 敵から攻撃されていること

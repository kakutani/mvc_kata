# -*- coding: utf-8 -*-
Feature: 英語版のエンドツーエンドのテスト
 Scenario: 英語版のスクリプトを起動する
    Given 英語版で戦闘スクリプトを起動する
    When 終了する
    Then "PLAYER encounted"と出力されること
    And "Command?"と出力されること

  Scenario: 英語版で戦闘をおこなう
    Given 英語版で戦闘スクリプトを起動する
    When たたかう
    And 終了する
    And player should attack the enemy
    And player should hit by the enemy

  Scenario: 英語版でホイミをとなえる
    Given 英語版で戦闘スクリプトを起動する
    When ホイミをとなえる
    And 終了する
    Then player's HP should be cured
    And player should hit by the enemy

# frozen_string_literal: true

require 'application_system_test_case'

class ReportsTest < ApplicationSystemTestCase
  setup do
    visit root_path
    fill_in 'Eメール', with: 'alice@example.com'
    fill_in 'パスワード', with: 'password'
    click_on 'ログイン'
  end

  test 'create report' do
    click_on '日報'
    click_on '新規作成'
    fill_in 'タイトル', with: 'test'
    fill_in '内容', with: 'testの内容'
    click_on '登録する'
    assert_text 'testの内容'
    assert_text '日報が作成されました'
  end

  test 'update report' do
    click_on '日報'
    click_on '編集'
    fill_in 'タイトル', with: '編集後のAliceの日報'
    fill_in '内容', with: '編集後のAliceの日報の内容'
    click_on '更新する'
    assert_text '編集後のAliceの日報'
    assert_text '日報が更新されました'
  end

  test 'delete report' do
    click_on '日報'
    page.accept_confirm do
      click_on '削除'
    end
    assert_text '日報が削除されました'
  end
end

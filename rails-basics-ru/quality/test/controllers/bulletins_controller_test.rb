# frozen_string_literal: true

require 'test_helper'

class BulletinsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bulletin = bulletins(:bulletin_one)
  end

  test 'should get index' do
    get bulletins_url
    assert_response :success
    assert_select 'h1', 'Bulletins'
  end

  test 'should get show' do
    get bulletin_url(@bulletin)
    assert_response :success
    assert_select 'p', 'body 1'
    assert_select 'h4', 'Title 1'
  end
end

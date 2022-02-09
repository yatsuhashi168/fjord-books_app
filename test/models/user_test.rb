# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test '#following?_and_#follow' do
    alice = users(:alice)
    bob = users(:bob)
    assert_not alice.following?(bob)
    alice.follow(bob)
    assert alice.following?(bob)
  end

  test '#followed_by?' do
    alice = users(:alice)
    bob = users(:bob)
    assert_not alice.followed_by?(bob)
    bob.follow(alice)
    assert alice.followed_by?(bob)
  end

  test '#unfollow' do
    alice = users(:alice)
    bob = users(:bob)
    alice.follow(bob)
    assert alice.following?(bob)
    alice.unfollow(bob)
    assert_not alice.following?(bob)
  end

  test '#name_or_email' do
    alice = users(:alice)
    assert_equal 'alice@example.com', alice.name_or_email
    alice.name = 'alice'
    assert_equal 'alice', alice.name_or_email
  end
end

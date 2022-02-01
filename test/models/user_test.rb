# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "#following?_and_#follow" do
    alice = users(:Alice)
    bob = users(:Bob)
    assert_not alice.following?(bob)
    alice.follow(bob)
    assert alice.following?(bob)
  end

  test "#followed_by?" do
    alice = users(:Alice)
    bob = users(:Bob)
    assert_not alice.followed_by?(bob)
    bob.follow(alice)
    assert alice.followed_by?(bob)
  end

  test "#unfollow" do
    alice = users(:Alice)
    bob = users(:Bob)
    alice.follow(bob)
    assert alice.following?(bob)
    alice.unfollow(bob)
    assert_not alice.following?(bob)
  end

  test "#name_or_email" do
    alice = users(:Alice)
    assert_equal alice.email, alice.name_or_email
    alice.name = alice
    assert_equal alice.name, alice.name_or_email
  end
end

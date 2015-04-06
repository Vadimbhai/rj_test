require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "user name must not be empty" do
    user = User.new
    assert user.invalid?
    assert user.errors[:name].any?
  end

  test "user name must be unique" do
    user = User.new(name: users(:petr).name)

    assert user.invalid?
  end
end

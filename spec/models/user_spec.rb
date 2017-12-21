require 'spec_helper'

class UserTest < ActiveSupport::TestCase

    def setup
    @user = User.new(first_name: "Example", last_name: "Example", email: "user@example.com")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "firs_name should be present" do
     @user.first_name = "     "
     assert_not @user.valid?
   end

  test "last_name should be present" do
    @user.last_name = "     "
    assert_not @user.valid?
  end

    test "email should be present" do
    @user.email = "     "
    assert_not @user.valid?
  end

    test "first_name should not be too long" do
    @user.first_name = "a" * 51
    assert_not @user.valid?
  end

    test "last_name should not be too long" do
    @user.last_name = "a" * 51
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email = "a" * 244 + "@example.com"
    assert_not @user.valid?
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end
end
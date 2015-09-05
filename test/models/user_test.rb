require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "standard user creation" do
    user = FactoryGirl.create(:user)
    assert_equal "Butch", user.first_name
  end

  test "admin user creation" do
    admin = FactoryGirl.create(:admin)
    assert_equal "Tyler", admin.first_name
  end

end

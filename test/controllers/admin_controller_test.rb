require 'test_helper'

class AdminControllerTest < ActionController::TestCase
  test "toggle to add admin" do
    admin = FactoryGirl.create(:admin)
    user = FactoryGirl.create(:user)
    sign_in admin

    patch :update, id: user.id, params: {admin: true}
    user.reload
    assert_equal user.admin, true

  end

  test "toggle remove admin" do
    admin = FactoryGirl.create(:admin)
    user = FactoryGirl.create(:user)
    sign_in admin

    patch :update, id: admin.id, params: {admin: false}
    user.reload
    assert_equal user.admin, false
  end

  test "renders Admin link in navbar" do
    admin = FactoryGirl.create(:admin)
    sign_in admin

    get :index
    assert_select "ul.navigation-links-wrapper" do
      assert_select "li", "Admin"
    end
  end

  test "does NOT render Admin link in navbar for normal user" do
    user = FactoryGirl.create(:user)
    sign_in user

    get :index
    assert_select "ul.navigation-links-wrapper" do
      assert_select "li" do
        assert_select "Admin", 0
      end
    end
  end

end

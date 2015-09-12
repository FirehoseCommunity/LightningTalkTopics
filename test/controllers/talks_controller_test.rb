require 'test_helper'

class TalksControllerTest < ActionController::TestCase

  test "do not add blank topics" do
    user = FactoryGirl.create(:user)
    sign_in user

    assert_no_difference "Talk.count" do
      post :create, talk: {
        topic: '',
        description: nil
      }
    end

  end
end

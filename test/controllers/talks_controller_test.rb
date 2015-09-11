require 'test_helper'

class TalksControllerTest < ActionController::TestCase

  test "no user upvote test" do
    # create talk to collect votes
    talk = FactoryGirl.create(:topic)

    # ensure no votes pass into talk when no user is signed in
    assert_no_difference "Talk.find(talk.id).votes.count" do
      post :upvote, :id => talk.id
    end

    # redirect to sign in page
    assert_redirected_to new_user_session_path
  end
  
end

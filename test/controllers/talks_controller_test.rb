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

  test "user has already upvoted" do
    # create talk to collect votes
    talk = FactoryGirl.create(:topic)

    # create user and sign in
    user = FactoryGirl.create(:user)
    sign_in user

    # first vote should go through and redirect to home page
    assert_difference "Talk.find(talk.id).votes.count" do
      post :upvote, :id => talk.id
    end

    assert_redirected_to talks_path

    # second vote should not go through and should still redirect to home page
    assert_no_difference "Talk.find(talk.id).votes.count" do
      post :upvote, :id => talk.id
    end

    assert_redirected_to talks_path
  end

end

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

  test "no user upvote test" do
    # create talk to collect votes
    talk = FactoryGirl.create(:topic)

    # ensure no votes pass into talk when no user is signed in
    assert_no_difference "Talk.find(talk.id).votes.count" do
      post :upvote, id: talk.id
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
      post :upvote, id: talk.id
    end

    assert_redirected_to talks_path

    # second vote should not go through and should still redirect to home page
    assert_no_difference "Talk.find(talk.id).votes.count" do
      post :upvote, id: talk.id
    end

    assert_redirected_to talks_path
  end

  test "must be signed in to assign talk" do
    talk = FactoryGirl.create(:topic)
    put :assign, id: talk.id
    assert_redirected_to new_user_session_path
    assert talk.assignee.nil?
  end

  test "must be correct user to unassign talk" do
    talk = FactoryGirl.create(:topic)
    user = FactoryGirl.create(:user)
    user.assign(talk)
    other_user = FactoryGirl.create(:user, email: 'other_user@example.com')
    sign_in other_user
    put :unassign, id: talk.id
    talk.reload
    assert_equal user, talk.assignee
  end

  test "can assign talk to self" do
    talk = FactoryGirl.create(:topic)
    user = FactoryGirl.create(:user)
    sign_in user
    put :assign, id: talk.id
    talk.reload
    assert_equal user, talk.assignee
  end
end

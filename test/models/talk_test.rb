require 'test_helper'

class TalkTest < ActiveSupport::TestCase
  test "create a topic" do
    talk = FactoryGirl.create(:topic)
    assert_equal "TDD", talk.topic
  end

  test "assign a topic to a person" do
    talk = FactoryGirl.create(:topic)
    user = FactoryGirl.create(:user)
    user.assign(talk)
    assert_equal user, talk.assignee
  end

  test "query for scheduled and unscheduled talks" do
    scheduled_talk = FactoryGirl.create(:topic)
    scheduled_talk.update_attributes(speak_date: Date.today + 5.days)
    unscheduled_talk = FactoryGirl.create(:topic)
    unscheduled_talks = Talk.unscheduled
    scheduled_talks = Talk.scheduled
    assert_not unscheduled_talks.include? scheduled_talk
    assert unscheduled_talks.include? unscheduled_talk
    assert_not scheduled_talks.include? unscheduled_talk
    assert scheduled_talks.include? scheduled_talk
  end
end


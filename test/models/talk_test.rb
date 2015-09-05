require 'test_helper'

class TalkTest < ActiveSupport::TestCase
  test "create a topic" do
    talk = FactoryGirl.create(:topic)
    assert_equal "TDD", talk.topic
  end

  test "assign a topic to a person" do
    talk = FactoryGirl.create(:topic)
    talk.update_attributes(is_assigned: true, assigned_to: "Tyler" )
    assert_equal true, talk.is_assigned
    assert_equal "Tyler", talk.assigned_to
  end
end

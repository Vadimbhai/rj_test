require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  test "Comment content must not be empty" do
    comment = Comment.new
    assert comment.invalid?
    assert comment.errors[:content].any?
  end

  test "comment must be attached to user" do
    comment = Comment.new
    assert comment.invalid?
    assert comment.errors[:user].any?

    user = User.new(name: "Tester")
    comment = user.comments.build(content: "Test content")
    assert comment.valid?
  end
end

require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  setup do
    @user = users(:petr)
    @comment = @user.comments.build(content: "Test text")
  end

  #test "should not get index" do
  #  get :index
  #  assert_response :redirect
  #end

  test "should get new" do
    get :new
    assert_select '#user_name', 1
    assert_select '#comment_content', 1
  end

  test "should create comment" do
    assert_difference('Comment.count') do
      post :create, {'comment' => {'content' => @comment.content}, 'user_name' => @user.name}
    end

    assert_redirected_to user_path(@user)
  end

  test "should create comment with AJAX" do
    assert_difference('Comment.count') do
      xhr :post, :create, {'comment' => {'content' => @comment.content, 'user_attributes' => {'id' => @user.id}}}
    end

    assert_response :success
  end

  #test "should destroy comment" do
  #  assert_difference('Comment.count', -1) do
  #    delete :destroy, id: @comment
  #  end
  #
  #  assert_redirected_to comments_path
  #end
end

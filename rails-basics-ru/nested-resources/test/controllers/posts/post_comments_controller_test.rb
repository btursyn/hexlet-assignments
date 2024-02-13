require 'test_helper'

class Posts::PostCommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one)
    @post_comment = post_comments(:one)
  end

  test "should create post comment" do
    assert_difference('PostComment.count') do
      post post_post_comments_url(@post), params: { post_comment: { comment: 'New comment' } }
    end

    assert_redirected_to post_url(@post)
    follow_redirect!
    assert_match 'Comment was successfully created.', response.body
  end

  test "should not create post comment with invalid params" do
    assert_no_difference('PostComment.count') do
      post post_post_comments_url(@post), params: { post_comment: { comment: '' } } # Assuming 'comment' can't be blank
    end

    assert_redirected_to post_url(@post)
    follow_redirect!
    assert_match 'Error creating comment.', response.body
  end
end

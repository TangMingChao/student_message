require 'test_helper'

class StudentsForumsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @students_forum = students_forums(:one)
  end

  test "should get index" do
    get students_forums_url
    assert_response :success
  end

  test "should get new" do
    get new_students_forum_url
    assert_response :success
  end

  test "should create students_forum" do
    assert_difference('StudentsForum.count') do
      post students_forums_url, params: { students_forum: { description: @students_forum.description, title: @students_forum.title } }
    end

    assert_redirected_to students_forum_url(StudentsForum.last)
  end

  test "should show students_forum" do
    get students_forum_url(@students_forum)
    assert_response :success
  end

  test "should get edit" do
    get edit_students_forum_url(@students_forum)
    assert_response :success
  end

  test "should update students_forum" do
    patch students_forum_url(@students_forum), params: { students_forum: { description: @students_forum.description, title: @students_forum.title } }
    assert_redirected_to students_forum_url(@students_forum)
  end

  test "should destroy students_forum" do
    assert_difference('StudentsForum.count', -1) do
      delete students_forum_url(@students_forum)
    end

    assert_redirected_to students_forums_url
  end
end

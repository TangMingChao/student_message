require 'test_helper'

class StudentsInfosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @students_info = students_infos(:one)
  end

  test "should get index" do
    get students_infos_url
    assert_response :success
  end

  test "should get new" do
    get new_students_info_url
    assert_response :success
  end

  test "should create students_info" do
    assert_difference('StudentsInfo.count') do
      post students_infos_url, params: { students_info: { address: @students_info.address, age: @students_info.age, avatar: @students_info.avatar, birthday: @students_info.birthday, email: @students_info.email, name: @students_info.name, number: @students_info.number, phone: @students_info.phone, qq: @students_info.qq, sex: @students_info.sex } }
    end

    assert_redirected_to students_info_url(StudentsInfo.last)
  end

  test "should show students_info" do
    get students_info_url(@students_info)
    assert_response :success
  end

  test "should get edit" do
    get edit_students_info_url(@students_info)
    assert_response :success
  end

  test "should update students_info" do
    patch students_info_url(@students_info), params: { students_info: { address: @students_info.address, age: @students_info.age, avatar: @students_info.avatar, birthday: @students_info.birthday, email: @students_info.email, name: @students_info.name, number: @students_info.number, phone: @students_info.phone, qq: @students_info.qq, sex: @students_info.sex } }
    assert_redirected_to students_info_url(@students_info)
  end

  test "should destroy students_info" do
    assert_difference('StudentsInfo.count', -1) do
      delete students_info_url(@students_info)
    end

    assert_redirected_to students_infos_url
  end
end

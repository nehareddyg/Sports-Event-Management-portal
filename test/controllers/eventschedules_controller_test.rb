require 'test_helper'

class EventschedulesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @eventschedule = eventschedules(:one)
  end

  test "should get index" do
    get eventschedules_url
    assert_response :success
  end

  test "should get new" do
    get new_eventschedule_url
    assert_response :success
  end

  test "should create eventschedule" do
    assert_difference('Eventschedule.count') do
      post eventschedules_url, params: { eventschedule: {  } }
    end

    assert_redirected_to eventschedule_url(Eventschedule.last)
  end

  test "should show eventschedule" do
    get eventschedule_url(@eventschedule)
    assert_response :success
  end

  test "should get edit" do
    get edit_eventschedule_url(@eventschedule)
    assert_response :success
  end

  test "should update eventschedule" do
    patch eventschedule_url(@eventschedule), params: { eventschedule: {  } }
    assert_redirected_to eventschedule_url(@eventschedule)
  end

  test "should destroy eventschedule" do
    assert_difference('Eventschedule.count', -1) do
      delete eventschedule_url(@eventschedule)
    end

    assert_redirected_to eventschedules_url
  end
end

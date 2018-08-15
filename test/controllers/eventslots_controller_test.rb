require 'test_helper'

class EventslotsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @eventslot = eventslots(:one)
  end

  test "should get index" do
    get eventslots_url
    assert_response :success
  end

  test "should get new" do
    get new_eventslot_url
    assert_response :success
  end

  test "should create eventslot" do
    assert_difference('Eventslot.count') do
      post eventslots_url, params: { eventslot: {  } }
    end

    assert_redirected_to eventslot_url(Eventslot.last)
  end

  test "should show eventslot" do
    get eventslot_url(@eventslot)
    assert_response :success
  end

  test "should get edit" do
    get edit_eventslot_url(@eventslot)
    assert_response :success
  end

  test "should update eventslot" do
    patch eventslot_url(@eventslot), params: { eventslot: {  } }
    assert_redirected_to eventslot_url(@eventslot)
  end

  test "should destroy eventslot" do
    assert_difference('Eventslot.count', -1) do
      delete eventslot_url(@eventslot)
    end

    assert_redirected_to eventslots_url
  end
end

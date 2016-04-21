require 'test_helper'

class VisitSchedulesControllerTest < ActionController::TestCase
  setup do
    @visit_schedule = visit_schedules(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:visit_schedules)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create visit_schedule" do
    assert_difference('VisitSchedule.count') do
      post :create, visit_schedule: { date: @visit_schedule.date, email: @visit_schedule.email, name: @visit_schedule.name, phone: @visit_schedule.phone, time: @visit_schedule.time }
    end

    assert_redirected_to visit_schedule_path(assigns(:visit_schedule))
  end

  test "should show visit_schedule" do
    get :show, id: @visit_schedule
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @visit_schedule
    assert_response :success
  end

  test "should update visit_schedule" do
    patch :update, id: @visit_schedule, visit_schedule: { date: @visit_schedule.date, email: @visit_schedule.email, name: @visit_schedule.name, phone: @visit_schedule.phone, time: @visit_schedule.time }
    assert_redirected_to visit_schedule_path(assigns(:visit_schedule))
  end

  test "should destroy visit_schedule" do
    assert_difference('VisitSchedule.count', -1) do
      delete :destroy, id: @visit_schedule
    end

    assert_redirected_to visit_schedules_path
  end
end

class PagesController < ApplicationController
  # before_action :authenticate_user!
  def home
		if current_user.present? && current_user.adminflag==1 then
			render 'pages/adminindex'
		else
			render 'pages/index'
		end
  end

  def viewAllEvents
  	if current_user.present? && current_user.adminflag==1 then
  		@events_grid = initialize_grid(Event.all)
      # @events = Event.all
      render 'pages/viewallevents'
    else
  		render 'pages/index'
		end
  end

  def viewFeedback
    if current_user.present? && current_user.adminflag==1 then
  		@feedbacks_grid = initialize_grid(Feedback.all)
      # @events = Event.all
      render 'pages/viewfeedback'
    else
  		render 'pages/index'
		end
  end

  def viewQueries
    if current_user.present? && current_user.adminflag==1 then
  		@queries_grid = initialize_grid(Query.all)
      # @events = Event.all
      render 'pages/viewqueries'
    else
  		render 'pages/index'
		end
  end

  def viewEventSchedule
    if current_user.present? && current_user.adminflag==1 then
      @eventschedule_grid = initialize_grid(Eventschedule.all)
      # @events = Event.all
      render 'pages/vieweventschedule'
    else
      render 'pages/index'
    end
  end

  def viewEventSlots
      @eventslot_grid = initialize_grid(Eventslot.where(eventschedule_id: pages_params[:event_schedule_id]))
      render 'pages/vieweventslots'
  end


  private
    # Use callbacks to share common setup or constraints between actions.


    # Never trust parameters from the scary internet, only allow the white list through.
    def pages_params
      # params.require(:feedback).permit(:event_name,:feedback)
      params.permit(:event_schedule_id)
    end

end

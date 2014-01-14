class EventsController < InheritedResources::Base
  belongs_to :user

  before_filter :owner_require_login

  def permitted_params
    params.permit(:event => [:name, :date, :event_period_id])
  end

  def calendar
    @calendar = CalendarService.get_calendar_for(current_user.events)
  end

  protected

    def collection
      @events = super
      @events = Event.all if params[:all]
    end

end

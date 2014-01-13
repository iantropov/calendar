class EventsController < InheritedResources::Base
  belongs_to :user

  before_filter :owner_require_login

  def permitted_params
    params.permit(:event => [:name, :date])
  end

end

class UsersController < InheritedResources::Base

  before_filter :owner_require_login, :only => [:update, :edit, :destroy]
  before_filter :require_login,       :only => [:index]

  private

    def permitted_params
      params.permit(:user => [:name, :email, :password])
    end

end

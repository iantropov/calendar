class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

    def not_authenticated
      redirect_to login_url, :alert => t("alerts.session.require_login")
    end

    def owner_require_login
      unless logged_in? and params[user_id].to_s == current_user.id.to_s
        session[:return_to_url] = request.url if Config.save_return_to_url && request.get? && request.url != login_url
        self.send(Config.not_authenticated_action)
      end
    end

    def user_id
      params[:controller] == "users" ? :id : :user_id
    end

end

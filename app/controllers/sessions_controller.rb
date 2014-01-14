class SessionsController < ApplicationController
  before_filter :require_login, :only => [:destroy]

  def new
  end

  def create
    user = login(params[:email], params[:password])
    if user
      redirect_to root_url, :notice => t("alerts.session.logged_in")
    else
      redirect_to login_url, :alert => t("alerts.session.invalid_login")
    end
  end

  def destroy
    logout
    redirect_to root_url, :notice => t("alerts.session.logged_out")
  end

end

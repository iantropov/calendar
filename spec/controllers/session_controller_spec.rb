require 'spec_helper'

describe SessionsController do
  describe "GET new" do
    it "returns login form" do
      get :new
      response.should be_success
    end
  end

  describe "POST login" do
    it "logins with valid credentials" do
      user = create(:user, :password => "12345")
      post :create, :email => user.email, :password => "12345"
      response.should redirect_to(root_url)
      flash[:notice].should be_eql(I18n.t("alerts.session.logged_in"))
    end
  end

  describe "DELETE logout" do
    it "logins with valid credentials" do
      user = create(:user)
      login_user(user)
      delete :destroy
      response.should redirect_to(root_url)
      flash[:notice].should be_eql(I18n.t("alerts.session.logged_out"))
    end
  end

end

require 'spec_helper'

describe UsersController do
  let(:user)             { create(:user) }
  let(:valid_attributes) { attributes_for(:user) }

  describe "GET index", :login do
    it "assigns all users as @users" do
      get :index
      expect(response.status).to eq(200)
      assigns(:users).should =~ [@loginned_user]
    end
  end

  describe "GET show" do
    it "assigns single user as @user" do
      get :show, { :id => user.to_param }
      expect(response.status).to eq(200)
      assigns(:user).should eq(user)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new user" do
        expect {
          post :create, :user => valid_attributes
        }.to change(User, :count).by(1)
        expect(response.status).to eq(302)
      end
    end
    describe "with invalid params" do
      it "does not create a record" do
        expect {
          post :create, :user => { :name => "" }
        }.to_not change(User, :count)
        assigns(:user).should be_a_new(User)
        expect(response.status).to eq(200)
      end
    end
  end

  describe "PUT update", :login do
    describe "with valid params" do
      it "updates the record" do
        User.any_instance.should_receive(:update_attributes).with("name" => "new name")
        put :update, id: @loginned_user.to_param, :user => {"name" => "new name"}
        expect(response.status).to eq(302)
      end
    end
  end

  describe "DELETE destroy", :login do
    it "destroys the user" do
      user
      expect {
        delete :destroy, { :id => @loginned_user.to_param }
      }.to change(User, :count).by(-1)
      expect(response.status).to eq(302)
    end
  end
end

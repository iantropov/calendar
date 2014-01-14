require 'spec_helper'

describe EventsController do
  let(:event)            { create(:event, :user => @loginned_user) }
  let(:valid_attributes) { build(:event).attributes.symbolize_keys }
  let(:user_params)      { { :user_id => @loginned_user.id } }

  describe "GET index", :login do
    it "assigns events of @loginned_user" do
      events = create_list(:event, 5, :user => @loginned_user)
      get :index, user_params
      expect(response.status).to eq(200)
      assigns(:events).should =~ events
    end

    it "assigns all events as @events" do
      events_1 = create_list(:event, 5, :user => @loginned_user)
      events_2 = create_list(:event, 5, :user => create(:user))
      get :index, user_params.merge(:all => true)
      expect(response.status).to eq(200)
      assigns(:events).should =~ events_1 + events_2
    end

  end

  describe "GET calendar", :login do
    it "assigns calendar for @loginned_user" do
      event = create(:event, :user => @loginned_user)
      get :calendar, user_params
      expect(response.status).to eq(200)
      assigns(:calendar).should_not be_empty
    end

    it "assigns all events as @events" do
      events_1 = create_list(:event, 5, :user => @loginned_user)
      events_2 = create_list(:event, 5, :user => create(:user))
      get :index, user_params.merge(:all => true)
      expect(response.status).to eq(200)
      assigns(:events).should =~ events_1 + events_2
    end

  end

  describe "GET show", :login do
    it "assigns single event as @event" do
      get :show, user_params.merge({ :id => event.to_param })
      expect(response.status).to eq(200)
      assigns(:event).should eq(event)
    end
  end

  describe "POST create", :login do
    describe "with valid params" do
      it "creates a new event" do
        expect {
          post :create, user_params.merge(:event => valid_attributes)
        }.to change(Event, :count).by(1)
        expect(response.status).to eq(302)
      end
    end
    describe "with invalid params" do
      it "does not create a record" do
        expect {
          post :create, user_params.merge(:event => { :name => "c" })
        }.to_not change(Event, :count)
        assigns(:event).should be_a_new(Event)
        expect(response.status).to eq(200)
      end
    end
  end

  describe "PUT update", :login do
    describe "with valid params" do
      it "updates the record" do
        Event.any_instance.should_receive(:update_attributes).with("name" => "new name")
        put :update, user_params.merge(:id => event.to_param, :event => { :name => "new name" })
        expect(response.status).to eq(302)
      end
    end
  end

  describe "DELETE 'destroy'", :login do
    it "destroys the event" do
      event
      expect {
        delete :destroy, user_params.merge(:id => event.to_param)
      }.to change(Event, :count).by(-1)
      expect(response.status).to eq(302)
    end
  end
end

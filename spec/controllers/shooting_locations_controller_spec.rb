require 'rails_helper'

RSpec.describe ShootingLocationsController, type: :controller do
  login_user

  let(:valid_attributes) {
    attributes_for(:shooting_location)
  }

  let(:invalid_attributes) {
    { foo: 'bar' }
  }

  describe "GET #index" do
    it "returns a success response" do
      create(:shooting_location, user: @current_user)
      get :index, params: {}
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      shooting_location = create(:shooting_location, user: @current_user)
      get :show, params: {id: shooting_location.to_param}
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      shooting_location = create(:shooting_location, user: @current_user)
      get :edit, params: {id: shooting_location.to_param}
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new ShootingLocation" do
        expect {
          post :create, params: {shooting_location: valid_attributes}
        }.to change(ShootingLocation, :count).by(1)
      end

      it "redirects to the created shooting_location" do
        post :create, params: {shooting_location: valid_attributes}
        expect(response).to redirect_to(ShootingLocation.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {shooting_location: invalid_attributes}
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { name: 'TEST' }
      }

      it "updates the requested shooting_location" do
        shooting_location = create(:shooting_location, user: @current_user)
        put :update, params: {id: shooting_location.to_param, shooting_location: new_attributes}
        shooting_location.reload
        expect(shooting_location.name).to eq('TEST')
      end

      it "redirects to the shooting_location" do
        shooting_location = create(:shooting_location, user: @current_user)
        put :update, params: {id: shooting_location.to_param, shooting_location: valid_attributes}
        expect(response).to redirect_to(shooting_location)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        shooting_location = create(:shooting_location, user: @current_user)
        put :update, params: {id: shooting_location.to_param, shooting_location: invalid_attributes}
        expect(response).to redirect_to(shooting_location)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested shooting_location" do
      shooting_location = create(:shooting_location, user: @current_user)
      expect {
        delete :destroy, params: {id: shooting_location.to_param}
      }.to change(ShootingLocation, :count).by(-1)
    end

    it "redirects to the shooting_locations list" do
      shooting_location = create(:shooting_location, user: @current_user)
      delete :destroy, params: {id: shooting_location.to_param}
      expect(response).to redirect_to(shooting_locations_url)
    end
  end

end

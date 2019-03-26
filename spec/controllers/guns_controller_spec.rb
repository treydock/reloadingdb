require 'rails_helper'

RSpec.describe GunsController, type: :controller do
  login_user

  let(:valid_attributes) {
    attributes_for(:gun, caliber_id: create(:caliber).id)
  }

  let(:invalid_attributes) {
    { foo: 'bar' }
  }

  describe "GET #index" do
    it "returns a success response" do
      create(:gun, user: @current_user)
      get :index, params: {}
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      gun = create(:gun, user: @current_user)
      get :show, params: {id: gun.to_param}
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
      gun = create(:gun, user: @current_user)
      get :edit, params: {id: gun.to_param}
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Gun" do
        expect {
          post :create, params: {gun: valid_attributes}
        }.to change(Gun, :count).by(1)
      end

      it "redirects to the created gun" do
        post :create, params: {gun: valid_attributes}
        expect(response).to redirect_to(Gun.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {gun: invalid_attributes}
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { name: 'TEST' }
      }

      it "updates the requested gun" do
        gun = create(:gun, user: @current_user)
        put :update, params: {id: gun.to_param, gun: new_attributes}
        gun.reload
        expect(gun.name).to eq('TEST')
      end

      it "redirects to the gun" do
        gun = create(:gun, user: @current_user)
        put :update, params: {id: gun.to_param, gun: new_attributes}
        expect(response).to redirect_to(gun)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        gun = create(:gun, user: @current_user)
        put :update, params: {id: gun.to_param, gun: invalid_attributes}
        expect(response).to redirect_to(gun)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested gun" do
      gun = create(:gun, user: @current_user)
      expect {
        delete :destroy, params: {id: gun.to_param}
      }.to change(Gun, :count).by(-1)
    end

    it "redirects to the guns list" do
      gun = create(:gun, user: @current_user)
      delete :destroy, params: {id: gun.to_param}
      expect(response).to redirect_to(guns_url)
    end
  end

end

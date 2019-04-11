require 'rails_helper'

RSpec.describe CalibersController, type: :controller do
  login_user

  let(:valid_attributes) {
    attributes_for(:caliber)
  }

  let(:invalid_attributes) {
    { foo: 'bar' }
  }

  describe "GET #index" do
    it "returns a success response" do
      create(:caliber, user: @current_user)
      get :index, params: {}
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      caliber = create(:caliber, user: @current_user)
      get :show, params: {id: caliber.to_param}
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
      caliber = create(:caliber, user: @current_user)
      get :edit, params: {id: caliber.to_param}
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Caliber" do
        expect {
          post :create, params: {caliber: valid_attributes}
        }.to change(Caliber, :count).by(1)
      end

      it "redirects to the created caliber" do
        post :create, params: {caliber: valid_attributes}
        expect(response).to redirect_to(Caliber.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {caliber: invalid_attributes}
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { name: 'TEST' }
      }

      it "updates the requested caliber" do
        caliber = create(:caliber, user: @current_user)
        put :update, params: {id: caliber.to_param, caliber: new_attributes}
        caliber.reload
        expect(caliber.name).to eq('TEST')
      end

      it "redirects to the caliber" do
        caliber = create(:caliber, user: @current_user)
        put :update, params: {id: caliber.to_param, caliber: new_attributes}
        expect(response).to redirect_to(caliber)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        caliber = create(:caliber, user: @current_user)
        put :update, params: {id: caliber.to_param, caliber: invalid_attributes}
        expect(response).to redirect_to(caliber)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested caliber" do
      caliber = create(:caliber, user: @current_user)
      expect {
        delete :destroy, params: {id: caliber.to_param}
      }.to change(Caliber, :count).by(-1)
    end

    it "redirects to the calibers list" do
      caliber = create(:caliber, user: @current_user)
      delete :destroy, params: {id: caliber.to_param}
      expect(response).to redirect_to(calibers_url)
    end
  end

  include_examples 'DiscardController'
end

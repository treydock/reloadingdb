require 'rails_helper'

RSpec.describe ShootingLogsController, type: :controller do
  login_user

  let(:valid_attributes) {
    attributes_for(:shooting_log, shooting_location_id: create(:shooting_location).id)
  }

  let(:invalid_attributes) {
    { foo: 'bar' }
  }

  describe "GET #index" do
    it "returns a success response" do
      create(:shooting_log, user: @current_user)
      get :index, params: {}
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      shooting_log = create(:shooting_log, user: @current_user)
      get :show, params: {id: shooting_log.to_param}
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
      shooting_log = create(:shooting_log, user: @current_user)
      get :edit, params: {id: shooting_log.to_param}
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new ShootingLog" do
        expect {
          post :create, params: {shooting_log: valid_attributes}
        }.to change(ShootingLog, :count).by(1)
      end

      it "redirects to the created shooting_log" do
        post :create, params: {shooting_log: valid_attributes}
        expect(response).to redirect_to(ShootingLog.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {shooting_log: invalid_attributes}
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { notes: 'TEST' }
      }

      it "updates the requested shooting_log" do
        shooting_log = create(:shooting_log, user: @current_user)
        put :update, params: {id: shooting_log.to_param, shooting_log: new_attributes}
        shooting_log.reload
        expect(shooting_log.notes).to eq('TEST')
      end

      it "redirects to the shooting_log" do
        shooting_log = create(:shooting_log, user: @current_user)
        put :update, params: {id: shooting_log.to_param, shooting_log: valid_attributes}
        expect(response).to redirect_to(shooting_log)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        shooting_log = create(:shooting_log, user: @current_user)
        put :update, params: {id: shooting_log.to_param, shooting_log: invalid_attributes}
        expect(response).to redirect_to(shooting_log)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested shooting_log" do
      shooting_log = create(:shooting_log, user: @current_user)
      expect {
        delete :destroy, params: {id: shooting_log.to_param}
      }.to change(ShootingLog, :count).by(-1)
    end

    it "redirects to the shooting_logs list" do
      shooting_log = create(:shooting_log, user: @current_user)
      delete :destroy, params: {id: shooting_log.to_param}
      expect(response).to redirect_to(shooting_logs_url)
    end
  end

  include_examples 'DiscardController'
end

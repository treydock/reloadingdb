# frozen_string_literal: true

require "rails_helper"

RSpec.describe ShootingGroupsController, type: :controller do
  login_user

  let(:valid_attributes) {
    attributes_for(:shooting_group,
                   shooting_log_id: create(:shooting_log).id,
                   caliber_id: create(:caliber).id,
                   load_id: create(:load).id)
  }

  let(:invalid_attributes) {
    { foo: "bar" }
  }

  describe "GET #index" do
    it "returns a success response" do
      get :index, params: {}
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      shooting_group = create(:shooting_group, user: @current_user)
      get :show, params: { id: shooting_group.to_param }
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
      shooting_group = create(:shooting_group, user: @current_user)
      get :edit, params: { id: shooting_group.to_param }
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new ShootingGroup" do
        expect {
          post :create, params: { shooting_group: valid_attributes }
        }.to change(ShootingGroup, :count).by(1)
      end

      it "redirects to the created shooting_group" do
        post :create, params: { shooting_group: valid_attributes }
        expect(response).to redirect_to(ShootingGroup.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: { shooting_group: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { shots: 6 }
      }

      it "updates the requested shooting_group" do
        shooting_group = create(:shooting_group, user: @current_user, shots: 5)
        put :update, params: { id: shooting_group.to_param, shooting_group: new_attributes }
        shooting_group.reload
        expect(shooting_group.shots).to eq(6)
      end

      it "redirects to the shooting_group" do
        shooting_group = create(:shooting_group, user: @current_user)
        put :update, params: { id: shooting_group.to_param, shooting_group: new_attributes }
        expect(response).to redirect_to(shooting_group)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        shooting_group = create(:shooting_group, user: @current_user)
        put :update, params: { id: shooting_group.to_param, shooting_group: invalid_attributes }
        expect(response).to redirect_to(shooting_group)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested shooting_group" do
      shooting_group = create(:shooting_group, user: @current_user)
      expect {
        delete :destroy, params: { id: shooting_group.to_param }
      }.to change(ShootingGroup, :count).by(-1)
    end

    it "redirects to the shooting_groups list" do
      shooting_group = create(:shooting_group, user: @current_user)
      delete :destroy, params: { id: shooting_group.to_param }
      expect(response).to redirect_to(shooting_groups_url)
    end
  end

  describe "GET #next_number" do
    it "should respond with JSON" do
      get :next_number, params: {}
      expect(response.body).to eq({ next_number: 1 }.to_json)
    end
  end

  describe "GET #clone" do
    it "returns a success response" do
      shooting_group = create(:shooting_group, user: @current_user)
      get :clone, params: { id: shooting_group.id }
      expect(response).to be_successful
    end
  end

  include_examples "DiscardController"
end

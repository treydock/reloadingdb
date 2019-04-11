# frozen_string_literal: true

require "rails_helper"

RSpec.describe BulletsController, type: :controller do
  login_user

  let(:valid_attributes) {
    attributes_for(:bullet, caliber_id: create(:caliber).id)
  }

  let(:invalid_attributes) {
    { foo: "bar" }
  }

  describe "GET #index" do
    it "returns a success response" do
      create(:bullet, user: @current_user)
      get :index, params: {}
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      bullet = create(:bullet, user: @current_user)
      get :show, params: { id: bullet.to_param }
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
      bullet = create(:bullet, user: @current_user)
      get :edit, params: { id: bullet.to_param }
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Bullet" do
        expect {
          post :create, params: { bullet: valid_attributes }
        }.to change(Bullet, :count).by(1)
      end

      it "redirects to the created bullet" do
        post :create, params: { bullet: valid_attributes }
        expect(response).to redirect_to(Bullet.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: { bullet: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { name: "TEST" }
      }

      it "updates the requested bullet" do
        bullet = create(:bullet, user: @current_user)
        put :update, params: { id: bullet.to_param, bullet: new_attributes }
        bullet.reload
        expect(bullet.name).to eq("TEST")
      end

      it "redirects to the bullet" do
        bullet = create(:bullet, user: @current_user)
        put :update, params: { id: bullet.to_param, bullet: new_attributes }
        expect(response).to redirect_to(bullet)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        bullet = create(:bullet, user: @current_user)
        put :update, params: { id: bullet.to_param, bullet: invalid_attributes }
        expect(response).to redirect_to(bullet)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested bullet" do
      bullet = create(:bullet, user: @current_user)
      expect {
        delete :destroy, params: { id: bullet.to_param }
      }.to change(Bullet, :count).by(-1)
    end

    it "redirects to the bullets list" do
      bullet = create(:bullet, user: @current_user)
      delete :destroy, params: { id: bullet.to_param }
      expect(response).to redirect_to(bullets_url)
    end
  end

  include_examples "DiscardController"
end

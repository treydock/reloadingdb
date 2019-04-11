require 'rails_helper'

RSpec.describe ShootingVelocitiesController, type: :controller do
  login_user

  let(:valid_attributes) {
    attributes_for(:shooting_velocity,
                   caliber_id: create(:caliber).id,
                   load_id: create(:load).id)
  }

  let(:invalid_attributes) {
    { foo: 'bar' }
  }

  describe "GET #index" do
    it "returns a success response" do
      shooting_velocity = create(:shooting_velocity, user: @current_user)
      get :index, params: {}
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      shooting_velocity = create(:shooting_velocity, user: @current_user)
      get :show, params: {id: shooting_velocity.to_param}
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
      shooting_velocity = create(:shooting_velocity, user: @current_user)
      get :edit, params: {id: shooting_velocity.to_param}
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new ShootingVelocity" do
        expect {
          post :create, params: {shooting_velocity: valid_attributes}
        }.to change(ShootingVelocity, :count).by(1)
      end

      it "redirects to the created shooting_velocity" do
        post :create, params: {shooting_velocity: valid_attributes}
        expect(response).to redirect_to(ShootingVelocity.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {shooting_velocity: invalid_attributes}
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {velocities: [2000]}
      }

      it "updates the requested shooting_velocity" do
        shooting_velocity = create(:shooting_velocity, user: @current_user, velocities: [1000])
        put :update, params: {id: shooting_velocity.to_param, shooting_velocity: new_attributes}
        shooting_velocity.reload
        expect(shooting_velocity.velocities).to eq([2000])
      end

      it "redirects to the shooting_velocity" do
        shooting_velocity = create(:shooting_velocity, user: @current_user)
        put :update, params: {id: shooting_velocity.to_param, shooting_velocity: new_attributes}
        expect(response).to redirect_to(shooting_velocity)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        shooting_velocity = create(:shooting_velocity, user: @current_user)
        put :update, params: {id: shooting_velocity.to_param, shooting_velocity: invalid_attributes}
        expect(response).to redirect_to(shooting_velocity)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested shooting_velocity" do
      shooting_velocity = create(:shooting_velocity, user: @current_user)
      expect {
        delete :destroy, params: {id: shooting_velocity.to_param}
      }.to change(ShootingVelocity, :count).by(-1)
    end

    it "redirects to the shooting_velocities list" do
      shooting_velocity = create(:shooting_velocity, user: @current_user)
      delete :destroy, params: {id: shooting_velocity.to_param}
      expect(response).to redirect_to(shooting_velocities_url)
    end
  end

  include_examples 'DiscardController'
end

require 'rails_helper'

RSpec.describe BrassesController, type: :controller do
  login_user

  let(:valid_attributes) {
    attributes_for(:brass, caliber_id: create(:caliber).id)
  }

  let(:invalid_attributes) {
    { foo: 'bar' }
  }

  describe "GET #index" do
    it "requires login" do
      sign_out @current_user
      create(:brass, user: @current_user)
      get :index, params: {}
      expect(response).to redirect_to(new_user_session_url)
    end
    it "returns a success response" do
      create(:brass, user: @current_user)
      get :index, params: {}
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      brass = create(:brass, user: @current_user)
      get :show, params: {id: brass.to_param}
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
      brass = create(:brass, user: @current_user)
      get :edit, params: {id: brass.to_param}
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Brass" do
        expect {
          post :create, params: {brass: valid_attributes}
        }.to change(Brass, :count).by(1)
      end

      it "redirects to the created brass" do
        brass = build(:brass)
        post :create, params: {brass: valid_attributes}
        expect(response).to redirect_to(Brass.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {brass: invalid_attributes}
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { name: 'TEST' }
      }

      it "updates the requested brass" do
        brass = create(:brass, user: @current_user)
        put :update, params: {id: brass.to_param, brass: new_attributes}
        brass.reload
        expect(brass.name).to eq('TEST')
      end

      it "redirects to the brass" do
        brass = create(:brass, user: @current_user)
        put :update, params: {id: brass.to_param, brass: new_attributes}
        expect(response).to redirect_to(brass)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        brass = create(:brass, user: @current_user)
        put :update, params: {id: brass.to_param, brass: invalid_attributes}
        expect(response).to redirect_to(brass)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested brass" do
      brass = create(:brass, user: @current_user)
      expect {
        delete :destroy, params: {id: brass.to_param}
      }.to change(Brass, :count).by(-1)
    end

    it "redirects to the brasses list" do
      brass = create(:brass, user: @current_user)
      delete :destroy, params: {id: brass.to_param}
      expect(response).to redirect_to(brasses_url)
    end
  end

  include_examples 'DiscardController'
end

require 'rails_helper'

RSpec.describe PrimersController, type: :controller do
  login_user

  let(:valid_attributes) {
    attributes_for(:primer)
  }

  let(:invalid_attributes) {
    { foo: 'bar' }
  }

  describe "GET #index" do
    it "returns a success response" do
      create(:primer, user: @current_user)
      get :index, params: {}
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      primer = create(:primer, user: @current_user)
      get :show, params: {id: primer.to_param}
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
      primer = create(:primer, user: @current_user)
      get :edit, params: {id: primer.to_param}
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Primer" do
        expect {
          post :create, params: {primer: valid_attributes}
        }.to change(Primer, :count).by(1)
      end

      it "redirects to the created primer" do
        post :create, params: {primer: valid_attributes}
        expect(response).to redirect_to(Primer.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {primer: invalid_attributes}
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { name: 'TEST' }
      }

      it "updates the requested primer" do
        primer = create(:primer, user: @current_user)
        put :update, params: {id: primer.to_param, primer: new_attributes}
        primer.reload
        expect(primer.name).to eq('TEST')
      end

      it "redirects to the primer" do
        primer = create(:primer, user: @current_user)
        put :update, params: {id: primer.to_param, primer: new_attributes}
        expect(response).to redirect_to(primer)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        primer = create(:primer, user: @current_user)
        put :update, params: {id: primer.to_param, primer: invalid_attributes}
        expect(response).to redirect_to(primer)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested primer" do
      primer = create(:primer, user: @current_user)
      expect {
        delete :destroy, params: {id: primer.to_param}
      }.to change(Primer, :count).by(-1)
    end

    it "redirects to the primers list" do
      primer = create(:primer, user: @current_user)
      delete :destroy, params: {id: primer.to_param}
      expect(response).to redirect_to(primers_url)
    end
  end

end

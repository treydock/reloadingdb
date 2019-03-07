require 'rails_helper'

RSpec.describe PowdersController, type: :controller do
  login_user

  let(:valid_attributes) {
    attributes_for(:powder)
  }

  let(:invalid_attributes) {
    { foo: 'bar' }
  }

  describe "GET #index" do
    it "returns a success response" do
      create(:powder, user: @current_user)
      get :index, params: {}
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      powder = create(:powder, user: @current_user)
      get :show, params: {id: powder.to_param}
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
      powder = create(:powder, user: @current_user)
      get :edit, params: {id: powder.to_param}
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Powder" do
        expect {
          post :create, params: {powder: valid_attributes}
        }.to change(Powder, :count).by(1)
      end

      it "redirects to the created powder" do
        post :create, params: {powder: valid_attributes}
        expect(response).to redirect_to(Powder.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {powder: invalid_attributes}
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { name: 'TEST' }
      }

      it "updates the requested powder" do
        powder = create(:powder, user: @current_user)
        put :update, params: {id: powder.to_param, powder: new_attributes}
        powder.reload
        expect(powder.name).to eq('TEST')
      end

      it "redirects to the powder" do
        powder = create(:powder, user: @current_user)
        put :update, params: {id: powder.to_param, powder: new_attributes}
        expect(response).to redirect_to(powder)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        powder = create(:powder, user: @current_user)
        put :update, params: {id: powder.to_param, powder: invalid_attributes}
        expect(response).to redirect_to(powder)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested powder" do
      powder = create(:powder, user: @current_user)
      expect {
        delete :destroy, params: {id: powder.to_param}
      }.to change(Powder, :count).by(-1)
    end

    it "redirects to the powders list" do
      powder = create(:powder, user: @current_user)
      delete :destroy, params: {id: powder.to_param}
      expect(response).to redirect_to(powders_url)
    end
  end

end

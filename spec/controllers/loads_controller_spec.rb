require 'rails_helper'

RSpec.describe LoadsController, type: :controller do
  login_user

  let(:valid_attributes) {
    attributes_for(:load,
      caliber_id: create(:caliber).id,
      brass_id: create(:brass).id,
      bullet_id: create(:bullet).id,
      powder_id: create(:powder).id,
      primer_id: create(:primer).id
    )
  }

  let(:invalid_attributes) {
    { foo: 'bar' }
  }

  describe "GET #index" do
    it "returns a success response" do
      create(:load, user: @current_user)
      get :index, params: {}
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      load = create(:load, user: @current_user)
      get :show, params: {id: load.to_param}
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
      load = create(:load, user: @current_user)
      get :edit, params: {id: load.to_param}
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Load" do
        expect {
          post :create, params: {load: valid_attributes}
        }.to change(Load, :count).by(1)
      end

      it "redirects to the created load" do
        post :create, params: {load: valid_attributes}
        expect(response).to redirect_to(Load.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {load: invalid_attributes}
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { col: 5.0 }
      }

      it "updates the requested load" do
        load = create(:load, user: @current_user)
        put :update, params: {id: load.to_param, load: new_attributes}
        load.reload
        expect(load.col).to eq(5.0)
      end

      it "redirects to the load" do
        load = create(:load, user: @current_user)
        put :update, params: {id: load.to_param, load: new_attributes}
        expect(response).to redirect_to(load)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        load = create(:load, user: @current_user)
        put :update, params: {id: load.to_param, load: invalid_attributes}
        expect(response).to redirect_to(load)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested load" do
      load = create(:load, user: @current_user)
      expect {
        delete :destroy, params: {id: load.to_param}
      }.to change(Load, :count).by(-1)
    end

    it "redirects to the loads list" do
      load = create(:load, user: @current_user)
      delete :destroy, params: {id: load.to_param}
      expect(response).to redirect_to(loads_url)
    end
  end

end

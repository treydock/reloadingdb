# frozen_string_literal: true

shared_examples "DiscardController" do
  describe "GET #discard" do
    it "returns a success response" do
      obj = create(subject.controller_name.singularize.to_sym, user: @current_user)
      get :discard, params: { id: obj.id }, format: :js, xhr: :get
      expect(response).to be_successful
    end
  end

  describe "PATCH #discard" do
    it "mark object as discarded" do
      obj = create(subject.controller_name.singularize.to_sym, user: @current_user)
      patch :discard, params: { id: obj.id }
      obj.reload
      expect(obj.discarded?).to eq(true)
    end
    it "redirects to object" do
      obj = create(subject.controller_name.singularize.to_sym, user: @current_user)
      patch :discard, params: { id: obj.id }
      expect(response).to redirect_to(obj)
    end
  end

  describe "GET #delete" do
    it "returns a success response" do
      obj = create(subject.controller_name.singularize.to_sym, user: @current_user)
      get :delete, params: { id: obj.id }, format: :js, xhr: :get
      expect(response).to be_successful
    end
  end
end

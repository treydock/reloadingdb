# frozen_string_literal: true

shared_examples "discard routing" do
  let(:obj) { subject.controller_name }
  describe "discard routing" do
    it "routes to #discard via PATCH" do
      expect(patch: "/#{obj}/1/discard").to route_to("#{obj}#discard", id: "1")
    end

    it "routes to #restore via PATCH" do
      expect(patch: "/#{obj}/1/restore").to route_to("#{obj}#restore", id: "1")
    end

    it "routes to #delete via GET" do
      expect(get: "/#{obj}/1/delete").to route_to("#{obj}#delete", id: "1")
    end
  end
end

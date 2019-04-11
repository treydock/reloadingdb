# frozen_string_literal: true

require "rails_helper"

shared_examples_for "HasCaliber" do
  let(:model) { described_class }
  let(:name) { model.to_s.underscore.to_sym }
  let(:subject) { create(name) }

  describe "caliber assocations" do
    it { is_expected.to belong_to(:caliber) }
  end
  describe "caliber validations" do
    it { is_expected.to validate_presence_of(:caliber).with_message(:required) }
  end
end

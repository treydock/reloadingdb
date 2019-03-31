require 'rails_helper'

shared_examples_for 'HasLoad' do
  let(:model) { described_class }
  let(:name) { model.to_s.underscore.to_sym }
  let(:subject) { create(name) }

  describe 'load assocations' do
    it { is_expected.to belong_to(:load) }
  end
end

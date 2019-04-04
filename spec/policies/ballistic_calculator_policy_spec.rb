require 'rails_helper'

RSpec.describe BallisticCalculatorPolicy, type: :policy do
  let(:user) { create(:user) }
  let(:ballistic_calculator) { create(:ballistic_calculator) }

  subject { described_class }

  permissions :new? do
    it 'allows access' do
      expect(subject).to permit(user, ballistic_calculator)
    end
  end

  permissions :create? do
    it 'allows access' do
      expect(subject).to permit(user, ballistic_calculator)
    end
  end
end

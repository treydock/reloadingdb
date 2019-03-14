require 'rails_helper'

RSpec.describe PagePolicy, type: :policy do
  subject { described_class }

  permissions :show? do
    it 'allows access' do
      expect(subject).to permit(nil, :home)
    end
  end
end

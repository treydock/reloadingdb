require 'rails_helper'

RSpec.describe HomePolicy, type: :policy do
  let(:user) { create(:user) }

  subject { described_class }

  permissions :index? do
    it 'allows access' do
      expect(subject).to permit(user, :home)
    end
  end
end

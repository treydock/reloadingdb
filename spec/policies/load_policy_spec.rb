require 'rails_helper'

RSpec.describe LoadPolicy, type: :policy do
  let(:user) { create(:user) }
  let(:user2) { create(:user) }
  let(:load) { create(:load, user: user) }
  let(:load2) { create(:load, user: user2) }

  subject { described_class }

  let(:policy_scope) { subject::Scope.new(user, Load).resolve }

  permissions ".scope" do
    it 'returns user owned record' do
      expect(policy_scope).to include(load)
    end
    it 'does not return another users record' do
      expect(policy_scope).not_to include(load2)
    end
  end

  permissions :index? do
    it 'allows access' do
      expect(subject).to permit(user, load)
    end
  end

  permissions :show? do
    it 'allows access' do
      expect(subject).to permit(user, load)
    end
    it 'denies access' do
      expect(subject).not_to permit(user2, load)
    end
  end

  permissions :create? do
    it 'allows access' do
      expect(subject).to permit(user, load)
    end
  end

  permissions :new? do
    it 'allows access' do
      expect(subject).to permit(user, load)
    end
  end

  permissions :edit? do
    it 'allows access' do
      expect(subject).to permit(user, load)
    end
    it 'denies access' do
      expect(subject).not_to permit(user2, load)
    end
  end

  permissions :update? do
    it 'allows access' do
      expect(subject).to permit(user, load)
    end
    it 'denies access' do
      expect(subject).not_to permit(user2, load)
    end
  end

  permissions :destroy? do
    it 'allows access' do
      expect(subject).to permit(user, load)
    end
    it 'denies access' do
      expect(subject).not_to permit(user2, load)
    end
  end

  permissions :calculate_velocity? do
    it 'allows access' do
      expect(subject).to permit(user, load)
    end
    it 'denies access' do
      expect(subject).not_to permit(user2, load)
    end
  end

  permissions :clone? do
    it 'allows access' do
      expect(subject).to permit(user, load)
    end
    it 'denies access' do
      expect(subject).not_to permit(user2, load)
    end
  end
end

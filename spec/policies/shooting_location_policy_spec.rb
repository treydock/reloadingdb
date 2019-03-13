require 'rails_helper'

RSpec.describe ShootingLocationPolicy, type: :policy do
  let(:user) { create(:user) }
  let(:user2) { create(:user) }
  let(:shooting_location) { create(:shooting_location, user: user) }
  let(:shooting_location2) { create(:shooting_location, user: user2) }

  subject { described_class }

  let(:policy_scope) { subject::Scope.new(user, ShootingLocation).resolve }

  permissions ".scope" do
    it 'returns user owned record' do
      expect(policy_scope).to include(shooting_location)
    end
    it 'does not return another users record' do
      expect(policy_scope).not_to include(shooting_location2)
    end
  end

  permissions :index? do
    it 'allows access' do
      expect(subject).to permit(user, shooting_location)
    end
  end

  permissions :show? do
    it 'allows access' do
      expect(subject).to permit(user, shooting_location)
    end
    it 'denies access' do
      expect(subject).not_to permit(user2, shooting_location)
    end
  end

  permissions :create? do
    it 'allows access' do
      expect(subject).to permit(user, shooting_location)
    end
  end

  permissions :new? do
    it 'allows access' do
      expect(subject).to permit(user, shooting_location)
    end
  end

  permissions :edit? do
    it 'allows access' do
      expect(subject).to permit(user, shooting_location)
    end
    it 'denies access' do
      expect(subject).not_to permit(user2, shooting_location)
    end
  end

  permissions :update? do
    it 'allows access' do
      expect(subject).to permit(user, shooting_location)
    end
    it 'denies access' do
      expect(subject).not_to permit(user2, shooting_location)
    end
  end

  permissions :destroy? do
    it 'allows access' do
      expect(subject).to permit(user, shooting_location)
    end
    it 'denies access' do
      expect(subject).not_to permit(user2, shooting_location)
    end
  end
end

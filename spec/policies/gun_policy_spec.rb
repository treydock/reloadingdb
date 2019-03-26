require 'rails_helper'

RSpec.describe GunPolicy, type: :policy do
  let(:user) { create(:user) }
  let(:user2) { create(:user) }
  let(:gun) { create(:gun, user: user) }
  let(:gun2) { create(:gun, user: user2) }

  subject { described_class }

  let(:policy_scope) { subject::Scope.new(user, Gun).resolve }

  permissions ".scope" do
    it 'returns user owned record' do
      expect(policy_scope).to include(gun)
    end
    it 'does not return another users record' do
      expect(policy_scope).not_to include(gun2)
    end
  end

  permissions :index? do
    it 'allows access' do
      expect(subject).to permit(user, gun)
    end
  end

  permissions :show? do
    it 'allows access' do
      expect(subject).to permit(user, gun)
    end
    it 'denies access' do
      expect(subject).not_to permit(user2, gun)
    end
  end

  permissions :create? do
    it 'allows access' do
      expect(subject).to permit(user, gun)
    end
  end

  permissions :new? do
    it 'allows access' do
      expect(subject).to permit(user, gun)
    end
  end

  permissions :edit? do
    it 'allows access' do
      expect(subject).to permit(user, gun)
    end
    it 'denies access' do
      expect(subject).not_to permit(user2, gun)
    end
  end

  permissions :update? do
    it 'allows access' do
      expect(subject).to permit(user, gun)
    end
    it 'denies access' do
      expect(subject).not_to permit(user2, gun)
    end
  end

  permissions :destroy? do
    it 'allows access' do
      expect(subject).to permit(user, gun)
    end
    it 'denies access' do
      expect(subject).not_to permit(user2, gun)
    end
  end
end

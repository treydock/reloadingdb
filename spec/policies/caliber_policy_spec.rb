require 'rails_helper'

RSpec.describe CaliberPolicy, type: :policy do
  let(:user) { create(:user) }
  let(:user2) { create(:user) }
  let(:caliber) { create(:caliber, user: user) }
  let(:caliber2) { create(:caliber, user: user2) }

  subject { described_class }

  let(:policy_scope) { subject::Scope.new(user, Caliber).resolve }

  permissions ".scope" do
    it 'returns user owned record' do
      expect(policy_scope).to include(caliber)
    end
    it 'does not return another users record' do
      expect(policy_scope).not_to include(caliber2)
    end
  end

  permissions :index? do
    it 'allows access' do
      expect(subject).to permit(user, caliber)
    end
  end

  permissions :show? do
    it 'allows access' do
      expect(subject).to permit(user, caliber)
    end
    it 'denies access' do
      expect(subject).not_to permit(user2, caliber)
    end
  end

  permissions :create? do
    it 'allows access' do
      expect(subject).to permit(user, caliber)
    end
  end

  permissions :new? do
    it 'allows access' do
      expect(subject).to permit(user, caliber)
    end
  end

  permissions :edit? do
    it 'allows access' do
      expect(subject).to permit(user, caliber)
    end
    it 'denies access' do
      expect(subject).not_to permit(user2, caliber)
    end
  end

  permissions :update? do
    it 'allows access' do
      expect(subject).to permit(user, caliber)
    end
    it 'denies access' do
      expect(subject).not_to permit(user2, caliber)
    end
  end

  permissions :destroy? do
    it 'allows access' do
      expect(subject).to permit(user, caliber)
    end
    it 'denies access' do
      expect(subject).not_to permit(user2, caliber)
    end
  end
end

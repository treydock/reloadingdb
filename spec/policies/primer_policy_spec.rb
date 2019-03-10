require 'rails_helper'

RSpec.describe PrimerPolicy, type: :policy do
  let(:user) { create(:user) }
  let(:user2) { create(:user) }
  let(:primer) { create(:primer, user: user) }
  let(:primer2) { create(:primer, user: user2) }

  subject { described_class }

  let(:policy_scope) { subject::Scope.new(user, Primer).resolve }

  permissions ".scope" do
    it 'returns user owned record' do
      expect(policy_scope).to include(primer)
    end
    it 'does not return another users record' do
      expect(policy_scope).not_to include(primer2)
    end
  end

  permissions :index? do
    it 'allows access' do
      expect(subject).to permit(user, primer)
    end
  end

  permissions :show? do
    it 'allows access' do
      expect(subject).to permit(user, primer)
    end
    it 'denies access' do
      expect(subject).not_to permit(user2, primer)
    end
  end

  permissions :create? do
    it 'allows access' do
      expect(subject).to permit(user, primer)
    end
  end

  permissions :new? do
    it 'allows access' do
      expect(subject).to permit(user, primer)
    end
  end

  permissions :edit? do
    it 'allows access' do
      expect(subject).to permit(user, primer)
    end
    it 'denies access' do
      expect(subject).not_to permit(user2, primer)
    end
  end

  permissions :update? do
    it 'allows access' do
      expect(subject).to permit(user, primer)
    end
    it 'denies access' do
      expect(subject).not_to permit(user2, primer)
    end
  end

  permissions :destroy? do
    it 'allows access' do
      expect(subject).to permit(user, primer)
    end
    it 'denies access' do
      expect(subject).not_to permit(user2, primer)
    end
  end
end

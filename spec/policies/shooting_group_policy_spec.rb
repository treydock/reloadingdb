# frozen_string_literal: true

require "rails_helper"

RSpec.describe ShootingGroupPolicy, type: :policy do
  let(:user) { create(:user) }
  let(:user2) { create(:user) }
  let(:shooting_group) { create(:shooting_group, user: user) }
  let(:shooting_group2) { create(:shooting_group, user: user2) }

  subject { described_class }

  let(:policy_scope) { subject::Scope.new(user, ShootingGroup).resolve }

  permissions ".scope" do
    it "returns user owned record" do
      expect(policy_scope).to include(shooting_group)
    end
    it "does not return another users record" do
      expect(policy_scope).not_to include(shooting_group2)
    end
  end

  permissions :index? do
    it "allows access" do
      expect(subject).to permit(user, shooting_group)
    end
  end

  permissions :show? do
    it "allows access" do
      expect(subject).to permit(user, shooting_group)
    end
    it "denies access" do
      expect(subject).not_to permit(user2, shooting_group)
    end
  end

  permissions :create? do
    it "allows access" do
      expect(subject).to permit(user, shooting_group)
    end
  end

  permissions :new? do
    it "allows access" do
      expect(subject).to permit(user, shooting_group)
    end
  end

  permissions :edit? do
    it "allows access" do
      expect(subject).to permit(user, shooting_group)
    end
    it "denies access" do
      expect(subject).not_to permit(user2, shooting_group)
    end
  end

  permissions :update? do
    it "allows access" do
      expect(subject).to permit(user, shooting_group)
    end
    it "denies access" do
      expect(subject).not_to permit(user2, shooting_group)
    end
  end

  permissions :destroy? do
    it "allows access" do
      expect(subject).to permit(user, shooting_group)
    end
    it "denies access" do
      expect(subject).not_to permit(user2, shooting_group)
    end
  end

  permissions :clone? do
    it "allows access" do
      expect(subject).to permit(user, shooting_group)
    end
    it "denies access" do
      expect(subject).not_to permit(user2, shooting_group)
    end
  end
end

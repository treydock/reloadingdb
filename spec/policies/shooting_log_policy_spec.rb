# frozen_string_literal: true

require "rails_helper"

RSpec.describe ShootingLogPolicy, type: :policy do
  let(:user) { create(:user) }
  let(:user2) { create(:user) }
  let(:shooting_log) { create(:shooting_log, user: user) }
  let(:shooting_log2) { create(:shooting_log, user: user2) }

  subject { described_class }

  let(:policy_scope) { subject::Scope.new(user, ShootingLog).resolve }

  permissions ".scope" do
    it "returns user owned record" do
      expect(policy_scope).to include(shooting_log)
    end
    it "does not return another users record" do
      expect(policy_scope).not_to include(shooting_log2)
    end
  end

  permissions :index? do
    it "allows access" do
      expect(subject).to permit(user, shooting_log)
    end
  end

  permissions :show? do
    it "allows access" do
      expect(subject).to permit(user, shooting_log)
    end
    it "denies access" do
      expect(subject).not_to permit(user2, shooting_log)
    end
  end

  permissions :create? do
    it "allows access" do
      expect(subject).to permit(user, shooting_log)
    end
  end

  permissions :new? do
    it "allows access" do
      expect(subject).to permit(user, shooting_log)
    end
  end

  permissions :edit? do
    it "allows access" do
      expect(subject).to permit(user, shooting_log)
    end
    it "denies access" do
      expect(subject).not_to permit(user2, shooting_log)
    end
  end

  permissions :update? do
    it "allows access" do
      expect(subject).to permit(user, shooting_log)
    end
    it "denies access" do
      expect(subject).not_to permit(user2, shooting_log)
    end
  end

  permissions :destroy? do
    it "allows access" do
      expect(subject).to permit(user, shooting_log)
    end
    it "denies access" do
      expect(subject).not_to permit(user2, shooting_log)
    end
  end
end

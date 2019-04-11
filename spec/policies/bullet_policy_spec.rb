# frozen_string_literal: true

require "rails_helper"

RSpec.describe BulletPolicy, type: :policy do
  let(:user) { create(:user) }
  let(:user2) { create(:user) }
  let(:bullet) { create(:bullet, user: user) }
  let(:bullet2) { create(:bullet, user: user2) }

  subject { described_class }

  let(:policy_scope) { subject::Scope.new(user, Bullet).resolve }

  permissions ".scope" do
    it "returns user owned record" do
      expect(policy_scope).to include(bullet)
    end
    it "does not return another users record" do
      expect(policy_scope).not_to include(bullet2)
    end
  end

  permissions :index? do
    it "allows access" do
      expect(subject).to permit(user, bullet)
    end
  end

  permissions :show? do
    it "allows access" do
      expect(subject).to permit(user, bullet)
    end
    it "denies access" do
      expect(subject).not_to permit(user2, bullet)
    end
  end

  permissions :create? do
    it "allows access" do
      expect(subject).to permit(user, bullet)
    end
  end

  permissions :new? do
    it "allows access" do
      expect(subject).to permit(user, bullet)
    end
  end

  permissions :edit? do
    it "allows access" do
      expect(subject).to permit(user, bullet)
    end
    it "denies access" do
      expect(subject).not_to permit(user2, bullet)
    end
  end

  permissions :update? do
    it "allows access" do
      expect(subject).to permit(user, bullet)
    end
    it "denies access" do
      expect(subject).not_to permit(user2, bullet)
    end
  end

  permissions :destroy? do
    it "allows access" do
      expect(subject).to permit(user, bullet)
    end
    it "denies access" do
      expect(subject).not_to permit(user2, bullet)
    end
  end
end

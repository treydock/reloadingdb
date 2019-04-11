# frozen_string_literal: true

require "rails_helper"

RSpec.describe BrassPolicy, type: :policy do
  let(:user) { create(:user) }
  let(:user2) { create(:user) }
  let(:brass) { create(:brass, user: user) }
  let(:brass2) { create(:brass, user: user2) }

  subject { described_class }

  let(:policy_scope) { subject::Scope.new(user, Brass).resolve }

  permissions ".scope" do
    it "returns user owned record" do
      expect(policy_scope).to include(brass)
    end
    it "does not return another users record" do
      expect(policy_scope).not_to include(brass2)
    end
  end

  permissions :index? do
    it "allows access" do
      expect(subject).to permit(user, brass)
    end
  end

  permissions :show? do
    it "allows access" do
      expect(subject).to permit(user, brass)
    end
    it "denies access" do
      expect(subject).not_to permit(user2, brass)
    end
  end

  permissions :create? do
    it "allows access" do
      expect(subject).to permit(user, brass)
    end
  end

  permissions :new? do
    it "allows access" do
      expect(subject).to permit(user, brass)
    end
  end

  permissions :edit? do
    it "allows access" do
      expect(subject).to permit(user, brass)
    end
    it "denies access" do
      expect(subject).not_to permit(user2, brass)
    end
  end

  permissions :update? do
    it "allows access" do
      expect(subject).to permit(user, brass)
    end
    it "denies access" do
      expect(subject).not_to permit(user2, brass)
    end
  end

  permissions :destroy? do
    it "allows access" do
      expect(subject).to permit(user, brass)
    end
    it "denies access" do
      expect(subject).not_to permit(user2, brass)
    end
  end
end

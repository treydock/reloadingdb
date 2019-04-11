# frozen_string_literal: true

require "rails_helper"

RSpec.describe PowderPolicy, type: :policy do
  let(:user) { create(:user) }
  let(:user2) { create(:user) }
  let(:powder) { create(:powder, user: user) }
  let(:powder2) { create(:powder, user: user2) }

  subject { described_class }

  let(:policy_scope) { subject::Scope.new(user, Powder).resolve }

  permissions ".scope" do
    it "returns user owned record" do
      expect(policy_scope).to include(powder)
    end
    it "does not return another users record" do
      expect(policy_scope).not_to include(powder2)
    end
  end

  permissions :index? do
    it "allows access" do
      expect(subject).to permit(user, powder)
    end
  end

  permissions :show? do
    it "allows access" do
      expect(subject).to permit(user, powder)
    end
    it "denies access" do
      expect(subject).not_to permit(user2, powder)
    end
  end

  permissions :create? do
    it "allows access" do
      expect(subject).to permit(user, powder)
    end
  end

  permissions :new? do
    it "allows access" do
      expect(subject).to permit(user, powder)
    end
  end

  permissions :edit? do
    it "allows access" do
      expect(subject).to permit(user, powder)
    end
    it "denies access" do
      expect(subject).not_to permit(user2, powder)
    end
  end

  permissions :update? do
    it "allows access" do
      expect(subject).to permit(user, powder)
    end
    it "denies access" do
      expect(subject).not_to permit(user2, powder)
    end
  end

  permissions :destroy? do
    it "allows access" do
      expect(subject).to permit(user, powder)
    end
    it "denies access" do
      expect(subject).not_to permit(user2, powder)
    end
  end
end

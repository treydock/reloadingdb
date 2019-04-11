# frozen_string_literal: true

require "rails_helper"

RSpec.describe LoadPolicy, type: :policy do
  let(:user1) { create(:user) }
  let(:user2) { create(:user) }
  let(:load1) { create(:load, user: user1) }
  let(:load2) { create(:load, user: user2) }
  let(:policy) { described_class }
  let(:policy_scope) { policy::Scope.new(user1, Load).resolve }

  include_examples "UserObjectPolicy" do
    let(:obj1) { load1 }
    let(:obj2) { load2 }
  end

  permissions :calculate_velocity? do
    it "allows access" do
      expect(policy).to permit(user1, load1)
    end
    it "denies access" do
      expect(policy).not_to permit(user2, load1)
    end
  end

  permissions :clone? do
    it "allows access" do
      expect(policy).to permit(user1, load1)
    end
    it "denies access" do
      expect(policy).not_to permit(user2, load1)
    end
  end
end

# frozen_string_literal: true

require "rails_helper"

RSpec.describe ShootingGroupPolicy, type: :policy do
  let(:user1) { create(:user) }
  let(:user2) { create(:user) }
  let(:shooting_group1) { create(:shooting_group, user: user1) }
  let(:shooting_group2) { create(:shooting_group, user: user2) }
  let(:policy) { described_class }
  let(:policy_scope) { policy::Scope.new(user1, ShootingGroup).resolve }

  include_examples "UserObjectPolicy" do
    let(:obj1) { shooting_group1 }
    let(:obj2) { shooting_group2 }
  end

  permissions :clone? do
    it "allows access" do
      expect(policy).to permit(user1, shooting_group1)
    end
    it "denies access" do
      expect(policy).not_to permit(user2, shooting_group1)
    end
  end
end

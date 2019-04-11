# frozen_string_literal: true

require "rails_helper"

RSpec.describe ShootingVelocityPolicy, type: :policy do
  let(:user1) { create(:user) }
  let(:user2) { create(:user) }
  let(:shooting_velocity1) { create(:shooting_velocity, user: user1) }
  let(:shooting_velocity2) { create(:shooting_velocity, user: user2) }
  let(:policy) { described_class }
  let(:policy_scope) { policy::Scope.new(user1, ShootingVelocity).resolve }

  include_examples "UserObjectPolicy" do
    let(:obj1) { shooting_velocity1 }
    let(:obj2) { shooting_velocity2 }
  end
end

# frozen_string_literal: true

require "rails_helper"

RSpec.describe ShootingLocationPolicy, type: :policy do
  let(:user1) { create(:user) }
  let(:user2) { create(:user) }
  let(:shooting_location1) { create(:shooting_location, user: user1) }
  let(:shooting_location2) { create(:shooting_location, user: user2) }
  let(:policy) { described_class }
  let(:policy_scope) { policy::Scope.new(user1, ShootingLocation).resolve }

  include_examples "UserObjectPolicy" do
    let(:obj1) { shooting_location1 }
    let(:obj2) { shooting_location2 }
  end
end

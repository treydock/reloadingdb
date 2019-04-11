# frozen_string_literal: true

require "rails_helper"

RSpec.describe ShootingLogPolicy, type: :policy do
  let(:user1) { create(:user) }
  let(:user2) { create(:user) }
  let(:shooting_log1) { create(:shooting_log, user: user1) }
  let(:shooting_log2) { create(:shooting_log, user: user2) }
  let(:policy) { described_class }
  let(:policy_scope) { policy::Scope.new(user1, ShootingLog).resolve }

  include_examples "UserObjectPolicy" do
    let(:obj1) { shooting_log1 }
    let(:obj2) { shooting_log2 }
  end
end

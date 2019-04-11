# frozen_string_literal: true

require "rails_helper"

RSpec.describe GunPolicy, type: :policy do
  let(:user1) { create(:user) }
  let(:user2) { create(:user) }
  let(:gun1) { create(:gun, user: user1) }
  let(:gun2) { create(:gun, user: user2) }
  let(:policy) { described_class }
  let(:policy_scope) { policy::Scope.new(user1, Gun).resolve }

  include_examples "UserObjectPolicy" do
    let(:obj1) { gun1 }
    let(:obj2) { gun2 }
  end
end

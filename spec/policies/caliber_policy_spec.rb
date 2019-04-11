# frozen_string_literal: true

require "rails_helper"

RSpec.describe CaliberPolicy, type: :policy do
  let(:user1) { create(:user) }
  let(:user2) { create(:user) }
  let(:caliber1) { create(:caliber, user: user1) }
  let(:caliber2) { create(:caliber, user: user2) }
  let(:policy) { described_class }
  let(:policy_scope) { policy::Scope.new(user1, Caliber).resolve }

  include_examples "UserObjectPolicy" do
    let(:obj1) { caliber1 }
    let(:obj2) { caliber2 }
  end
end

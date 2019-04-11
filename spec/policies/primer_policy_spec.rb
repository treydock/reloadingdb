# frozen_string_literal: true

require "rails_helper"

RSpec.describe PrimerPolicy, type: :policy do
  let(:user1) { create(:user) }
  let(:user2) { create(:user) }
  let(:primer1) { create(:primer, user: user1) }
  let(:primer2) { create(:primer, user: user2) }
  let(:policy) { described_class }
  let(:policy_scope) { policy::Scope.new(user1, Primer).resolve }

  include_examples "UserObjectPolicy" do
    let(:obj1) { primer1 }
    let(:obj2) { primer2 }
  end
end

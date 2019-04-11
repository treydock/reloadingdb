# frozen_string_literal: true

require "rails_helper"

RSpec.describe BrassPolicy, type: :policy do
  let(:user1) { create(:user) }
  let(:user2) { create(:user) }
  let(:brass1) { create(:brass, user: user1) }
  let(:brass2) { create(:brass, user: user2) }
  let(:policy) { described_class }
  let(:policy_scope) { policy::Scope.new(user1, Brass).resolve }

  include_examples "UserObjectPolicy" do
    let(:obj1) { brass1 }
    let(:obj2) { brass2 }
  end
end

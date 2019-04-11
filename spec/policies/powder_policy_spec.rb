# frozen_string_literal: true

require "rails_helper"

RSpec.describe PowderPolicy, type: :policy do
  let(:user1) { create(:user) }
  let(:user2) { create(:user) }
  let(:powder1) { create(:powder, user: user1) }
  let(:powder2) { create(:powder, user: user2) }
  let(:policy) { described_class }
  let(:policy_scope) { policy::Scope.new(user1, Powder).resolve }

  include_examples "UserObjectPolicy" do
    let(:obj1) { powder1 }
    let(:obj2) { powder2 }
  end
end

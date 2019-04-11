# frozen_string_literal: true

require "rails_helper"

RSpec.describe BulletPolicy, type: :policy do
  let(:user1) { create(:user) }
  let(:user2) { create(:user) }
  let(:bullet1) { create(:bullet, user: user1) }
  let(:bullet2) { create(:bullet, user: user2) }
  let(:policy) { described_class }
  let(:policy_scope) { policy::Scope.new(user1, Bullet).resolve }

  include_examples "UserObjectPolicy" do
    let(:obj1) { bullet1 }
    let(:obj2) { bullet2 }
  end
end

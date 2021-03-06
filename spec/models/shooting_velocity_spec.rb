# frozen_string_literal: true

require "rails_helper"

RSpec.describe ShootingVelocity, type: :model do
  it_behaves_like "HasCaliber"
  it_behaves_like "HasLoad"

  let(:subject) { create(:shooting_velocity) }

  describe "associations" do
    it { is_expected.to belong_to(:user) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of :date }
  end

  describe "scopes" do
    context "kept" do
      it "should not include discarded calibers" do
        caliber = create(:caliber)
        caliber.discard
        shooting_velocity1 = create(:shooting_velocity, caliber: caliber)
        shooting_velocity2 = create(:shooting_velocity)
        expect(described_class.kept).to include(shooting_velocity2)
        expect(described_class.kept).not_to include(shooting_velocity1)
      end
      it "should not include discarded loads" do
        load = create(:load)
        load.discard
        shooting_velocity1 = create(:shooting_velocity, load: load)
        shooting_velocity2 = create(:shooting_velocity)
        expect(described_class.kept).to include(shooting_velocity2)
        expect(described_class.kept).not_to include(shooting_velocity1)
      end
    end
  end

  describe "velocities" do
    it "should accept array of integers" do
      subject.velocities = [1000, 1000]
      subject.save!
      subject.reload
      expect(subject.velocities).to eq([1000, 1000])
    end
    it "should remove blank values" do
      subject.velocities = [1000, ""]
      subject.save!
      subject.reload
      expect(subject.velocities).to eq([1000])
    end
    it "should be invalid if not integers" do
      obj = build(:shooting_velocity, velocities: ["foo", 2000])
      expect(obj).not_to be_valid
    end
  end

  describe "name_full" do
    it "should be set" do
      expect(subject.name_full).to eq("#{subject.date} - #{subject.load.name}")
    end
  end

  describe "average_velocity" do
    it "should calculate average" do
      obj = create(:shooting_velocity, velocities: [1000, 2000])
      expect(obj.average_velocity).to eq(1500)
    end
    it "should handle empty array" do
      obj = create(:shooting_velocity, velocities: [])
      expect(obj.average_velocity).to be_nil
    end
    it "should handle nil" do
      obj = create(:shooting_velocity, velocities: nil)
      expect(obj.average_velocity).to be_nil
    end
  end

  describe "velocity_unit" do
    it "should pull value from database" do
      user = create(:user)
      object = create(:shooting_velocity, user: user, velocity_unit: "mph")
      user.settings(:default_units).velocity = "fps"
      user.save!
      expect(object.velocity_unit).to eq("mph")
    end
    it "should pull value from user default" do
      user = create(:user)
      object = create(:shooting_velocity, user: user, velocity_unit: "")
      user.settings(:default_units).velocity = "fps"
      user.save!
      expect(object.velocity_unit).to eq("fps")
    end
  end
end

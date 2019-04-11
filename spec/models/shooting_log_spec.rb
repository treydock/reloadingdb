# frozen_string_literal: true

require "rails_helper"

RSpec.describe ShootingLog, type: :model do
  it_behaves_like "HasWindSpeed"

  let(:subject) { create(:shooting_log) }

  describe "associations" do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:caliber) }
    it { is_expected.to belong_to(:shooting_location) }
    it { is_expected.to have_many(:shooting_groups).dependent(:destroy) }
  end

  describe "validations" do
    it { is_expected.not_to validate_presence_of :caliber }
    it { is_expected.not_to validate_presence_of :caliber_id }
    it { is_expected.not_to validate_presence_of :shooting_location }
    it { is_expected.not_to validate_presence_of :shooting_location_id }
    it { is_expected.to validate_presence_of :date }
    it { is_expected.to validate_presence_of :time }
  end

  describe "name_full" do
    it "should be set" do
      shooting_log = create(:shooting_log)
      expect(shooting_log.name_full).to eq(shooting_log.date)
    end
  end

  describe "temperature_full" do
    it "should return temperature" do
      subject.temperature = ""
      expect(subject.temperature_full).to be_nil
    end
    it "shuld return full text" do
      subject.temperature = 70
      expect(subject.temperature_full).to eq("70 F")
    end
  end

  describe "pressure_full" do
    it "should return temperature" do
      subject.pressure = ""
      expect(subject.pressure_full).to be_nil
    end
    it "shuld return full text" do
      subject.pressure = 30.0
      expect(subject.pressure_full).to eq("30.0 inhg")
    end
  end

  describe "temperature_unit" do
    it "should pull value from database" do
      user = create(:user)
      shooting_log = create(:shooting_log, user: user, temperature_unit: "C")
      user.settings(:default_units).temperature = "F"
      user.save!
      expect(shooting_log.temperature_unit).to eq("C")
    end
    it "should pull value from user default" do
      user = create(:user)
      shooting_log = create(:shooting_log, user: user, temperature_unit: "")
      user.settings(:default_units).temperature = "F"
      user.save!
      expect(shooting_log.temperature_unit).to eq("F")
    end
  end

  describe "pressure_unit" do
    it "should pull value from database" do
      user = create(:user)
      shooting_log = create(:shooting_log, user: user, pressure_unit: "atm")
      user.settings(:default_units).pressure = "inhg"
      user.save!
      expect(shooting_log.pressure_unit).to eq("atm")
    end
    it "should pull value from user default" do
      user = create(:user)
      shooting_log = create(:shooting_log, user: user, pressure_unit: "")
      user.settings(:default_units).pressure = "inhg"
      user.save!
      expect(shooting_log.pressure_unit).to eq("inhg")
    end
  end
end

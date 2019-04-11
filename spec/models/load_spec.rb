# frozen_string_literal: true

require "rails_helper"

RSpec.describe Load, type: :model do
  it_behaves_like "HasCaliber"
  it_behaves_like "HasVelocity"

  let(:subject) { create(:load) }

  context "ApplicationRecord" do
    describe "will_destroy" do
      it "should return has_many associated records" do
        load1 = create(:load)
        load2 = create(:load)
        shooting_velocity1 = create(:shooting_velocity, load: load1)
        shooting_velocity2 = create(:shooting_velocity, load: load2)
        shooting_group1 = create(:shooting_group, load: load1)
        shooting_group2 = create(:shooting_group, load: load2)
        expect(load1.will_destroy).to eq(shooting_velocities: [shooting_velocity1], shooting_groups: [shooting_group1])
      end
      it "should turn empty associations" do
        load = create(:load)
        expect(load.will_destroy).to eq(shooting_velocities: [], shooting_groups: [])
      end
    end

    describe "discarded_associations" do
      it "should return discarded associations" do
        bullet = create(:bullet)
        load = create(:load, bullet: bullet)
        bullet.discard
        expect(load.discarded_associations).to eq(bullet: bullet)
      end
      it "should return empty hash if nothing discarded" do
        load = create(:load)
        expect(load.discarded_associations).to eq({})
      end
    end
  end

  describe "associations" do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:brass) }
    it { is_expected.to belong_to(:bullet) }
    it { is_expected.to belong_to(:powder) }
    it { is_expected.to belong_to(:primer) }
    it { is_expected.to have_many(:shooting_groups).dependent(:destroy) }
    it { is_expected.to have_many(:shooting_velocities).dependent(:destroy) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of :date }
    it { is_expected.to validate_numericality_of(:powder_weight) }
    it { is_expected.to validate_presence_of(:powder_weight) }
    it { is_expected.to validate_numericality_of(:col) }
    it { is_expected.to validate_presence_of(:col) }
    it { is_expected.to validate_numericality_of(:brass_length) }
    it { is_expected.to validate_numericality_of(:brass_uses).only_integer }
    it { is_expected.to validate_numericality_of(:run_out) }
    it { is_expected.to validate_numericality_of(:rounds).only_integer }
  end

  describe "scopes" do
    context "kept" do
      it "should exclude if caliber or brass discarded" do
        caliber = create(:caliber)
        brass = create(:brass)
        caliber.discard
        brass.discard
        load1 = create(:load, caliber: caliber, brass: brass)
        load2 = create(:load)
        expect(described_class.kept).to include(load2)
        expect(described_class.kept).not_to include(load1)
      end
    end
  end

  describe "name" do
    it "should be set" do
      caliber = create(:caliber, name: "308")
      bullet = create(:bullet, caliber: caliber, name: "Sierra HPBT", grain: 168)
      powder = create(:powder, name: "test")
      load = create(:load, caliber: caliber, bullet: bullet, powder: powder, powder_weight: 40, date: Date.parse("2019-03-14"))
      expect(load.name).to eq("2019-03-14 - Sierra HPBT (308 - 168gr) - test (40.0gr)")
    end
  end

  describe "name_full" do
    it "should be set" do
      load = create(:load)
      expect(load.name_full).to eq(load.name)
    end
  end

  describe "brass_length_full" do
    it "should return brass_length" do
      subject.brass_length = ""
      expect(subject.brass_length_full).to be_nil
    end
    it "shuld return full text" do
      subject.brass_length = 2.0
      expect(subject.brass_length_full).to eq("2.0 in")
    end
  end

  describe "col_full" do
    it "should return col" do
      subject.col = ""
      expect(subject.col_full).to be_nil
    end
    it "shuld return full text" do
      subject.col = 2.0
      expect(subject.col_full).to eq("2.0 in")
    end
  end

  describe "run_out_full" do
    it "should return run_out" do
      subject.run_out = ""
      expect(subject.run_out_full).to be_nil
    end
    it "shuld return full text" do
      subject.run_out = 2.0
      expect(subject.run_out_full).to eq("2.0 in")
    end
  end

  describe "brass_length_unit" do
    it "should pull value from database" do
      user = create(:user)
      load = create(:load, user: user, brass_length_unit: "in")
      user.settings(:default_units).length = "cm"
      user.save!
      expect(load.brass_length_unit).to eq("in")
    end
    it "should pull value from user default" do
      user = create(:user)
      load = create(:load, user: user, brass_length_unit: "")
      user.settings(:default_units).length = "cm"
      user.save!
      expect(load.brass_length_unit).to eq("cm")
    end
  end

  describe "col_unit" do
    it "should pull value from database" do
      user = create(:user)
      load = create(:load, user: user, col_unit: "in")
      user.settings(:default_units).length = "cm"
      user.save!
      expect(load.col_unit).to eq("in")
    end
    it "should pull value from user default" do
      user = create(:user)
      load = create(:load, user: user, col_unit: "")
      user.settings(:default_units).length = "cm"
      user.save!
      expect(load.col_unit).to eq("cm")
    end
  end

  describe "run_out_unit" do
    it "should pull value from database" do
      user = create(:user)
      load = create(:load, user: user, run_out_unit: "in")
      user.settings(:default_units).length = "cm"
      user.save!
      expect(load.run_out_unit).to eq("in")
    end
    it "should pull value from user default" do
      user = create(:user)
      load = create(:load, user: user, run_out_unit: "")
      user.settings(:default_units).length = "cm"
      user.save!
      expect(load.run_out_unit).to eq("cm")
    end
  end

  describe "calculate_velocity" do
    before(:each) do
      @load1 = create(:load)
      @load2 = create(:load)
      create(:shooting_velocity, load: @load1, velocities: [2000, 2000, 2001])
      create(:shooting_velocity, load: @load1, velocities: [2100, 2100])
    end
    it "should calculate average velocity" do
      expect(@load1.calculate_velocity).to eq(2040)
    end
    it "should handle no velocities" do
      expect(@load2.calculate_velocity).to be_nil
    end
  end

  describe "clone_record" do
    it "should clone successfully" do
      clone = subject.clone_record
      expect(clone.new_record?).to eq(true)
    end
    it "should clone and remove some attributes" do
      clone = subject.clone_record
      expect(clone.date).to be_nil
      expect(clone.velocity).to be_nil
    end
  end
end

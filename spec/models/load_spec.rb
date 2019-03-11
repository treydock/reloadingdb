require 'rails_helper'

RSpec.describe Load, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:caliber) }
    it { is_expected.to belong_to(:brass) }
    it { is_expected.to belong_to(:bullet) }
    it { is_expected.to belong_to(:powder) }
    it { is_expected.to belong_to(:primer) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :date }
    it { is_expected.to validate_numericality_of(:powder_weight) }
    it { is_expected.to validate_numericality_of(:col) }
    it { is_expected.to validate_numericality_of(:brass_length) }
    it { is_expected.to validate_numericality_of(:brass_uses).only_integer }
    it { is_expected.to validate_numericality_of(:speed).only_integer }
    it { is_expected.to validate_numericality_of(:run_out) }
    it { is_expected.to validate_numericality_of(:rounds).only_integer }
  end
end

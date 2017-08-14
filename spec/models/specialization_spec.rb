require 'rails_helper'

RSpec.describe Specialization, type: :model do
  subject { build(:specialization) }

  it { is_expected.to validate_presence_of(:doctor_title) }
  it { is_expected.to validate_presence_of(:alias_name) }
  it { is_expected.to validate_uniqueness_of(:doctor_title)}
  it { is_expected.to validate_uniqueness_of(:alias_name)}
end

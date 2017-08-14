require 'rails_helper'

RSpec.describe Specialization, type: :model do
  it { is_expected.to validate_presence_of(:doctor_title) }
  it { is_expected.to validate_presence_of(:alias_name) }
  it { is_expected.to validate_uniqueness_of(:doctor_title).case_insensitive }
  it { is_expected.to validate_uniqueness_of(:alias_name).case_insensitive }
end

require 'rails_helper'

RSpec.describe PerformedAction, type: :model do
  it { is_expected.to belong_to :actor }
  it { is_expected.to belong_to :subject }
end

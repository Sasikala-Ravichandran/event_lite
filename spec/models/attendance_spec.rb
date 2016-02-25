require 'rails_helper'

RSpec.describe Attendance, type: :model do

  it { should belong_to(:user) }
  it { should belong_to(:event) }
  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:event) }
  it { should validate_inclusion_of(:accepted).in_array([true, false])}
  
end
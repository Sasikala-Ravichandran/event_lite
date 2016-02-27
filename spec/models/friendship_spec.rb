require 'rails_helper'

RSpec.describe Friendship, type: :model do

  it { should belong_to(:user) }
  it { should belong_to(:friend) }
  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:friend) }
  it { should validate_inclusion_of(:verified).in_array([true, false])}

end

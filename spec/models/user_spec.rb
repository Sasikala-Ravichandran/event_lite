require 'rails_helper'

RSpec.describe User, type: :model do
  
  it { should have_many(:created_events) }
  it { should have_many(:attendances) }
  it { should have_many(:events).through(:attendances) }
  it { should have_many(:friendships) }
  it { should have_many(:friends).through(:friendships) }
  it { should have_many(:rev_friendships) }
  it { should have_many(:rev_friends).through(:rev_friendships) }

  describe "#full_name" do
    it "returns the concatenated first and last name" do
      user = build(:user, first_name: 'Josh', last_name: 'Doe')
      expect(user.full_name).to eq 'Josh Doe'
    end
  end
end

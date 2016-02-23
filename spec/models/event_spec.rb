require 'rails_helper'

RSpec.describe Event, type: :model do
  
  let(:event) { build(:event) }

  it "requires name" do
    event.name = " "
    expect(event).not_to be_valid
    expect(event.errors[:name]).to eq(["can't be blank", "is too short (minimum is 5 characters)"])

  end

  it "requires start date" do
    event.start_date = " "
    expect(event).not_to be_valid
    expect(event.errors[:start_date]).to eq(["can't be blank"])
  end

  it "requires start time" do
    event.start_time = " "
    expect(event).not_to be_valid
    expect(event.errors[:start_time]).to eq(["can't be blank"])
  end

  it "requires venue" do
    event.venue = " "
    expect(event).not_to be_valid
    expect(event.errors[:venue]).to eq(["can't be blank"])
  end

  it "name should not be too long" do
    event.name = 'a'*51
    expect(event).not_to be_valid
    expect(event.errors[:name]).to eq(["is too long (maximum is 50 characters)"])
  end

  it "name should not be too short" do
    event.name = 'a'*4
    expect(event).not_to be_valid
    expect(event.errors[:name]).to eq(["is too short (minimum is 5 characters)"])
  end

end 

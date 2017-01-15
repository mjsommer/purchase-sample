require "rails_helper"

RSpec.describe User, :type => :model do
  it "creates multiple users" do
    User.create!(name: "Test User1", email: "test1@example.com")
    User.create!(name: "Test User1y", email: "test2@example.com")

    expect(User.count).to eq 2
  end

  it "deletes multiple users" do
    user1 = User.create!(name: "Test User1", email: "test1@example.com")
    user2 = User.create!(name: "Test User1y", email: "test2@example.com")

    user1.delete
    user2.delete

    expect(User.count).to eq 0
  end

  it "should not create duplicate users" do
    User.create!(name: "Test User1", email: "test1@example.com")
    expect(lambda {(User.create!(name: "Test User1", email: "test1@example.com"))}).to raise_exception(ActiveRecord::RecordNotUnique)
  end
end

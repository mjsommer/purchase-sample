require 'rails_helper'

RSpec.describe Purchase, type: :model do

  it "creates multiple purchases, per user" do
    user1 = FactoryGirl.create(:user)
    user2 = FactoryGirl.create(:user)

    Purchase.create(user_id: user1.id, purchased_at: "Best Buy", status: "draft")
    Purchase.create(user_id: user1.id, purchased_at: "Nordstoms", status: "completed")
    Purchase.create(user_id: user1.id, purchased_at: "REI", status: "cancelled")

    Purchase.create(user_id: user2.id, purchased_at: "Best Buy", status: "draft")
    Purchase.create(user_id: user2.id, purchased_at: "Nordstoms", status: "completed")
    Purchase.create(user_id: user2.id, purchased_at: "REI", status: "cancelled")

    expect(Purchase.count).to eq 6
  end

  it "should delete purchases" do
    user = FactoryGirl.create(:user)
    purchase1 = Purchase.create(user_id: user.id, purchased_at: "Best Buy", status: "draft")

    purchase1. delete

    expect(Purchase.count).to eq 0
  end

  it "should allow only three status types" do
    user = FactoryGirl.create(:user)

    Purchase.create(user_id: user.id, purchased_at: "Best Buy", status: "draft")
    Purchase.create(user_id: user.id, purchased_at: "Nordstoms", status: "completed")
    Purchase.create(user_id: user.id, purchased_at: "REI", status: "cancelled")

    expect(lambda {(Purchase.create(user_id: user.id, purchased_at: "REI", status: "some_other_status"))}).to raise_exception(ActiveRecord::StatementInvalid)
  end
end

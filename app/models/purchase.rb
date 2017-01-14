class Purchase < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :user_id, :purchased_at, :status
end

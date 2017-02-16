class Item < ActiveRecord::Base
  belongs_to :user

  def expired?
    remaining = (created_at - 7.days.ago).ceil
    remaining < 0
  end
end

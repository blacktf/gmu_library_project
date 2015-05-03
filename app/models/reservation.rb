class Reservation < ActiveRecord::Base
  belongs_to :book
  belongs_to :user

  scope :overdue, -> { where('due_on < ?',DateTime.now) }
end

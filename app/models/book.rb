class Book < ActiveRecord::Base
  belongs_to :author
  has_many :reservations, dependent: :destroy


 def self.search(query)
    # search by title , author or isbn
    where("title like ?  or isbn like ? ", "%#{query}%", "%#{query}%")
  end


end

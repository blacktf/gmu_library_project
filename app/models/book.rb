class Book < ActiveRecord::Base
  belongs_to :author
  has_many :reservations, dependent: :destroy

  validates :title, :isbn, :author, :pages,
   :genre, :abstract, :published_on,
   :total_in_library, presence: true

   validates :total_in_library, :pages,
    numericality: { only_integer: true,
    greater_than_or_equal_to: 0 }

    validates :abstract, length: { minimum: 15 }

 def self.search(query)
    # search by title , author or isbn
    where("title like ?  or isbn like ? ", "%#{query}%", "%#{query}%")
  end


end

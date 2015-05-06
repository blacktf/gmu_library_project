class Author < ActiveRecord::Base
  has_many :books

  validates :name, :dob, :nationality, :biography, :image_url, presence: true
  validates :biography, length: { minimum: 15 }


end

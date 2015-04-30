class Book < ActiveRecord::Base
  has_one :author
end

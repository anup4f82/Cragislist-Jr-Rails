class Category < ActiveRecord::Base
  has_many :posts
  validates_presence_of :name

end
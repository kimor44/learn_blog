class Category < ApplicationRecord
  has_many :books

  validates :title, presence: { message: 'name of category is mandatory!' }
end

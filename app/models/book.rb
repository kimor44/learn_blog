class Book < ActiveRecord::Base
  belongs_to :category

  validates :title, presence: {
    message: "Can't be blank"
  }

  validates :title, uniqueness: {
    message: "Must be unique"
  }

  scope :detective, -> { where(category_id: 1)}
  scope :thriller, -> { where(category_id: 4)}
  scope :with_murder, -> { where(category_id: [1, 4] )}
end

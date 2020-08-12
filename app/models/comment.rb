class Comment < ApplicationRecord
  belongs_to :article
  belongs_to :user

  validates :content, presence: {
    message: "Can't be blank"
  }
end

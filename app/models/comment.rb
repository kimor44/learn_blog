class Comment < ApplicationRecord
  belongs_to :article
  belongs_to :user

  validates :content, presence: {
    message: "Can't be blank"
  }

  validates :article_id, presence: true
  validates :user_id, presence: true
end

class Article < ApplicationRecord
  belongs_to :user
  has_many :comments

  validates :title, presence: { message: 'title is mandatory!' }
  validates :body, presence: { message: 'body content is mandatory!' }
  validate :user_must_be_admin

  accepts_nested_attributes_for :comments

  scope :prev_article, ->(article_id) { where("id < ?", article_id).maximum(:id) }
  scope :next_article, ->(article_id) { where("id > ?", article_id).minimum(:id) }

  def user_must_be_admin
    if !user.admin
      self.errors.add(:user_not_admin, 'user must be admin')
    end
  end
end

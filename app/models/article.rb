class Article < ApplicationRecord
  belongs_to :user
  has_many :comments

  validates :title, presence: { message: 'title is mandatory!' }
  validates :body, presence: { message: 'body content is mandatory!' }

  accepts_nested_attributes_for :comments

  scope :prev_article, ->(article_id) { where("id < ?", article_id).maximum(:id) }
  scope :next_article, ->(article_id) { where("id > ?", article_id).minimum(:id) }
end

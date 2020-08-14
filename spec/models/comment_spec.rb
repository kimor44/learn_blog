require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject(:user) { User.create!(email: 'coucou@gmail.com', admin: true, password: 'azerty') }
  subject(:article) { Article.create!(title: 'sdfdfs', body: 'Some text long text.....', user_id: user.id) }
  subject(:comment) { Comment.new }

  before do
    comment.update(content: 'Un commentaire', article_id: article.id, user_id: user.id)
  end

  context 'Post a comment with valid argument' do
    it 'is possible' do
      expect(comment.valid?).to eq true
    end
  end

  context 'Post a comment without content' do
    it 'is NOt possible' do
      comment.update(content: '')
      expect(comment.valid?).to eq false
      expect(comment.errors[:content].any?).to eq true
      expect(comment.errors[:content].first).to eq 'Can\'t be blank'
    end
  end

  context 'Post a comment without article_id' do
    it 'is NOt possible' do
      comment.update(article_id: '')
      expect(comment.valid?).to eq false
      expect(comment.errors[:article_id].any?).to eq true
      expect(comment.errors[:article_id].first).to eq 'can\'t be blank'
    end
  end

  context 'Post a comment without user_id' do
    it 'is NOt possible' do
      comment.update(user_id: '')
      expect(comment.valid?).to eq false
      expect(comment.errors[:user_id].any?).to eq true
      expect(comment.errors[:user_id].first).to eq 'can\'t be blank'
    end
  end
end

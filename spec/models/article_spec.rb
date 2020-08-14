require 'rails_helper'

RSpec.describe Article, type: :model do
  subject(:user) { User.create!(email: 'coucou@gmail.com', admin: true, password: 'azerty') }
  subject(:article) { Article.new }

  before do
    article.update(title: 'sdfdfs', body: 'Some text long text.....', user_id: user.id)
  end

  context 'create an article with title and body' do
    it 'is possible' do
      expect(article.valid?).to be true
    end
  end

  context 'create an article without title' do
    it 'is NOT possible' do
      article.title = ""
      expect(article.valid?).to be false
      expect(article.errors[:title].any?).to be true
      expect(article.errors[:title].first).to eq "title is mandatory!"
    end
  end

  context 'create an article without body' do
    it 'is NOT possible' do
      article.body = ""
      expect(article.valid?).to be false
      expect(article.errors[:body].any?).to be true
      expect(article.errors[:body].first).to eq "body content is mandatory!"
    end
  end

  context 'create an article when user is not admin' do
    it 'is NOT possible' do
      user.update(admin: false)
      article2 = Article.create(title: 'un titre', body: 'Lorem ipsum dolor sit amet', user_id: user.id)
      expect(article2.valid?).to be false
      expect(article2.errors[:user_not_admin].any?).to be true
      expect(article2.errors[:user_not_admin].first).to eq 'user must be admin'
    end
  end
end

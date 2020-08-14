require 'rails_helper'

RSpec.describe Book, type: :model do
  subject(:book) { Book.new }
  subject(:category) { Category.create(title: 'Aventure') }

  before do
    book.update(title: 'Reviens', category_id: category.id)
  end

  context 'create a book with title and category' do
    it 'is possible' do
      expect(book.valid?).to be true
    end
  end

  context 'create a book without title' do
    it 'is NOT possible' do
      book.title = ''
      expect(book.valid?).to be false
      expect(book.errors[:title].any?).to be true
      expect(book.errors[:title].first).to eq 'Can\'t be blank'
    end
  end

  context 'create a book without category' do
    it 'is NOT possible' do
      book.category_id = ''
      expect(book.valid?).to be false
      expect(book.errors[:category].any?).to be true
      expect(book.errors[:category].first).to eq 'must exist'
    end
  end

  context 'create a book with the same title as another book' do
    it 'is NOT possible' do
      book2 = Book.create(title: 'Reviens', category_id: category.id)
      expect(book2.valid?).to be false
      expect(book2.errors[:title].any?).to be true
      expect(book2.errors[:title].first).to eq 'Must be unique'
    end
  end

  context 'selects the previous or next book' do
    it 'gets the previous id book' do
      book2 = Book.create(title: 'Livre 2', category_id: category.id)
      expect(Book.prev_book(book2.id)).to eq book2.id - 1
    end

    it 'gets the next id book' do
      book3 = Book.create(title: 'Livre 3', category_id: category.id)
      book4 = Book.create(title: 'Livre 4', category_id: category.id)
      expect(Book.next_book(book3.id)).to eq book3.id + 1
    end
  end
end

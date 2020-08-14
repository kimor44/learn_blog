require 'rails_helper'

RSpec.describe Category, type: :model do
  subject(:category) { Category.new }

  before do
    category.update(title: 'Aventure')
  end

  context 'create a category with valid title' do
    it 'is possible' do
      expect(category.valid?).to be true
    end
  end

  context 'create a category without title' do
    it 'is NOT possible' do
      category.title = ""
      expect(category.valid?).to be false
      expect(category.errors[:title].any?).to be true
      expect(category.errors[:title].first).to eq 'name of category is mandatory!'
    end
  end
end

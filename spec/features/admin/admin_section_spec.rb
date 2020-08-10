require 'rails_helper'

RSpec.feature 'admin::manage', type: :feature do
  context 'Go to manage page' do
    let(:user) { User.create!(email: 'coucou@gmail.com', admin: true, password: 'azerty') }

    context 'user is logged' do
      before { sign_in(user: user) }
      it 'arrives on the main page' do
        expect(current_path).to eq(root_path)
      end

      context 'and goes to manage page' do
        before { visit manage_first_page_path }
        it 'is on manage page' do
          expect(current_path).to eq('/manage/first_page')
        end
      end
    end
  end
end

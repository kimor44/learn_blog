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

        it 'adds a new first_page' do
          click_on 'new first page'
          fill_in 'first_page_title', with: 'My first page'
          click_button 'Submit'

          expect(current_path).to eq(manage_first_page_path)
          expect(page).to have_css '.first_pages li', text: 'My first page'
        end
      end
    end

    context 'user is not logged' do
      it 'redirect to log in page' do
        visit manage_first_page_path
        expect(current_path).to eq(new_user_session_path)
      end
    end

    context 'user is not an admin' do
      before do
        user.update!(admin: false)
        sign_in(user: user)
      end
      it 'redirect to home page' do
        visit manage_first_page_path
        expect(current_path).to eq(root_path)
      end
    end
  end
end

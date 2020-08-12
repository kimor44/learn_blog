require 'rails_helper'

RSpec.feature 'blog', type: :feature do
  context 'Go to blog section' do
    let(:user) { User.create!(email: 'coucou@gmail.com', admin: true, password: 'azerty') }

    context 'user is logged' do
      before do
        sign_in(user: user)
        Article.create(title: 'First article', body: 'Some text long text.....', user_id: user.id)
      end
      it 'arrives on the main page' do
        expect(current_path).to eq(root_path)
      end

      context 'and goes to blog section' do
        let(:article) { Article.first }
        before { click_on 'Blog' }
        it 'is on right page' do
          expect(current_path).to eq(blog_index_path)
        end

        it 'sees the list of articles' do
          expect(page).to have_css '.articles li', text: 'First article'
        end

        it 'clicks on one of them' do
          click_on 'First article'

          expect(current_path).to eq(blog_show_path(id: article.id))
          expect(page).to have_css '.author', text: 'coucou@gmail.com'
        end
      end
    end
  end
end

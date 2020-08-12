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
        let(:article) { Article.last }
        before { click_on 'Blog' }
        it 'is on right page' do
          expect(current_path).to eq(blog_index_path)
        end

        it 'sees the list of articles' do
          expect(page).to have_css '.articles li', text: 'First article'
        end

        context 'clicks on an article' do
          before { click_on 'First article' }

          it 'sees only the selected article' do
            expect(current_path).to eq(blog_show_path(id: article.id))
            expect(page).to have_css '.author', text: 'coucou@gmail.com'
          end

          context 'adds a comment' do
            before do
              fill_comment_form(comment: 'A very beautiful comment')
            end

            it 'redirects to the same page' do
              expect(current_path).to eq(blog_show_path(id: article.id))
            end

            it 'can see his new comment' do
              expect(page).to have_css '.comments li', text: 'A very beautiful comment'
            end
          end
        end
      end
    end
  end
end

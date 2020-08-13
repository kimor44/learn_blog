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

          it 'sees the comment form' do
            expect(page).to have_selector("#comment_content")
          end

          context 'Adds a comment' do
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

          context 'Adds an empty comment' do
            before do
              fill_comment_form(comment: '')
            end

            it 'can\'t see his new comment' do
              expect(page).not_to have_css 'h3', text: 'All the comments'
              expect(page).not_to have_css '.commenter strong', text: 'coucou@gmail.com'
            end

            it 'displays an error message' do
              expect(page).to have_text 'Can\'t be blank'
            end
          end
        end
      end
    end

    context 'User is not logged' do
      before do
        Article.create(title: 'First article', body: 'Some text long text.....', user_id: user.id)
        visit blog_index_path
        click_on 'First article'
      end

      it 'can\'t see the comment form' do
        expect(page).not_to have_selector("#comment_content")
      end
    end
  end
end

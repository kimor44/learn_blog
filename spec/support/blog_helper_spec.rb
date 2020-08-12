def fill_comment_form(comment:)
  fill_in 'comment_content', with: comment
  click_button 'Add new comment'
end

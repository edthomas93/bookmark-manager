feature 'submit a new bookmark' do
  scenario 'click submit after entering bookmark' do
    visit ('/submit-bookmarks')
    fill_in('url', with: 'http://makersacademy.com')
    click_button 'Submit'

    connection = PG.connect(dbname: 'bookmark_manager_test')
    connection.exec("SELECT * FROM bookmarks;")

    expect(page).to have_content "http://makersacademy.com"
  end

  scenario 'error message if URL is not real' do
    visit ('/submit-bookmarks')
    fill_in('url', with: 'evie.korea.io')
    click_button 'Submit'

    expect(page).not_to have_content "evie.korea.io"
    expect(page).to have_content "URL does not exist"
  end
end

feature 'submit a new bookmark' do
  scenario 'click submit after entering bookmark' do
    visit ('/submit-bookmarks')
    fill_in('url', with: 'http://makersacademy.com')
    click_button 'Submit'

    connection = PG.connect(dbname: 'bookmark_manager_test')
    connection.exec("SELECT * FROM bookmarks;")

    expect(page).to have_content "http://makersacademy.com"
  end
end

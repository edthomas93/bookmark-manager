require 'pg'

feature 'view list of bookmarks' do
  scenario 'have hyperlink contents' do
    Bookmark.create(url: 'http://makersacademy.com')
    Bookmark.create(url: 'http://destroyallsoftware.com')
    Bookmark.create(url: 'http://google.com')

    visit ('/bookmarks')
    expect(page).to have_content "http://makersacademy.com"
    expect(page).to have_content "http://destroyallsoftware.com"
    expect(page).to have_content "http://google.com"
  end
end

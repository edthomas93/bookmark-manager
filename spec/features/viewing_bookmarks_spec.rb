feature 'view list of bookmarks' do
  scenario 'have hyperlink contents' do
    visit ('/bookmarks')
    expect(page).to have_content "http://makersacademy.com"
    expect(page).to have_content "http://destroyallsoftware.com"
    expect(page).to have_content "http://google.com"
  end
end

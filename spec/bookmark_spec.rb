require 'bookmark'

describe Bookmark do
  describe '.all' do
    it 'returns all bookmarks' do
      Bookmark.create(url: 'http://makersacademy.com')
      Bookmark.create(url: 'http://destroyallsoftware.com')
      Bookmark.create(url: 'http://google.com')

      expected_bookmarks = [
        'http://makersacademy.com',
        'http://destroyallsoftware.com',
        'http://google.com'
      ]

      expect(Bookmark.all).to eq expected_bookmarks
    end
  end

  describe '.create' do
    it 'creates a new bookmark' do
      Bookmark.create(url: 'http://ed.com')
      expect(Bookmark.all).to include 'http://ed.com'
    end

    it 'raises error if URL not real' do
      Bookmark.create(url: 'evie.korea.io')
      expect(Bookmark.all).not_to include 'URL does not exist'
    end
  end
end

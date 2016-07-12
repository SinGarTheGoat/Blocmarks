require 'rails_helper'

RSpec.describe Bookmark, type: :model do
    it 'validates url is present' do
      bookmark = Bookmark.new
      expect(bookmark.valid?).to eq(false)
    end

    it 'validates http is set' do
      bookmark = Bookmark.new(url: 'http://www.google.com')
      expect(bookmark.valid?).to eq(true)
    end

    it "prepends http to the url" do
      bookmark = Bookmark.new(url: 'www.google.com')
      bookmark.httpset
      expect(bookmark.url).to eq('http://www.google.com')
    end
end

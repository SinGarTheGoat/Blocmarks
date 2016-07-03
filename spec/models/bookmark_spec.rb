require 'rails_helper'

RSpec.describe Bookmark, type: :model do
  describe "#httpset" do
  it "sets http on an invalid url" do
    bookmark = bookmark.new(url: "google.com")
    expect { bookmark.httpset }.to change { bookmark.url }.from("google.com").to("http://google.com")
  end
end
end

require 'rails_helper'

RSpec.describe Bookmark, type: :model do
  it {is_expected.to have_many(:likes)}
    it 'vallidates url is present' do
        expect(Bookmark.new).to_not be_valid
    end

    it 'validates http is set' do
        expect(Bookmark.new(url: 'www.google.com')).to be_valid
    end
end

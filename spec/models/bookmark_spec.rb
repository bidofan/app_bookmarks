require 'rails_helper'

RSpec.describe Bookmark, :type =>   :model do
  it 'is valid with valid attributes' do
    bookmark = Bookmark.new(id: 1, url: "http://google.com", screenshot_url: "someurl.com", user_id: 2)
    expect(bookmark).to be_valid
  end
  it 'is not valid without a url'
end

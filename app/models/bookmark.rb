require 'uri'
class Bookmark < ApplicationRecord
    after_create :screenshot, :set_screen_url
    validates :url, :format => URI::regexp(%w(http https)), presence: true

    belongs_to :user

    private
    def self.search(search)
        where('url LIKE ?', "%#{search}%")
    end
    def url_title
        URI.parse(url).host.sub(/\Awww\./, '')
    end
    def set_screen_url(params)
        update(screenshot_url: @uploader['url'])
    end
    def screenshot
      ws = Webshot::Screenshot.instance
      screenshot = ws.capture url, "#{url_title}.png", width: 154, height: 128, quality: 85
      @uploader = Cloudinary::Uploader.upload(screenshot.path)
    end
end

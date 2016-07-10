class Bookmark < ActiveRecord::Base
  belongs_to :user
  belongs_to :topic
  before_validation :httpset
  validates :url, format: { with: /\Ahttp:\/\/.*(com|org|net|gov)/i,
    message: "only allows valid URLs." }

  def  httpset
    if self.url =~ /\Ahttp:\/\/|\Ahttps:\/\//i
    else
      if self.url.present?
        self.url = "http://"+ self.url
      else
        self.url = nil
      end
    end

  end

end

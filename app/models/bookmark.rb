class Bookmark < ActiveRecord::Base

  belongs_to :topic
  before_validation :httpset
  validates :url, format: { with: /\Ahttp:\/\/.*(com|org|net|gov)/i,
    message: "only allows valid URLs." }

  def  httpset
    if self.url =~ /\Ahttp:\/\/|\Ahttps:\/\//i
    else
      self.url = "http://"+ self.url
    end

  end

end

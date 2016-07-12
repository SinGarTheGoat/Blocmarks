class Bookmark < ActiveRecord::Base
  belongs_to :topic
  before_validation :httpset

  validates :url, presence: true
  validates :url, format: { with: /.*(com|org|net|gov)/i,
    message: "only allows valid URLs." }

  def httpset
    return false if self.url.nil?

    unless self.url =~ /\Ahttp:\/\/|\Ahttps:\/\//i
      self.url = "http://" + self.url
    end
  end
end

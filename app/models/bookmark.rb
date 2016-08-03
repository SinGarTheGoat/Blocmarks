class Bookmark < ActiveRecord::Base
  belongs_to :user
  belongs_to :topic
  has_many :likes, dependent: :destroy
  before_validation :httpset
  validates :url, format: { with: /\Ahttp:\/\/.*(com|org|net|gov)/i,
    message: "only allows valid URLs." }
  scope :liked_by, ->(user) { joins(:likes).where(likes: { user_id: user.id }) }
  # def self.liked_by(user)
  #   joins(:likes).where(likes: { user_id: user.id })
  # end


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

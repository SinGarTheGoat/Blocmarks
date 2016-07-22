class Topic < ActiveRecord::Base
  belongs_to :user
  has_many :bookmarks, dependent: :destroy

  validates :title, uniqueness: {scope: :user}
  validates :user_id, presence: true
end

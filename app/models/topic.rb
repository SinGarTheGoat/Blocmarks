class Topic < ActiveRecord::Base
  belongs_to :user
  has_many :bookmarks, dependent: :destroy

  validates :title, uniqueness: {scope: :user}
end

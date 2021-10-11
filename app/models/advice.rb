class Advice < ApplicationRecord
  belongs_to :member
  has_many :favorites, dependent: :destroy
  has_many :advice_comments, dependent: :destroy
  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 220 }

  def favorited_by?(member)
    favorites.where(member_id: member.id).exists?
  end
end

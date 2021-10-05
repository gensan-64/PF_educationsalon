class Advice < ApplicationRecord
 belongs_to :member
 validates :title, presence: true
 validates :body, presence: true, length: { maximum: 220 }
end

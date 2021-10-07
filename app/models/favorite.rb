class Favorite < ApplicationRecord
 belongs_to :member
 belongs_to :advice
 validates_uniqueness_of :advice_id, scope: :member_id
end

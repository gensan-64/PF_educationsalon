class AdviceComment < ApplicationRecord
 belongs_to :member
 belongs_to :advice

 validates :comment, presence: tru
end

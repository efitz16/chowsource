class Rating < ActiveRecord::Base
  belongs_to :user
  belongs_to :recipe

  validates_uniqueness_of :user, { scope: [:recipe], message: "a user can only rate this recipe one time" }
  validates :value, presence: true
end

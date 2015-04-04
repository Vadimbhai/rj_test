class Comment < ActiveRecord::Base
  validates :content, presence: true
  validates :user, presence: true

  has_one :user
  accepts_nested_attributes_for :user
end

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :drawer

  validates :comment, presence: true
end

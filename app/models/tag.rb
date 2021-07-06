class Tag < ApplicationRecord
  belongs_to :user
  has_many :item_tags, dependent: :destroy
end

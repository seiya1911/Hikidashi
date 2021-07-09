class Item < ApplicationRecord
  belongs_to :user
  belongs_to :drawer
  has_many :item_tags, dependent: :destroy
  has_many :tags, through: :item_tags
end

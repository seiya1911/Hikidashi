class Tag < ApplicationRecord
  has_many :item_tags, dependent: :destroy
  has_many :items, through: :item_tags
  belongs_to :user

  validates :tag_name, presence: true

end

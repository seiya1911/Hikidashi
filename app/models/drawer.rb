class Drawer < ApplicationRecord
  belongs_to :user
  has_many :items, dependent: :destroy
  has_many :comments, dependent: :destroy
end

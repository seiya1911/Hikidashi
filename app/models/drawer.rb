class Drawer < ApplicationRecord
  belongs_to :user
  has_many :items, dependent: :destroy
  has_many :comments, dependent: :destroy
  
  validates :name, presence: true
  validates :description, presence: true

  # 画像投稿
  attachment :image
end

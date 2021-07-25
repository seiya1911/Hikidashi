class Drawer < ApplicationRecord
  belongs_to :user
  has_many :items, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true

  # 画像投稿
  attachment :image

  # 検索用メソッド
  def self.search(user_id, keyword)
    @search_drawers = Drawer.where("user_id = ? and (name like? OR description like?)", user_id, "%#{keyword}%", "%#{keyword}%")
  end
end

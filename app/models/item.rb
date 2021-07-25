class Item < ApplicationRecord
  belongs_to :user
  belongs_to :drawer
  has_many :item_tags, dependent: :destroy
  has_many :tags, through: :item_tags

  validates :name, presence: true
  validates :description, presence: true
  validates :image, presence: true

  # DragAndDrop
  include RankedModel
  ranks :row_order

  # タグを保存する
  def save_tag(saveitem_tags)
    current_tags = self.tags.pluck(:tag_name) unless self.tags.nil?
    old_tags = current_tags - saveitem_tags
    new_tags = saveitem_tags - current_tags

    old_tags.each do |old_name|
      self.tags.delete Tag.find_by(tag_name: old_name)
    end

    new_tags.each do |new_name|
      item_tag = Tag.find_or_create_by(tag_name: new_name)
      self.tags << item_tag
    end
  end

  # 画像投稿
  attachment :image

  # 検索用メソッド
  def self.search(user_id, keyword)
    @search_items = Item.where("user_id = ? and (name like? OR description like?)", user_id ,"%#{keyword}%", "%#{keyword}%")
  end
end

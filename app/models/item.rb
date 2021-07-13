class Item < ApplicationRecord
  belongs_to :user
  belongs_to :drawer
  has_many :item_tags, dependent: :destroy
  has_many :tags, through: :item_tags

  # タグを保存する
  def save_tag(tag_list)
    if self.tags != nil
      item_tags_records = ItemTag.where(item_id: self.id)
      item_tags_records.destroy_all
    end

    tag_list.each do |tag|
      inspected_tag = Tag.where(tag_name: tag).first_or_create
      self.tags << inspected_tag
    end

  end

  attachment :image

  # 検索用メソッド
  def self.search(keyword)
    @search_items = Item.where("name like?" , "%#{keyword}%")
  end
end

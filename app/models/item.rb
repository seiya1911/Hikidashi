class Item < ApplicationRecord
  belongs_to :user
  belongs_to :drawer
  has_many :item_tags, dependent: :destroy
  has_many :tags, through: :item_tags

  # タグを保存する
  # def save_tag(sent_tag)
  #   current_tags = self.tags.pluck(:tag_name) unless self.tags.nil?
  #   old_tags = current_tags - sent_tags
  #   new_tags = sent_tags - current_tags

  #   old_tags.each do |old|
  #     self.item_tags.delete ItemTag.find_by(tag_name: old)
  #   end

  #   new_tags.each do |new|
  #     new_item_tag = ItemTag.find_or_create_by(tag_name: new)
  #     self.item_tags << new_item_tag
  #   end
  # end

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
end

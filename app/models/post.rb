class Post < ApplicationRecord
  resourcify
  is_impressionable


  has_many :ingredients, dependent: :destroy
  accepts_nested_attributes_for :ingredients, allow_destroy: true

  has_many :steps, dependent: :destroy
  accepts_nested_attributes_for :steps, allow_destroy: true

  mount_uploader :image, ImageUploader

  has_many :post_attachments
  accepts_nested_attributes_for :post_attachments

  has_many :likes, dependent: :destroy

  belongs_to :user
  acts_as_commentable

  belongs_to :category

  # paginates_per 4

  # 해시태그 DB 모델관계 설정
  has_and_belongs_to_many :tags

  after_create do
      post = Post.find_by(id: self.id)
      hashtags = self.description.scan(/[#＃][a-z|A-Z|가-힣|0-9|\w]+/)
      hashtags.uniq.map do |hashtag|
          tag = Tag.find_or_create_by(name: hashtag.downcase.delete('#'))
          post.tags << tag
      end
  end

  before_update do
      post = Post.find_by(id: self.id)
      post.tags.clear
      hashtags = self.description.scan(/[#＃][a-z|A-Z|가-힣|0-9|\w]+/)
      hashtags.uniq.map do |hashtag|
          tag = Tag.find_or_create_by(name: hashtag.downcase.delete('#'))
          post.tags << tag
      end
  end



end

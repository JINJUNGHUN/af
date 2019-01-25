class Post < ApplicationRecord
  has_many :ingredients, dependent: :destroy
  accepts_nested_attributes_for :ingredients, allow_destroy: true

  has_many :steps, dependent: :destroy
  accepts_nested_attributes_for :steps, allow_destroy: true

  mount_uploader :image, ImageUploader

  has_many :post_attachments
  accepts_nested_attributes_for :post_attachments

  belongs_to :user

end

class Image < ApplicationRecord
  belongs_to :user

  mount_uploader :image, ImageUploader
=begin  after_save :rotate_image, if: ->(obj){obj.rotated.present? && obj.rotated?}

  def rotate_image
    self.image_path.recreate_versions!
  end
=end

end

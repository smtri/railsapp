# validations
class User < ApplicationRecord
  has_secure_password
  has_many :images, dependent: :destroy
  validates :email, presence: true,
                    uniqueness: true,
                    length: {
                      minimum: 5,
                      maximum: 200,
                      too_long: '%{count} characters is the max allowed',
                      too_short: '%{count} characters is the min allowed'
                    }
  validates :password, presence: true,
                       length: {
                         minimum: 4,
                         maximum: 20,
                         too_long: '%{count} characters is the max allowed',
                         too_short: '%{count} characters is the min allowed'
                       }
  mount_uploader :image, ImageUploader
end

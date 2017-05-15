class Photo < ApplicationRecord
  belongs_to :status

  has_attached_file :image, styles: {mini: '200x200'}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end

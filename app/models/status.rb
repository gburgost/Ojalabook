class Status < ApplicationRecord
  belongs_to :user

  validates :contenido, presence: true,
                        length: { minimum: 2 }
  validates :user_id, presence: true

  #Imagen imagen de statuses       
  has_attached_file :imagen, styles: { :medium => "600x600>", :thumb => "100x100" }
  validates_attachment_content_type :imagen, :content_type => /\Aimage\/.*\Z/
end

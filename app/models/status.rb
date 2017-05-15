class Status < ApplicationRecord
  belongs_to :user
  has_many :photos

  validates :contenido, presence: true,
                        length: { minimum: 2 }
  validates :user_id, presence: true

  #Imagen imagen de statuses       
  has_attached_file :imagen, styles: { :medium => "600x600>", :thumb => "100x100" }
  validates_attachment_content_type :imagen, :content_type => /\Aimage\/.*\Z/

  after_create :save_photos
  after_update :save_photos
  def photos=(value)
    @photos = value
  end

  private
  def save_photos
    if @photos
      @photos.each do |photo_image|
        Photo.create(status_id: self.id, image: photo_image)
      end
    end
  end
end

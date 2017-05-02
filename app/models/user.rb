class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  #Imagen avatar del usuario       
  has_attached_file :avatar, styles: { :medium => "300x300>", :thumb => "100x100" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  # attr_accessor :primer_nombre, :primer_apellido, :nombre_perfil,
  #           :email, :password, :password_confirmation 

  has_many :statuses

  validates :primer_nombre, presence: true
  validates :primer_apellido, presence: true
  validates :nombre_perfil, presence: true,
                            uniqueness: true,
                            format: {
                              with: /\A[a-zA-Z0-9_-]+\z/,
                              message: 'Debe estar formateado correctamente'
                            }

    #                         validates :legacy_code, format: { with: /\A[a-zA-Z0-9_-]+\z/,
    # message: "only allows letters" }

  def nombre_completo
    primer_nombre + " " + primer_apellido
  end
end

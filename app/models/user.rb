class User< OmniAuth::Identity::Models::ActiveRecord
  has_secure_password
  validates_presence_of :name
  validates_uniqueness_of :email

      #Mounts paperclip image
  has_one_attached :image #, :styles => { :large => "900>", :medium => width = "600>", :small => width = "300>", :thumb => "100>" }
  # validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  has_many :dogs
  has_many :walks, through: :dogs


  def self.from_omniauth(auth)
    find_by_provider_and_uid(auth["provider"], auth["uid"]) ||create_with_omniauth(auth)
  end

  require 'securerandom'

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
      user.password = SecureRandom.urlsafe_base64
    end
  end

end

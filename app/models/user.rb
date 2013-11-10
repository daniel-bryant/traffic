class User < ActiveRecord::Base
  belongs_to :map, dependent: :destroy

  before_save { self.email = email.downcase }
  before_create :create_token_and_map

  validates :name,  presence: true, length: {maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, length: { minimum: 8 }

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

    def create_token_and_map
      self.remember_token = User.encrypt(User.new_remember_token)
      self.map_id = Map.create().id
    end
end

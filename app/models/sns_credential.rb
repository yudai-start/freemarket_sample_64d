class SnsCredential < ApplicationRecord

  belongs_to :user

  def self.from_omniauth(auth)
    self.where(uid: auth.uid)
  end

end

# provider: auth.provider && 
class SnsCredential < ApplicationRecord

  belongs_to :user

  def self.from_omniauth(auth)
    self.where(provider: auth.provider, uid: auth.uid)
  end

end
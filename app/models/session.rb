class Session < ApplicationRecord
  belongs_to :user

  before_create :create_session_key

  private

  def create_session_key
    self.key = SecureRandom.hex(40)
  end
end

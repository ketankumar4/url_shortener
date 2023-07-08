class Url < ApplicationRecord
  validates :long_url, presence: true
  validates :short_url, uniqueness: true

  before_validation :generate_short_url

  def generate_short_url
    self.short_url = SecureRandom.hex(4)
  end
end

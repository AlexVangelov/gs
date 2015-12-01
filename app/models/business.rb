class Business < ActiveRecord::Base
  belongs_to :account, inverse_of: :businesses
  has_sellings
  
  validates :name, presence: true, uniqueness: true
  validates_uniqueness_of :uuid
  
  before_create do
    self.uuid = SecureRandom.hex
  end
end

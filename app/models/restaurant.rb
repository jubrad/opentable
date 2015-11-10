class Restaurant < ActiveRecord::Base
  belongs_to :owner
  validates_presence_of :name, :description, :owner_id
  validates_uniqueness_of :name
  # validates :phone, format: { with: /\d{3}-\d{3}-\d{4}/, message: "invalid phone number" }
  # validates :weburl, format: {with: URI::regexp(%w(http https)), message: 'invalide web address'}
end

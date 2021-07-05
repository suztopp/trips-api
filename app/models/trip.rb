class Trip < ApplicationRecord
	validates :name, :country, :length, presence: true
	validates :length, numericality: { greater_than: 0 }
	has_many :activities, dependent: :destroy
	belongs_to :user
end

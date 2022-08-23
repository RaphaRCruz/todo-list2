class Task < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true

  before_validation :capitalize

  def capitalize
    name.capitalize!
    description.capitalize!
  end
end

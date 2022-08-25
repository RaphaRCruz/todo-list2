class Task < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true

  before_validation :capitalize

  def capitalize
    name.capitalize!
    description.capitalize!
  end

  def self.completed
    Task.where(done: true).count
  end

  def self.percent_done
    return 0 if total == 0
    (100 * completed.to_f / total).round(1)
  end

  def self.total
    Task.count
  end
end

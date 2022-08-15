class Minute < ApplicationRecord
  belongs_to :user
  validates :category, presence: true
  
  def getTimeDiff
    if (stop != nil)
      ((stop - start) / 60).floor
    end
  end

  def self.grandTotal
    sum(:total)
  end

  def self.categoryTotal
   Minute.group(:category).sum(:total)
  end
end

class Minute < ApplicationRecord
  belongs_to :user
  validates :category, presence: true

  def getTimeDiff
    if (stop != nil)
      self.total = ((stop - start) / 60).floor
    end
  end
  
  def grandTotal
    sum(:total)
  end

  def categoryTotal
   Minute.group(:category).sum(:total)
  end
end

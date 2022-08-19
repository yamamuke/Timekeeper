class Minute < ApplicationRecord
  belongs_to :user
  validates :category, presence: { message: 'カテゴリーは必須項目です。' }

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

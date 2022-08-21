class Minute < ApplicationRecord
  belongs_to :user
  validates :category, presence: true

  def getTimeDiff
    if (stop != nil)
      self.total = ((stop - start) / 60).floor
    end
  end
end

class Minute < ApplicationRecord
  belongs_to :user
  validates :category, presence: true
  validates :start, presence: true
  # validates :stop, presence: true

  def getTimeDiff
    if (stop != nil)
      self.total = ((stop - start) / 60).floor
    end
  end
end

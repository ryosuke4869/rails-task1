class Post < ApplicationRecord
  validates :title, presence:true
  validates :start,  presence:true
  validates :fin,  presence:true
  validates :memo, length: {maximum:100}

  validate :start_fin_check
    def start_fin_check
      if :fin < :start
        errors.add(:fin,"は開始日以降の日付にしてください")
      end
    end
end

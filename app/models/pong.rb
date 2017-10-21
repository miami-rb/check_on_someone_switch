class Pong < ApplicationRecord
  belongs_to :contact

  scope :by_date, ->(start_time, end_time) { where(created_at: start_time..end_time) }
end

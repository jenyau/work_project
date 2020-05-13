class Task < ApplicationRecord
  validates :name, presence: true
  validates :status, presence: true
  belongs_to :user

  enum status: [:complete, :failed, :in_progress]
  scope :total_complete, -> { where(status: 'complete').length }
  scope :percent, -> { ((where(status: 'complete').length.to_f / (where(status: 'complete').length + where(status: 'failed').length).to_f) *100).to_i }



end

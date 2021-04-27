class Task < ApplicationRecord
  has_many :task_logs
  belongs_to :project
end


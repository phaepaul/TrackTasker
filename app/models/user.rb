class User < ApplicationRecord
  has_many :task_logs
end
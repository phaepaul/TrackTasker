class TaskLogs < ActiveRecord::Migration[6.1]
  def change
    create_table :task_logs do |t|
      t.integer :task_id
      t.integer :duration_minutes
      t.integer :user_id

      t.timestamps
    end
  end
end

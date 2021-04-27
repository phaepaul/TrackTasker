class Tasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.integer :project_id
      t.text :description

      t.timestamps
    end
  end
end

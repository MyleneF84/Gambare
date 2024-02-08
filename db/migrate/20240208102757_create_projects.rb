class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.datetime :start_date
      t.datetime :end_date
      t.integer :goal_amount
      t.integer :current_amount

      t.timestamps
    end
  end
end

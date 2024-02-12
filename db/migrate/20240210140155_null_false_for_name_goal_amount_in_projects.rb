class NullFalseForNameGoalAmountInProjects < ActiveRecord::Migration[7.0]
  def up
    change_column_null(:projects, :name, false)

    Project.where(goal_amount: nil).find_each { |project| project.update!(goal_amount: 0) }

    change_column_null(:projects, :goal_amount, false)
  end
end

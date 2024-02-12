class ProjectCreator
  def initialize(name:, goal_amount:, start_date:, end_date:, current_user_id:)
    @name = name
    @goal_amount = goal_amount
    @start_date = start_date
    @end_date = end_date
    @current_user_id = current_user_id
  end

  def call
    Project.transaction do
      @new_project = Project.create!(name: @name, goal_amount: @goal_amount, start_date: @start_date, end_date: @end_date)
      Transaction.create!(project_id: @new_project.id, user_id: @current_user_id, amount: 0)
      rescue => error
        puts "Error :( --- #{error}"
    end
    @new_project
  end
end

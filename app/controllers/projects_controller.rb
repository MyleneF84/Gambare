class ProjectsController < ApplicationController
  before_action :set_project, only: %i[show]
  before_action :set_user, only: %i[ show]
  before_action :uniq_name_project_per_user, only: :create

  def index
    @projects = current_user.projects.distinct
  end

  def new
    @project = Project.new
  end

  def create
    @current_user_id = current_user.id
    @project = ProjectCreator.new(
      name: project_params[:name],
      goal_amount: project_params[:goal_amount],
      start_date: project_params[:start_date],
      end_date: project_params[:end_date],
      current_user_id: @current_user_id).call
    if @project.persisted?
      redirect_to project_path(@project)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @transaction = Transaction.new
  end

  private

  def project_params
    params.require(:project).permit(:name, :goal_amount, :start_date, :end_date)
  end

  def set_project
    @project = Project.find(params[:id])
  end

  def set_user
    @user = current_user
  end

  def uniq_name_project_per_user
    @project = Project.new(project_params)
    if Project.joins(:transactions).where(transactions: {user_id: current_user.id}).pluck(:name).include?(project_params[:name])
      flash[:alert] = "You already have a project named like this 😬"
      render :new, status: :unprocessable_entity
    end
  end

end

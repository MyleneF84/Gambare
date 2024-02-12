class TransactionsController < ApplicationController
  def new
    @transaction = Transaction.new
    @transaction.project = Project.find(params[:project_id])
    @transaction.user = current_user
  end

  def create
    @transaction = Transaction.new(transaction_params)
    @transaction.user = User.first
    @transaction.project = Project.find(params[:project_id])

    if @transaction.save!
      # @transaction.project = Project.find(params[:project_id])
      new_amount = @transaction.amount += @transaction.project.current_amount
      @transaction.project.update!(current_amount: new_amount)

      redirect_to project_path(@transaction.project)
    else
      render :new
    end
  end

  private

  def transaction_params
    params.require(:transaction).permit(:project_id, :user_id, :amount)
  end
end

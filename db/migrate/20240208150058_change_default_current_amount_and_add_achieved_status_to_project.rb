class ChangeDefaultCurrentAmountAndAddAchievedStatusToProject < ActiveRecord::Migration[7.0]
  def change
    add_column :projects, :achieved, :boolean, default: false

    change_column :projects, :current_amount, :integer, default: 0
  end
end

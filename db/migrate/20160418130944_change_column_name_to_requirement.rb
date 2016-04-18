class ChangeColumnNameToRequirement < ActiveRecord::Migration
  def change
  	change_column(:requirements, :phone, :string)
  end
end

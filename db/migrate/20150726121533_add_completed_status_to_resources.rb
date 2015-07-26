class AddCompletedStatusToResources < ActiveRecord::Migration
  def change
    add_column :resources, :completed, :boolean
  end
end

class AddTitleToStatuses < ActiveRecord::Migration[5.0]
  def change
    add_column :statuses, :title, :string
  end
end

class RenameWorkStartColumnToUsers < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :work_start, :designated_work_start_time
    rename_column :users, :work_end, :designated_work_end_time
  end
end

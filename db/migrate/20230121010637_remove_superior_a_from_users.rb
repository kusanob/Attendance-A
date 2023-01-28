class RemoveSuperiorAFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :superiorA, :boolean
    remove_column :users, :superiorB, :boolean
  end
end

class AddSuperiorAToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :superiorB, :boolean, default: false
  end
end

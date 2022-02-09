class AddValidatesToUsers < ActiveRecord::Migration[6.1]
  def change
    change_column_null(:users, :first_name, true)
  end
end

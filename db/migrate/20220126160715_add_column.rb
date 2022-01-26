class AddColumn < ActiveRecord::Migration[6.1]
  def change
    add_column('likes', 'value', 'integer')
  end
end

class FixColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :posts, :type, :group
  end
end

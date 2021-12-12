class RemoveFieldNameFromTableName < ActiveRecord::Migration[6.1]
  def change
    remove_column :articles, :last_updated, :datetime
  end
end

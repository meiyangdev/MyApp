class UpdateClientUserIdTypeAsInteger < ActiveRecord::Migration[6.0]
  def change
    remove_column :clients, :user_id, :string
    add_column :clients, :user_id, :integer
  end
end

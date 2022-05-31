class CreateMyModels < ActiveRecord::Migration[6.0]
  def change
    create_table :my_models do |t|
      t.text :name
      t.timestamps
    end
  end
end

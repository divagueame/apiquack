class CreateEndpoints < ActiveRecord::Migration[7.0]
  def change
    create_table :endpoints do |t|
      t.string :name, null: false
      t.text :url, null: false
      t.text :description

      t.timestamps
    end
  end
end

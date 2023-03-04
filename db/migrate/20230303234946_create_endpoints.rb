class CreateEndpoints < ActiveRecord::Migration[7.0]
  def change
    create_table :endpoints do |t|
      t.string :name
      t.text :url
      t.text :description

      t.references :expected_payload, foreign_key: { to_table: :payloads }, null: true
      t.references :wrong_payload, foreign_key: { to_table: :payloads }, null: true

      t.timestamps
    end
  end
end

class CreateEndpointPayload < ActiveRecord::Migration[7.0]
  def change
    create_table :endpoint_payloads do |t|

      t.references :endpoint, null: false, foreign_key: true
      t.references :payload, null: false, foreign_key: true
      t.boolean :expect_success, null: false, default: true

      t.timestamps
    end
  end
end

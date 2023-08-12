class CreatePaymentsEntities < ActiveRecord::Migration[7.0]
  def change
    create_table :payments_entities do |t|
      t.integer :author_id
      t.string :name
      t.decimal :amount

      t.timestamps
    end
  end
end

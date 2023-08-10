class CreateCategorisations < ActiveRecord::Migration[7.0]
  def change
    create_table :categorisations do |t|
      t.references :group, null: false, foreign_key: true
      t.references :payments_entity, null: false, foreign_key: true

      t.timestamps
    end
  end
end

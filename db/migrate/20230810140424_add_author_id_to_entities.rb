class AddAuthorIdToEntities < ActiveRecord::Migration[7.0]
  def change
    add_reference :payments_entities, :author_id, foreign_key: { to_table: :users }
end
end

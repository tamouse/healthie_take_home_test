class CreateJounralEntries < ActiveRecord::Migration[7.0]
  def change
    create_table :jounral_entries do |t|
      t.belongs_to :client, null: false, foreign_key: true
      t.text :entry
      t.datetime :posted_at
      t.boolean :published

      t.timestamps
    end
  end
end

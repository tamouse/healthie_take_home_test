# frozen_string_literal: true

class CreateJournalEntries < ActiveRecord::Migration[7.0]
  def change
    create_table :journal_entries do |t|
      t.belongs_to :client, null: false, foreign_key: true
      t.text :entry
      t.datetime :posted_at
      t.boolean :published, null: false, default: false

      t.timestamps
    end
  end
end

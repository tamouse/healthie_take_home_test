# frozen_string_literal: true

class CreateProviders < ActiveRecord::Migration[7.0]
  def change
    create_table :providers do |t|
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end

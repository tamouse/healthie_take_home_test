class CreatePlans < ActiveRecord::Migration[7.0]
  def change
    create_table :plans do |t|
      t.string :name
      t.belongs_to :client, null: false, foreign_key: true
      t.belongs_to :provider, null: false, foreign_key: true

      t.timestamps
    end
  end
end

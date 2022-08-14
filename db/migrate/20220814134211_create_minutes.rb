class CreateMinutes < ActiveRecord::Migration[5.2]
  def change
    create_table :minutes do |t|
      t.string :category
      t.string :content
      t.time :start
      t.time :stop
      t.integer :total
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

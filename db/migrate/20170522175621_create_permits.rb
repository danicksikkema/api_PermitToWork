class CreatePermits < ActiveRecord::Migration[5.0]
  def change
    create_table :permits do |t|
      t.string :name
      t.string :type
      t.text :description
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end

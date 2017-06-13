class CreateProtections < ActiveRecord::Migration[5.0]
  def change
    create_table :protections do |t|
      t.string :name
      t.belongs_to :permit, index: true

      t.timestamps
    end
  end
end

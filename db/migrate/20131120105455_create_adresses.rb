class CreateAdresses < ActiveRecord::Migration
  def change
    create_table :adresses do |t|
      t.string :street
      t.integer :number
      t.string :zipcode

      t.timestamps
    end
  end
end

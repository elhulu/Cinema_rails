class CreateActors < ActiveRecord::Migration
  def change
    create_table :actors do |t|
      t.string :first_name
      t.string :last_name
      t.string :picture
      t.references :film, index: true

      t.timestamps
    end
  end
end

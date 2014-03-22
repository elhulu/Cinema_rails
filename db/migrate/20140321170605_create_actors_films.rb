class CreateActorsFilms < ActiveRecord::Migration
  def change
    create_table :actors_films do |t|
        t.belongs_to :actor
        t.belongs_to :film
    end
  end
end

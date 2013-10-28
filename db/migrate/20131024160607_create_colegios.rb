class CreateColegios < ActiveRecord::Migration
  def change
    create_table :colegios do |t|
      t.string :nombre
      t.string :direccion
      t.string :nivel_icfes
      t.integer :estrato
      t.string :enfasis
      t.integer :latitud
      t.integer :longitud
      t.integer :suma_rankin
      t.integer :numero_rankin

      t.timestamps
    end
  end
end

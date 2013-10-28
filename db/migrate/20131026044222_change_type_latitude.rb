class ChangeTypeLatitude < ActiveRecord::Migration
  def up
    change_table :colegios do |t|
      t.change :latitud, :float
      t.change :longitud, :float
    end
  end

  def down
    change_table :companies do |t|
      t.change :latitude, :integer
      t.change :longitud, :integer
    end
  end
end

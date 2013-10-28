class CreateAdministradores < ActiveRecord::Migration
  def change
    create_table :administradores do |t|
      t.string :user_type
      t.string :password_digest

      t.timestamps
    end
  end
end

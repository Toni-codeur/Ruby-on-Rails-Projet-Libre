class AjoutIndexEmailUtilisateur < ActiveRecord::Migration[5.1]
  def change
    add_index :utilisateurs, :email, unique: true 
  end
end

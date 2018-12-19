class AjoutMdpUtilisateurs < ActiveRecord::Migration[5.1]
  def change
    add_column :utilisateurs, :password_digest, :string
  end
end

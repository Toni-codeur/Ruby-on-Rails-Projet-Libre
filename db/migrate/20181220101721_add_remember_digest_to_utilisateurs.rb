class AddRememberDigestToUtilisateurs < ActiveRecord::Migration[5.0]
  def change
    add_column :utilisateurs, :remember_digest, :string
  end
end

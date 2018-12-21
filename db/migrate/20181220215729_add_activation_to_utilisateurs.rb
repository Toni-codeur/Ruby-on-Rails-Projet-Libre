class AddActivationToUtilisateurs < ActiveRecord::Migration[5.1]
  def change
    add_column :utilisateurs, :activation_digest, :string
    add_column :utilisateurs, :activated, :boolean, default: false
    add_column :utilisateurs, :activated_at, :datetime
  end
end

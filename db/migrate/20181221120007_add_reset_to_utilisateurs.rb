class AddResetToUtilisateurs < ActiveRecord::Migration[5.1]
  def change
    add_column :utilisateurs, :reset_digest, :string
    add_column :utilisateurs, :reset_sent_at, :datetime
  end
end

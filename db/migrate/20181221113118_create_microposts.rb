class CreateMicroposts < ActiveRecord::Migration[5.1]
  def change
    create_table :microposts do |t|
      t.string :content
      t.string :text
      t.references :utilisateur, foreign_key: true

      t.timestamps
    end
  end
end

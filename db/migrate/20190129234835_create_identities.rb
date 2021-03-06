class CreateIdentities < ActiveRecord::Migration[5.2]
  def change
    create_table :identities do |t|
      t.string :provider
      t.string :uid
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end

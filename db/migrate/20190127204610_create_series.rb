class CreateSeries < ActiveRecord::Migration[5.2]
  def change
    create_table :series do |t|
      t.string :title
      t.belongs_to :medium, foreign_key: true

      t.timestamps
    end
  end
end

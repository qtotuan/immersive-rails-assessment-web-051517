class CreateAppearances < ActiveRecord::Migration[5.0]
  def change
    create_table :appearances do |t|
      t.integer :rating
      t.references :guest
      t.references :episode

      t.timestamps
    end
  end
end

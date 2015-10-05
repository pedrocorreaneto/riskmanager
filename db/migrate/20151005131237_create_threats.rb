class CreateThreats < ActiveRecord::Migration
  def change
    create_table :threats do |t|
      t.string :title
      t.string :category
      t.text :description

      t.timestamps
    end
  end
end

class CreateMitigations < ActiveRecord::Migration
  def change
    create_table :mitigations do |t|
      t.string :title
      t.text :description
      t.text :cons
      t.integer :usedtimes
      t.references :threat, index: true

      t.timestamps
    end
  end
end

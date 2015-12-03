class Tableriskmitigation < ActiveRecord::Migration
  def change
    create_table :mitigations_risks, id: false do |t|
      t.belongs_to :risk, index: true
      t.belongs_to :mitigation, index: true
    end
    remove_column :risks, :mitigation_id
  end
end

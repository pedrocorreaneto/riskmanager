class CreateRisks < ActiveRecord::Migration
  def change
    create_table :risks do |t|
      t.references :project, index: true
      t.references :threat, index: true
      t.references :mitigation, index: true
      t.boolean :riskaccept

      t.timestamps
    end
  end
end

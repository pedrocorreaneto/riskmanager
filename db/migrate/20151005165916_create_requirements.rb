class CreateRequirements < ActiveRecord::Migration
  def change
    create_table :requirements do |t|
      t.references :project, index: true
      t.references :threat, index: true
      t.references :solution, index: true
      t.boolean :riskaccept

      t.timestamps
    end
  end
end

class AddImpactToRisk < ActiveRecord::Migration
  def change
    add_column :risks, :probability, :decimal
    add_column :risks, :impact, :decimal
    add_column :risks, :exposure, :decimal
  end
end

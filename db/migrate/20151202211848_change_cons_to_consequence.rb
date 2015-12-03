class ChangeConsToConsequence < ActiveRecord::Migration
  def change
    rename_column :mitigations, :cons, :consequences
  end
end

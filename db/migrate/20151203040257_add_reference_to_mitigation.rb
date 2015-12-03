class AddReferenceToMitigation < ActiveRecord::Migration
  def change
    add_column :mitigations, :reference, :string
  end
end

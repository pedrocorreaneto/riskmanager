class AddContextToThreats < ActiveRecord::Migration
  def change
    add_column :threats, :context, :text
  end
end

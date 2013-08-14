class CreateToTypes < ActiveRecord::Migration
  def change
    create_table :to_types do |t|
      t.string :Name

      t.timestamps
    end
  end
end

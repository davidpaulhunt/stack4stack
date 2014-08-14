class CreateStackItems < ActiveRecord::Migration
  def change
    create_table :stack_items do |t|
      t.references :stack
      t.references :technology

      t.timestamps
    end
  end
end

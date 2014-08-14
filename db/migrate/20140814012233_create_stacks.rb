class CreateStacks < ActiveRecord::Migration
  def change
    create_table :stacks do |t|

      t.references :stackable, polymorphic: true

      t.timestamps
    end
  end
end

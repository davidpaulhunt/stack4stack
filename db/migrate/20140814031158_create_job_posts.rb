class CreateJobPosts < ActiveRecord::Migration
  def change
    create_table :job_posts do |t|
      
      t.references :company
      t.string :position
      t.text :requirements
      t.text :description
      t.boolean :apply_internal, default: true
      t.string :web_url

      t.timestamps
    end
  end
end

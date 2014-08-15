class CreateJobApplies < ActiveRecord::Migration
  def change
    create_table :job_applies do |t|
      t.references :jobseeker
      t.references :job_post

      t.datetime :applied_at

      t.timestamps
    end
  end
end

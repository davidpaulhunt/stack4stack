class ChangeJobAppliesTableName < ActiveRecord::Migration
  def change
    rename_table :job_applies, :job_applications
  end
end

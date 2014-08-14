class AddStatusToJobPosts < ActiveRecord::Migration
  def change
    add_column :job_posts, :status, :string
  end
end

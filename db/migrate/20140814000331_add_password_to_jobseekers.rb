class AddPasswordToJobseekers < ActiveRecord::Migration
  def change

    change_table :jobseekers do |t|
      t.string :email, :password_digest
    end

    create_table :companies do |t|
      t.string :name
      t.string :email
      t.string :password_digest
    end

  end
end

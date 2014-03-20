class JoinTableForProjectsUsers < ActiveRecord::Migration
  def up
    create_table :projects_users do |t|
      t.integer :project_id
      t.integer :user_id
  end

  def down
    drop_table :projects_users
  end
end

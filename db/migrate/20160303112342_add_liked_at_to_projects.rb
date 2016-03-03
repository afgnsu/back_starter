class AddLikedAtToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :liked_at, :datetime
  end
end

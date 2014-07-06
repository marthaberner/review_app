class DeleteSubjectColumnFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :subject
  end
end

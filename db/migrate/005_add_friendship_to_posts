class AddFriendshipToPosts < ActiveRecord::Migration
  def change
    add_reference :posts, :friendship


    reversible do |dir|
      dir.up do
        execute <<-SQL  
          ALTER TABLE posts
          ADD CONSTRAINT fk_friendship_constraint
          FOREIGN KEY (friendship_id)
          REFERENCES friendships(id)
        SQL
      end
    end

  end
end

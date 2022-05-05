class CreateJoinTableDogsStrolls < ActiveRecord::Migration[5.2]
  def change
    create_join_table :dogs, :strolls do |t|
      t.index [:dog_id, :stroll_id]
      t.index [:stroll_id, :dog_id]
    end
  end
end

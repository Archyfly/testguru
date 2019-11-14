class AddBadgesReferenceToUser < ActiveRecord::Migration[5.2]
  def change
      add_reference :badges, :user, index: true
  end
end

class ChangeBioToAboutInCreators < ActiveRecord::Migration[6.0]
  def change
    rename_column :creators, :bio, :about
  end
end

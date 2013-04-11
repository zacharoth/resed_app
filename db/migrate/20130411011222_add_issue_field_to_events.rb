class AddIssueFieldToEvents < ActiveRecord::Migration
  def change
	add_column :events, :issue, :string
  end
end

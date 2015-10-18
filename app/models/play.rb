class Play < ActiveRecord::Base
  def self.columns() @columns ||= []; end

  def self.column(name, sql_type = nil, default = nil, null = true)
    columns << ActiveRecord::ConnectionAdapters::Column.new(name.to_s, default, sql_type.to_s, null)
  end

  column :players, :integer
  column :game_id, :integer

  belongs_to :game

  validates :players, :numericality => { :greater_than => 0 }

end
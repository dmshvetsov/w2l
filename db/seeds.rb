#seed tags
require 'csv'
Tag.delete_all
ActiveRecord::Base.connection.reset_pk_sequence!('tags')
CSV.foreach('db/data/tags.csv', headers: true) do |row_item|
  tag = Tag.create! row_item.to_hash
end


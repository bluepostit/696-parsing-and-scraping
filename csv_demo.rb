require 'csv'

# TODO - let's read/write data from beers.csv
filepath = 'data/beers.csv'

puts ">>>> Parsing CSV beers"

# If no header row
CSV.foreach(filepath) do |row|
  puts "#{row[0]} is from #{row[2]}"
end

# If there is a header row
csv_options = {
  headers: :first_row,
  col_sep: ',',
  quote_char: '"'
}
CSV.foreach(filepath, csv_options) do |row|
  puts "#{row['Name']} is from #{row['Origin']}"
end

puts "\n\n--------------------\n\n"

# Store CSV to a file


beers = [
  {
    name: 'Asahi',
    appearance: 'Pale Lager',
    origin: 'Japan'
  },
  {
    name: 'Guinness',
    appearance: 'Stout',
    origin: 'Ireland'
  }
]

filepath = 'data/beers2.csv'
csv_options = {
  col_sep: ',',
  force_quotes: true,
  quote_char: '"'
}
puts ">>>> Storing CSV beers"
CSV.open(filepath, 'wb', csv_options) do |csv|
  csv << ['Name', 'Appearance', 'Origin']
  # csv << ['Asahi', 'Pale Lager', 'Japan']
  # csv << ['Guinness', 'Stout', 'Ireland']

  beers.each do |beer|
    csv << [beer[:name], beer[:appearance], beer[:origin]]
  end
end

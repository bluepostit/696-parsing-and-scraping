require 'json'

# TODO - let's read/write data from beers.json
filepath = 'data/beers.json'

# Open file and read contents into a string
data = File.read(filepath)

# Convert to hash
beers = JSON.parse(data)

puts beers['title']
beers['beers'].each do |beer|
  puts "#{beer['name']} is from #{beer['origin']}"
end


# Storing JSON
data = {
  title: 'More great beers',
  beers: [
    {
      name:       'Edelweiss',
      appearance: 'White',
      origin:     'Austria'
    },
    {
      name:       'Guinness',
      appearance: 'Stout',
      origin:     'Ireland'
    }
    # etc...
  ]
}
filepath = 'data/beers2.json'
File.open(filepath, 'wb') do |file|
  json = JSON.generate(data)
  file.write(json)
end

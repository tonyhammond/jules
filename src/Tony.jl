module Tony

import CSV
export read_cities, read_properties

hello() = print("Hello World!")

cities_file = string(@__DIR__, "/../csv/cities.csv")
properties_file = string(@__DIR__, "/../csv/properties.csv")

read_cities() = CSV.read(cities_file)
read_properties() = CSV.read(properties_file)

end

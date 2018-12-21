module Tony

export read_cities, read_properties

import CSV

"Test module reachability."
hello() = print("Hello World!")

const CITIES_FILE = string(@__DIR__, "/../csv/cities.csv")
const PROPERTIES_FILE = string(@__DIR__, "/../csv/properties.csv")

"Utility call to read cities.csv data."
read_cities() = CSV.read(CITIES_FILE)

"Utility call to read properties.csv data."
read_properties() = CSV.read(PROPERTIES_FILE)

end

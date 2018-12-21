module Tony

export read_cities, read_properties, plot_test

using Plots

import CSV

"Test module reachability."
hello() = print("Hello World!")

# const CITIES_FILE = eval(@__DIR__) * "/../csv/cities.csv"
const CITIES_FILE = string(@__DIR__, "/../csv/cities.csv")
# const PROPERTIES_FILE = eval(@__DIR__) * "/../csv/properties.csv"
const PROPERTIES_FILE = string(@__DIR__, "/../csv/properties.csv")

"Utility call to read cities.csv data."
read_cities() = CSV.read(CITIES_FILE)

"Utility call to read properties.csv data."
read_properties() = CSV.read(PROPERTIES_FILE)

function plot_test()
    c = read_cities()
    x = [1:size(c)[1];]
    y = c[:population]
    plot(x,y)
end

end

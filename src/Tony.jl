module Tony

using Plots

import CSV

export read_cities, read_properties, plot_test

"Simple test for `Tony` module reachability."
hello() = print("Hello Tony!")

# const CITIES_FILE = eval(@__DIR__) * "/../csv/cities.csv"
const CITIES_FILE = string(@__DIR__, "/../csv/cities.csv")
# const PROPERTIES_FILE = eval(@__DIR__) * "/../csv/properties.csv"
const PROPERTIES_FILE = string(@__DIR__, "/../csv/properties.csv")

"Utility call to read cities.csv data."
read_cities() = CSV.read(CITIES_FILE)

"Utility call to read properties.csv data."
read_properties() = CSV.read(PROPERTIES_FILE)

"Simple test of `Plots` module."
function plot_test()
    # read first 20 cities into a dataframe
    c = read_cities()[1:20, :]
    x = [1:size(c)[1];]
    y = c[:population]
    plot(x, y,
        title = "US Cities",
        xlabel = "City (ranked by size)",
        ylabel = "Population",
        legend = false,
        markershape = :auto
        )
    savefig("images/plot_test.png")
end

end

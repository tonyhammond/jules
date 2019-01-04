module Tony

using Plots

import CSV

export cities, properties, plotcities

"Simple test for `Tony` module reachability."
hello() = print("Hello Tony!")

const CITIES_FILE = joinpath(@__DIR__, "../csv/cities.csv")
const PROPERTIES_FILE = joinpath(@__DIR__, "../csv/properties.csv")

"Utility call to read cities.csv data."
cities() = CSV.read(CITIES_FILE)

"Utility call to read properties.csv data."
properties() = CSV.read(PROPERTIES_FILE)

"Simple test of `Plots` module."
function plotcities()
    # read cities into a dataframe
    df = cities()
    c = df[1:10, :]
    d = df[2:11, :]
    p1 = plot([c[:population] d[:population]],
        title = "US Cities",
        xlabel = "City (ranked by size)",
        ylabel = "Population",
        legend = false,
        markershape = :auto
        )
    p2 = plot([d[:population] c[:population]],
        title = "US Cities",
        xlabel = "City (ranked by size)",
        ylabel = "Population",
        legend = false,
        markershape = :auto
        )
    plot(p1,p2,layout=2,legend=false)
    savefig("images/plotcities.png")
end

end

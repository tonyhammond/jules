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
    df1 = filter(row -> row[:population] > 1_000_000, df)
    df2 = filter(row -> row[:population] <= 1_000_000, df)
    # scatter plot of lat/long - for df2 cities (below 1m pop.)
    scatter(df2[:longitude], df2[:latitude],
    title = "US Cities",
    xlabel = "Longitude",
    ylabel = "Latitude",
        legend = false,
        markershape = :circle,
        markercolor = :auto
        # markersize = 4
        )
    # scatter plot of lat/long - for df1 cities (above 1m pop.)
    scatter!(df1[:longitude], df1[:latitude],
        legend = false,
        markershape = :rect,
        markercolor = :orange
        # markersize = 4
        )
    savefig("images/plotcities-latlong.png")

    # line plots with layout
    c = df[1:10, :]
    d = df[11:20, :]
    p1 = plot([c[:population]],
        title = "US Cities (1-10)",
        xlabel = "City",
        ylabel = "Population",
        xticks=(1:10, c[:name]),
        xrotation=60,
        legend = false,
        markershape = :rect,
        markercolor = :orange
        )
    p2 = plot([d[:population]],
        title = "US Cities (11-20)",
        xlabel = "City",
        ylabel = "Population",
        xticks=(1:10, d[:name]),
        xrotation=60,
        legend = false,
        markershape = :auto,
        markercolor = :auto
        )
    plot(p1,p2,layout=2,legend=false)
    savefig("images/plotcities-layout.png")
end

end

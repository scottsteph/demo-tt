using VegaLite, DataFrames, Query, VegaDatasets

cars = dataset("cars")

#cars = dataset("cars") |> DataFrame

cars |> @select(:Acceleration, :Name) |> collect
#test
#cars |> @select(:Acceleration, :Name) |> DataFrame


function foo(data, origin)
    df = data |> @filter(_.Origin==origin) |> DataFrame

    return df |> @vlplot(:point, :Acceleration, :Miles_per_Gallon)
end

p = foo(cars, "USA")

p |> save("foo.png")

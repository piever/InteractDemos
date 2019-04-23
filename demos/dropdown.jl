using DataFrames, CSV, UnicodePlots

iris = CSV.read(joinpath(@__DIR__, "..", "assets", "iris.csv"))[1:4]
disallowmissing!(iris)

function dataframedemo(df)
    x = dropdown(names(df), label = "x")
    y = dropdown(names(df), label = "y")
    btn = button("Draw")
    wdg = Widget{:dataframedemo}(
        [:btn => btn, :x => x, :y => y],
        output = Observables.@map (&btn; scatterplot(df[x[]], df[y[]], canvas = DotCanvas))
    )
    @layout! wdg hbox(Widgets.div(:x, :y, :btn), InteractBase.center(observe(_)))
    wdg
end

dropdowncode =
    """
    function dataframedemo(df)
        x = dropdown(names(df), label = "x")
        y = dropdown(names(df), label = "y")
        btn = button("Draw")
        wdg = Widget{:dataframedemo}(
            [:btn => btn, :x => x, :y => y],
            output = Observables.@map (&btn; scatterplot(df[x[]], df[y[]]))
        )
        @layout! wdg hbox(Widgets.div(:x, :y, :btn), InteractBase.center(observe(_)))
        wdg
    end
    """

dropdownfct = function (req)
    Widgets.div(
        header("Dropdown demos"),
        Widgets.div(
            Widgets.div(
                dataframedemo(iris),
                className = "section"
            ),
            Widgets.div(
                togglecontent(highlight(dropdowncode), label = "Show code"),
                className = "section has-background-light"
            ),
            className = "container"
        )
    )
end

pages["/demos/dropdown.jl"] = dropdownfct
push!(columns, column(
    "Dropdown widget",
    "Visualize data with dropdowns and buttons",
    "demos/dropdown.jl",
    docs * "widgets/#Option-input-1"
))

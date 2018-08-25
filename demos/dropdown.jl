using DataFrames, CSV, Plots

iris = CSV.read(joinpath(@__DIR__, "..", "assets", "iris.csv"))

function dataframedemo(df)
    x = dropdown(names(df), label = "x")
    y = dropdown(names(df), label = "y")
    plotfct = dropdown(OrderedDict("path" => plot, "scatter" => scatter))
    btn = button("Draw")
    wdg = Widget{:dataframedemo}(
        [:btn => btn, :x => x, :y => y, :plotfct => plotfct],
        output = Observables.@map (&btn; plotfct[](df[x[]], df[y[]]))
    )
    @layout! wdg hbox(Widgets.div(:x, :y, :plotfct, :btn), InteractBase.center(observe(_)))
    wdg
end

dropdowncode =
    """
    function dataframedemo(df)
        x = dropdown(names(df), label = "x")
        y = dropdown(names(df), label = "y")
        plotfct = dropdown(OrderedDict("path" => plot, "scatter" => scatter))
        btn = button("Draw")
        wdg = Widget{:dataframedemo}(
            [:btn => btn, :x => x, :y => y, :plotfct => plotfct],
            output = Observables.@map (&btn; plotfct[](df[x[]], df[y[]]))
        )
        @layout! wdg hbox(Widgets.div(:x, :y, :plotfct, :btn), InteractBase.center(observe(_)))
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

push!(pages, page("/demos/dropdown.jl", dropdownfct))
push!(columns, column(
    "Dropdown widget",
    "Visualize data with dropdowns and buttons",
    "demos/dropdown.jl",
    docs * "widgets.html#Option-input-1"
))

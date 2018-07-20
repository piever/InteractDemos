using DataFrames, RDatasets, Plots

iris = dataset("datasets", "iris")

@widget wdg function dataframedemo(df)
    :x = dropdown(names(df), label = "x")
    :y = dropdown(names(df), label = "y")
    :plotfct = dropdown(OrderedDict("path" => plot, "scatter" => scatter))
    :btn = button("Draw")
    @output! wdg ($(:btn); :plotfct[](df[:x[]], df[:y[]]))
    @display! wdg InteractBase.center($(_.output))
    @layout! wdg hbox(Widgets.div(:x, :y, :plotfct, :btn), _.display)
end

dropdowncode =
    """
    @widget wdg function dataframedemo(df)
        :x = dropdown(names(df), label = "x")
        :y = dropdown(names(df), label = "y")
        :plotfct = dropdown(OrderedDict("path" => plot, "scatter" => scatter))
        :btn = button("Draw")
        # only the button is wrapped in \$, so it's the only Observable that will cause the output to update
        @output! wdg (\$(:btn); :plotfct[](df[:x[]], df[:y[]]))
        @display! wdg InteractBase.center(\$(_.output))
        @layout! wdg hbox(Widgets.div(:x, :y, :plotfct, :btn), _.display)
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

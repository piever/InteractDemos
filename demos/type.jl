function typedemo()
    color = colorpicker(label="Choose a color")
    date = datepicker(label="Choose a date")
    time = timepicker(label="Choose a time")
    wdg = Widget{:typedem}(
        [:color => color, :date => date, :time => time],
        output = Observable("Many Julia types have a corresponding widget")
    )
    @layout! wdg Widgets.div(:color, :date, :time, InteractBase.center(observe(_)))
    wdg
end

typecode =
    """
    function typedemo()
        color = colorpicker(label="Choose a color")
        date = datepicker(label="Choose a date")
        time = timepicker(label="Choose a time")
        wdg = Widget{:typedem}(
            [:color => color, :date => date, :time => time],
            output = Observable("Many Julia types have a corresponding widget")
        )
        @layout! wdg Widgets.div(:color, :date, :time, InteractBase.center(observe(_)))
        wdg
    end
    """

typefct = function (req)
    Widgets.div(
        header("Type demos"),
        Widgets.div(
            Widgets.div(
                typedemo(),
                className = "section"
            ),
            Widgets.div(
                togglecontent(highlight(typecode), label = "Show code"),
                className = "section has-background-light"
            ),
            className = "container"
        )
    )
end

pages["/demos/type.jl"] = typefct
push!(columns, column(
    "Type widgets",
    "Creating widgets for Julia types",
    "demos/type.jl",
    docs * "widgets/#Type-input-1"
))

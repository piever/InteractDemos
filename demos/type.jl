@widget wdg function typedemo()
    :color = colorpicker(label="Choose a color")
    :date = datepicker(label="Choose a date")
    :time = timepicker(label="Choose a time")
    @output! wdg Observable("Many Julia types have a corresponding widget")
    @display! wdg InteractBase.center($(_.output))
end

typecode =
    """
    @widget wdg function typedemo()
        :color = colorpicker(label="Choose a color")
        :date = datepicker(label="Choose a date")
        :time = timepicker(label="Choose a time")
        @output! wdg Observable("Many Julia types have a corresponding widget")
        @display! wdg InteractBase.center(\$(_.output))
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

push!(pages, page("/demos/type.jl", typefct))

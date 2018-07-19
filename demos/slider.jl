using Plots

@widget wdg function sliderdemo()
    :size = slider(1:0.1:10, label = "markersize")
    :number = slider(10:10:100, label = "number of points")
    @output! wdg scatter(rand($(:number)), rand($(:number)), markersize = $(:size))
    @display! wdg InteractBase.center($(_.output))
    @layout! wdg Widgets.div(:size, :number, _.display)
end

code =
    """
    @widget wdg function sliderdemo()
        :size = slider(1:0.1:10, label = "markersize")
        :number = slider(10:10:100, label = "number of points")
        @output! wdg scatter(rand(\$(:number), rand(\$(:number), markersize = \$(:size))
        @display! wdg InteractBase.center(\$(_.output))
        @layout! wdg Widgets.div(:text, :textarea, :number, _.display)
    end
    """

fct = function (req)
    Widgets.div(
        header("Slider demos"),
        Widgets.div(
            Widgets.div(
                sliderdemo(),
                className = "section"
            ),
            Widgets.div(
                togglecontent(highlight(code), label = "Show code"),
                className = "section has-background-light"
            ),
            className = "container"
        )
    )
end

push!(pages, page("/demos/slider.jl", fct))

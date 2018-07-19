using Plots
gr()

@widget wdg function sliderdemo()
    :size = slider(1:0.1:10, label = "markersize")
    :sizethrottle = throttle(0.1, :size)
    :number = slider(10:10:100, label = "number of points")
    :numberthrottle = throttle(0.1, :number)
    @output! wdg scatter(rand($(:numberthrottle)), rand($(:numberthrottle)), markersize = $(:sizethrottle))
    @display! wdg InteractBase.center($(_.output))
    @layout! wdg Widgets.div(:size, :number, _.display)
end

slidercode =
    """
    @widget wdg function sliderdemo()
        :size = slider(1:0.1:10, label = "markersize")
        # throttling makes the update wait at least 0.1 seconds, useful if the observable triggers expensive events
        :sizethrottle = throttle(0.1, :size)
        :number = slider(10:10:100, label = "number of points")
        :numberthrottle = throttle(0.1, :number)
        @output! wdg scatter(rand(\$(:numberthrottle)), rand(\$(:numberthrottle)), markersize = \$(:sizethrottle))
        @display! wdg InteractBase.center(\$(_.output))
        @layout! wdg Widgets.div(:size, :number, _.display)
    end
    """

sliderfct = function (req)
    Widgets.div(
        header("Slider demos"),
        Widgets.div(
            Widgets.div(
                sliderdemo(),
                className = "section"
            ),
            Widgets.div(
                togglecontent(highlight(slidercode), label = "Show code"),
                className = "section has-background-light"
            ),
            className = "container"
        )
    )
end

push!(pages, page("/demos/slider.jl", sliderfct))

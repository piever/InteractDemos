using Plots
gr()

function sliderdemo()
    size = slider(1:0.1:10, label = "markersize")
    sizethrottle = throttle(0.01, size)
    number = slider(10:100, label = "number of points")
    numberthrottle = throttle(0.01, number)
    wdg = Widget{:sliderdemo}(
        [:size => size, :number => number];
        output = Observables.@map begin
            x = range(-pi, stop = pi, length = &number)
            scatter(x, sin.(x), markersize = &sizethrottle)
        end
    )
    @layout! wdg Widgets.div(:size, :number, InteractBase.center(observe(_)))
    wdg
end

slidercode =
    """
    function sliderdemo()
        size = slider(1:0.1:10, label = "markersize")
        sizethrottle = throttle(0.01, size)
        number = slider(10:100, label = "number of points")
        numberthrottle = throttle(0.01, number)
        wdg = Widget{:sliderdemo}(
            [:size => size, :number => number];
            output = Observables.@map scatter(rand(&numberthrottle), rand(&numberthrottle), markersize = &sizethrottle)
        )
        @layout! wdg Widgets.div(:size, :number, InteractBase.center(observe(_)))
        wdg
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
push!(columns, column(
    "Slider widget",
    "How to use a slider",
    "demos/slider.jl",
    docs * "widgets.html#Range-input-1"
))

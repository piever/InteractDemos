using UnicodePlots

function sliderdemo()
    offset = slider(-pi:0.1:pi, label = "offset")
    number = slider(10:100, label = "number of points")
    wdg = Widget{:sliderdemo}(
        [:offset => offset, :number => number];
        output = Observables.@map begin
            x = range(-pi, stop = pi, length = &throttle(0.05, number))
            plt = scatterplot(x, sin.(x), canvas = DotCanvas)
            scatterplot!(plt, x .+ &throttle(0.05, offset), sin.(x))
            plt
        end
    )
    @layout! wdg Widgets.div(:offset, :number, InteractBase.center(observe(_)))
    wdg
end

slidercode =
    """
    function sliderdemo()
        offset = slider(-pi:0.1:pi, label = "offset")
        number = slider(10:100, label = "number of points")
        wdg = Widget{:sliderdemo}(
            [:offset => offset, :number => number];
            output = Observables.@map begin
                x = range(-pi, stop = pi, length = &throttle(0.05, number))
                plt = scatterplot(x, sin.(x))
                scatterplot!(plt, x .+ &throttle(0.05, offset), sin.(x))
                plt
            end
        )
        @layout! wdg Widgets.div(:offset, :number, InteractBase.center(observe(_)))
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

pages["/demos/slider.jl"] = sliderfct
push!(columns, column(
    "Slider widget",
    "How to use a slider",
    "demos/slider.jl",
    docs * "widgets/#Range-input-1"
))

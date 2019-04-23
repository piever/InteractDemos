function textinputdemo()
    txt1 = textbox(value = "Initial text", label = "This is a simple text box")
    txt2 = textarea(placeholder = "Here you can write several lines", label = "A larger text box")
    number = spinbox(value = 0, label = "Here you can put numbers")
    wdg = Widget{:textinputdemo}(
        [:txt1 => txt1, :txt2 => txt2, :number => number],
        output = Observables.@map string("Here you wrote ", &txt1, " and ", &txt2, " and your number is ", &number)
    )
    @layout! wdg Widgets.div(:txt1, :txt2, :number, InteractBase.center(observe(_)))
    wdg
end

textcode =
    """
    function textinputdemo()
        txt1 = textbox(value = "Initial text", label = "This is a simple text box")
        txt2 = textarea(placeholder = "Here you can write several lines", label = "A larger text box")
        number = spinbox(value = 0, label = "Here you can put numbers")
        wdg = Widget{:textinputdemo}(
            [:txt1 => txt1, :txt2 => txt2, :number => number],
            output = Observables.@map string("Here you wrote ", &txt1, " and ", &txt2, " and your number is ", &number)
        )
        @layout! wdg Widgets.div(:txt1, :txt2, :number, InteractBase.center(observe(_)))
        wdg
    end
    """

textfct = function (req)
    Widgets.div(
        header("Text demos"),
        Widgets.div(
            Widgets.div(
                textinputdemo(),
                className = "section"
            ),
            Widgets.div(
                togglecontent(highlight(textcode), label = "Show code"),
                className = "section has-background-light"
            ),
            className = "container"
        )
    )
end

pages["/demos/text.jl"] = textfct
push!(columns, column(
    "Text input widgets",
    "Simple text input widgets",
    "demos/text.jl",
    docs * "widgets/#Text-input-1"
))

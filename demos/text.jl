@widget wdg function textinputdemo()
    :text = textbox(value = "Initial text", label = "This is a simple text box")
    :textarea = textarea(placeholder = "Here you can write several lines", label = "A larger text box")
    :number = spinbox(value = 0, label = "Here you can put numbers")
    @output! wdg string("Here you wrote ", $(:text), " and ", $(:textarea), " and your number is ", $(:number))
    @display! wdg InteractBase.center($(_.output))
    @layout! wdg Widgets.div(:text, :textarea, :number, _.display)
end

code = Node(
    :pre,
    Node(
        :code,
        """
        @widget wdg function textinputdemo()
            :text = textbox(value = "Initial text", label = "This is a simple text box")
            :textarea = textarea(placeholder = "Here you can write several lines", label = "A larger text box")
            :number = spinbox(value = 0, label = "Here you can put numbers")
            @output! wdg string("Here you wrote ", \$(:text), " and ", \$(:textarea), " and your number is ", \$(:number))
            @display! wdg InteractBase.center(\$(_.output))
            @layout! wdg Widgets.div(:text, :textarea, :number, _.display)
        end
        """,
        className = "language-julia"
    )
)

fct = function (req)
    Widgets.div(
        WebIO.render(
            HTML(
                """
                <section class="hero is-primary">
                  <div class="hero-body">
                    <div class="container">
                      <h1 class="title">Text input demo</h1>
                      <h2 class="subtitle">Examples of web apps built with Julia</h2>
                    </div>
                  </div>
                </section>
                """
            )
        ),
        Widgets.div(
            Widgets.div(
                textinputdemo(),
                className = "section"
            ),
            Widgets.div(
                togglecontent(code, label = "Show code"),
                className = "section has-background-light"
            ),
            className = "container"
        )
    )
end

push!(pages, page("/demos/text.jl", fct))

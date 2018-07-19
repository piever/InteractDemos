hero = header("Interact demos", "Examples of web apps built with Julia")

columns = column.(
    ["Text input widgets", "Type widgets", "Slider widget"],
    ["Simple text input widgets", "Creating widgets for Julia types", "How to use a slider"],
    "demos/" .* ["text.jl", "type.jl", "slider.jl"],
    "https://juliagizmos.github.io/Interact.jl/latest/" .*
        ["widgets.html#Text-input-1", "widgets.html#Type-input-1", "widgets.html#Range-input-1"]
)

const wrap_columns = Node(:section, className = "section")∘Node(:div, className = "container")∘Node(:div, className = "columns")

homepage = Node(:div,
    hero,
    wrap_columns(columns...)
)

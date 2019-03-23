hero = header("Interact demos", "Examples of web apps built with Julia")

function wrap_columns(args...)
    node(:section, className = "section")(
        node(:div, className = "container")(
            node(:div, args..., className = "columns is-multiline")
        )
    )
end

homepage = node(:div,
    hero,
    wrap_columns(columns...)
)

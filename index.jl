hero = header("Interact demos", "Examples of web apps built with Julia")

const wrap_columns =
    node(:section, className = "section")∘node(:div, className = "container")∘node(:div, className = "columns is-multiline")

homepage = node(:div,
    hero,
    wrap_columns(columns...)
)

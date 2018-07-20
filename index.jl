hero = header("Interact demos", "Examples of web apps built with Julia")

const wrap_columns = Node(:section, className = "section")∘Node(:div, className = "container")∘Node(:div, className = "columns")

homepage = Node(:div,
    hero,
    wrap_columns(columns...)
)

using Mux, Interact, WebIO
using Widgets, Sockets

include("utils.jl")

pages = Any[]
columns = Any[]
docs = "https://juliagizmos.github.io/Interact.jl/latest/"

include("demos/text.jl")
include("demos/type.jl")
include("demos/slider.jl")
include("demos/dropdown.jl")

include("index.jl")

append!(pages, [page("/", req -> homepage), page("/index.html", req -> homepage)])

port = 8000
# @show port = rand(8000:9000)
WebIO.webio_serve(Mux.stack(pages...), getipaddr(), port)

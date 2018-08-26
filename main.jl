using Mux, Interact
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

using Mux
using JSON
using AssetRegistry

function serve_app(pages, port)
  http = Mux.App(Mux.mux(
      Mux.defaults,
      pages...,
      Mux.notfound()
  ))

  websock = Mux.App(Mux.mux(
      Mux.wdefaults,
      route("/webio-socket", WebIO.create_socket),
      Mux.wclose,
      Mux.notfound(),
  ))

  Mux.serve(http, websock, getipaddr(), port)
end
port = 8000
# @show port = rand(8000:9000)
serve_app(pages, port)

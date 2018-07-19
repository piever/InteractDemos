using Mux, Interact

pages = Any[
  page("/", req -> Mux.fileresponse(joinpath(@__DIR__, "index.html"))),
  page("/index.html", req -> Mux.fileresponse(joinpath(@__DIR__, "index.html"))),
]

include("utils.jl")
include("demos/text.jl")
include("demos/slider.jl")

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

  Mux.serve(http, websock, port)
end

serve_app(pages, rand(8000:9000))

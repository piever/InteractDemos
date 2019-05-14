using WebIO, WebSockets, Sockets

const pages = Dict{String, Function}()
function serve_app(req)
    func = get(pages, req.target, missing)
    ismissing(func) && return missing
    return sprint() do io
        print(io, """
            <!doctype html><html><head>
            <meta charset="UTF-8"></head>
            <meta name="viewport" content="width=device-width, initial-scale=1"><body>
        """)
        show(io, WebIO.WEBIO_APPLICATION_MIME(), func(req))
        print(io, "</body></html>")
    end
end
WebIO.routing_callback[] = serve_app
show(IOBuffer(),  WebIO.WEBIO_APPLICATION_MIME(), node(:div, "start server"))

using Interact, Widgets

include("utils.jl")

const columns = Any[]
const docs = "https://juliagizmos.github.io/Interact.jl/latest/"

include("demos/text.jl")
include("demos/type.jl")
include("demos/slider.jl")
include("demos/dropdown.jl")

include("index.jl")

pages["/"] = req -> homepage
pages["/index.html"] = pages["/"]

wait()

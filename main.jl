using Interact, WebIO
using Widgets, Sockets, WebSockets

const PORT = isempty(ARGS) ? 8888 : parse(Int64, ARGS[1])

include("utils.jl")

pages = Dict{String, Function}()
columns = Any[]
docs = "https://juliagizmos.github.io/Interact.jl/latest/"

include("demos/text.jl")
include("demos/type.jl")
include("demos/slider.jl")
include("demos/dropdown.jl")

include("index.jl")

pages["/"] = req -> homepage
pages["/index.html"] = pages["/"]

function serve_app(req)
    func = get(pages, req.target, missing)
    ismissing(func) && return missing
    return sprint() do io
        print(io, """
            <!doctype html><html><head>
            <meta charset="UTF-8"></head><body>
        """)
        show(io, WebIO.WEBIO_APPLICATION_MIME(), func(req))
        print(io, "</body></html>")
    end
end
WebIO.WebIOServer(serve_app, baseurl = "0.0.0.0", http_port = PORT)
wait()

ENV["WEBIO_SERVER_HOST_URL"] = "0.0.0.0"
ENV["WEBIO_HTTP_PORT"] = isempty(ARGS) ? 8888 : parse(Int64, ARGS[1])

ENV["JULIA_WEBIO_BASEURL"] = "https://interactdemos.herokuapp.com/"
ENV["WEBIO_WEBSOCKT_URL"] = "ws://interactdemos.herokuapp.com/webio_websocket/"

include("main.jl")

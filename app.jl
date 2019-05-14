const PORT = isempty(ARGS) ? 8888 : parse(Int64, ARGS[1])
const HOST_URL = "0.0.0.0"

ENV["WEBIO_SERVER_HOST_URL"] = HOST_URL
ENV["WEBIO_HTTP_PORT"] = PORT
# ENV["JULIA_WEBIO_BASEURL"] = "https://interactdemos.herokuapp.com/"
# ENV["WEBIO_WEBSOCKT_URL"] = string(HOST_URL, ":", PORT, "/webio_websocket/")

include("main.jl")

# InteractDemos

A collection of demos using the Julia Interact package.

## Set up locally

Before I set up this on some server, you can try it locally. Clone the repository, install the relevant packages (now you need master on some of them, but this will be fixed soon):

`] add Mux WebIO#master InteractBase#master Interact Widgets UnicodePlots CSV DataFrames`

and then run:

`include("main.jl")`

from within the InteractDemos directory. You can see the site at `0.0.0.0:8000` in your browser.

## Docker image

It's actually very easy to turn an Interact app in a Docker image: see Dockerfile for details. This one is already registered as piever/interactdemos.

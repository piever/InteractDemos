header(title) =
    WebIO.render(
        HTML(
            """
            <section class="hero is-primary">
              <div class="container">
                <div class="hero-head">
                  <nav class="navbar" role="navigation" aria-label="main navigation">
                    <div class="navbar-brand">
                      <a class="navbar-item" href="../../index.html">
                        <i class="fas fa-home fa-2x"></i>
                      </a>
                    </div>
                    <div class="navbar-menu">
                      <div class="navbar-end">
                        <a class="navbar-item" href="https://github.com/JuliaGizmos/Interact.jl">
                          <i class="fab fa-github fa-2x"></i>
                        </a>
                        <a class="navbar-item" href="https://juliagizmos.github.io/Interact.jl/latest/">
                          <i class="fa fa-book fa-2x"></i>
                        </a>
                      </div>
                    </div>
                  </nav>
                </div>
                <div class="hero-body">
                  <h1 class="title">$title</h1>
                </div>
              </div>
            </section>
            """
        )
    )

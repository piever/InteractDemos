function header(title, subtitle = "")
    node = WebIO.render(
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
                  <h2 class="subtitle">$subtitle</h2>
                </div>
              </div>
            </section>
            """
        )
    )
    scp = Scope()
    scp.dom = node
    slap_design!(scp)
end

function column(title, subtitle, page, link)
    html = HTML("""
      <div class="column">
        <div class="card">
          <div class="card-content">
            <h2 class="title">$title</h2>
            <h3 class="subtitle">$subtitle</h2>
          </div>
          <footer class="card-footer">
            <div class="card-footer-item">
              <a href="$page" class="button is-success">
                <span class="icon">
                  <i class="fa fa-magic"></i>
                </span>
                <span>Demo</span>
              </a>
            </div>
            <div class="card-footer-item">
              <a href="$link" class="button is-info">
                <span class="icon">
                  <i class="fa fa-book"></i>
                </span>
                <span>Docs</span>
              </a>
            </div>
          </footer>
        </div>
      </div>
      """
    )
    WebIO.render(html)
end

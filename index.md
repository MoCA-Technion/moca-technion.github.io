---
layout: page
title: MoCA Lab
subtitle: Mobility Computation & Analytics (Technion)
hide_hero: true
---

<section class="hero is-medium is-dark moca-hero">
  <div class="hero-body">
    <div class="container">
      <div class="columns is-vcentered">
        <div class="column is-7">
          <p class="title is-1 mb-3">MoCA Lab</p>
          <p class="subtitle is-4 mb-4">Mobility Computation &amp; Analytics Lab at the Technion</p>
          <div class="buttons">
            <a class="button is-primary is-medium" href="{{ site.baseurl }}/research/">Explore research</a>
            <a class="button is-light is-medium" href="{{ site.baseurl }}/join/">Join us</a>
            <a class="button is-ghost is-medium" href="{{ site.baseurl }}/publications/">Publications</a>
          </div>
          <p class="mt-4 has-text-grey-light">
            We build scalable, theory-grounded models and computational tools for modern mobility systems
            and infrastructure analytics.
          </p>
          <div class="mt-5">
            <span class="tag is-muted mr-2">Discrete choice + ML</span>
            <span class="tag is-muted mr-2">Network &amp; equilibrium models</span>
            <span class="tag is-muted mr-2">Mobility services &amp; operations</span>
            <span class="tag is-muted">Infrastructure analytics (bridges)</span>
          </div>
        </div>

        <div class="column is-5 has-text-centered">
          <figure class="image is-3by1">
            <img src="{{ site.baseurl }}/assets/img/moca-logo.svg" alt="MoCA Lab logo" style="border-radius: 18px; border: 1px solid rgba(255,255,255,.12)">
          </figure>
        </div>
      </div>
    </div>
  </div>
</section>

<section class="section">
  <div class="container">
    <div class="columns">
      <div class="column">
        <div class="card is-soft">
          <div class="card-content">
            <p class="title is-5 mb-2">Mobility systems</p>
            <p class="content">
              Demand modeling, supply–demand interactions, and market design for platform-based mobility (e.g., MaaS, ride-sharing).
            </p>
            <a href="{{ site.baseurl }}/research/" class="has-text-weight-semibold">Read more →</a>
          </div>
        </div>
      </div>
      <div class="column">
        <div class="card is-soft">
          <div class="card-content">
            <p class="title is-5 mb-2">Bridge analytics</p>
            <p class="content">
              Data-driven and physics-aware computation methods for infrastructure condition, risk, and resilience.
            </p>
            <a href="{{ site.baseurl }}/research/#bridge-analytics" class="has-text-weight-semibold">See focus areas →</a>
          </div>
        </div>
      </div>
      <div class="column">
        <div class="card is-soft">
          <div class="card-content">
            <p class="title is-5 mb-2">Computation methods</p>
            <p class="content">
              Large-scale optimization, equilibrium computation, and model estimation that can run on real networks and real datasets.
            </p>
            <a href="{{ site.baseurl }}/research/#computation" class="has-text-weight-semibold">Methods →</a>
          </div>
        </div>
      </div>
    </div>

    <hr/>

    <div class="columns">
      <div class="column is-7 prose-ish">
        <h2 class="title is-4">Quick intro</h2>
        <p>
          Our work emphasizes scalability, flexibility, and interpretability: models should run at real-world scale,
          capture rich behavioral patterns, and remain grounded in theory for trustworthy decisions.
        </p>

        <h3 class="title is-5 mt-5">Latest publications</h3>
        {% assign pubs = site.data.publications | sort: "year" | reverse %}
        {% if pubs and pubs.size > 0 %}
          <div class="content">
            {% for p in pubs limit:5 %}
              <div class="pub-item mb-3">
                <div><strong>{{ p.title }}</strong></div>
                <div class="pub-meta">{{ p.authors }}{% if p.venue %}. <em>{{ p.venue }}</em>{% endif %}{% if p.year %} ({{ p.year }}){% endif %}</div>
                <div class="mt-2">
                  {% if p.link %}<a href="{{ p.link }}" target="_blank" rel="noopener">Link</a>{% endif %}
                  {% if p.cited_by %}<span class="ml-3">Cited by {{ p.cited_by }}</span>{% endif %}
                </div>
              </div>
            {% endfor %}
            <a href="{{ site.baseurl }}/publications/" class="has-text-weight-semibold">All publications →</a>
          </div>
        {% else %}
          <p class="has-text-grey">Publications will appear here after the SerpApi sync runs.</p>
        {% endif %}
      </div>

      <div class="column is-5">
        <div class="card is-soft">
          <div class="card-content">
            <p class="title is-5">Contact</p>
            <p class="content">
              <strong>{{ site.data.site.pi_name }}</strong><br/>
              {{ site.data.site.pi_title }}<br/>
              {{ site.data.site.institution }}<br/>
              <a href="mailto:{{ site.data.site.email }}">{{ site.data.site.email }}</a>
            </p>
            <div class="buttons">
              <a class="button is-primary is-light" href="{{ site.data.site.scholar_profile }}" target="_blank" rel="noopener">Google Scholar</a>
              <a class="button is-link is-light" href="{{ site.baseurl }}/join/">Open positions</a>
            </div>
            <p class="is-size-7 has-text-grey">
              Tip: edit any page in Markdown and push to GitHub — the site auto-deploys on every push.
            </p>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

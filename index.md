---
layout: page
title: MoCA Lab
subtitle: Mobility Computation & Analytics (Technion)
hide_hero: true
---

<section class="hero is-primary is-large moca-home-hero">
  <div class="hero-body">
    <div class="container">
      <p class="moca-kicker mb-3">Technion · Mobility Computation &amp; Analytics Lab</p>

      <div class="mb-4">
        <div class="moca-strike"><span>MoCA Lab</span></div>
      </div>

      <p class="subtitle mb-5">
        Scalable, theory-grounded models and computational tools for
        <strong style="color:#fff;">mobility systems</strong> and
        <strong style="color:#fff;">infrastructure analytics</strong>.
      </p>

      <div class="buttons">
        <a class="button is-warning is-medium" href="{{ site.baseurl }}/research/">Explore research</a>
        <a class="button is-ghost is-medium" href="{{ site.baseurl }}/publications/">Publications</a>
        <a class="button is-light is-medium" href="{{ site.baseurl }}/join/">Join</a>
      </div>

      <div class="mt-5">
        <span class="tag is-muted mr-2 mb-2">Perturbed utility &amp; choice</span>
        <span class="tag is-muted mr-2 mb-2">Trajectory-based estimation</span>
        <span class="tag is-muted mr-2 mb-2">Network &amp; equilibrium computation</span>
        <span class="tag is-muted mb-2">Bridge analytics</span>
      </div>
    </div>
  </div>
</section>

<section class="section">
  <div class="container">

    <div class="columns is-multiline">
      <div class="column is-4">
        <div class="moca-slab moca-slab--cream" style="height:100%;">
          <p class="moca-kicker mb-2" style="color: rgba(0,0,0,.65);">Mobility systems</p>
          <h2 class="title is-4 mb-2">Behavior + scale</h2>
          <div class="moca-accent mb-4"></div>
          <p class="content">
            Structural demand modeling and dynamic decision models that scale to real networks and large alternative sets.
          </p>
          <a class="has-text-weight-semibold" href="{{ site.baseurl }}/research/">Read more →</a>
        </div>
      </div>

      <div class="column is-4">
        <div class="moca-slab moca-slab--cream" style="height:100%;">
          <p class="moca-kicker mb-2" style="color: rgba(0,0,0,.65);">Bridge analytics</p>
          <h2 class="title is-4 mb-2">Data + structure</h2>
          <div class="moca-accent mb-4"></div>
          <p class="content">
            Robust, explainable computation for infrastructure condition, uncertainty, risk, and resilience.
          </p>
          <a class="has-text-weight-semibold" href="{{ site.baseurl }}/research/#bridge-analytics">Focus areas →</a>
        </div>
      </div>

      <div class="column is-4">
        <div class="moca-slab moca-slab--cream" style="height:100%;">
          <p class="moca-kicker mb-2" style="color: rgba(0,0,0,.65);">Computation</p>
          <h2 class="title is-4 mb-2">Optimization + inference</h2>
          <div class="moca-accent mb-4"></div>
          <p class="content">
            Equilibrium computation, fast estimation, and scalable algorithms for modern mobility and networks.
          </p>
          <a class="has-text-weight-semibold" href="{{ site.baseurl }}/research/#computation">Methods →</a>
        </div>
      </div>
    </div>

    <div class="moca-slab moca-slab--cream mt-6">
      <div class="columns">
        <div class="column is-8 prose-ish">
          <h2 class="title is-3 mb-2">Recent publications</h2>
          <div class="moca-accent mb-5"></div>

{% assign pubs = site.data.publications | sort: "year" | reverse %}
{% if pubs and pubs.size > 0 %}
{% for p in pubs limit:6 %}
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
{% else %}
<p class="has-text-grey">Publications will appear here after the SerpApi sync runs.</p>
{% endif %}

        </div>

        <div class="column is-4">
          <div class="moca-slab moca-slab--gold" style="height:100%;">
            <p class="moca-kicker mb-2" style="color: rgba(0,0,0,.65);">Quick links</p>
            <h3 class="title is-5 mb-3" style="color:#141414;">Explore</h3>
            <div class="content" style="color:rgba(0,0,0,.78);">
              <ul>
                <li><a href="{{ site.baseurl }}/people/" style="color:#141414; text-decoration: underline; text-underline-offset: .2em;">People</a></li>
                <li><a href="{{ site.baseurl }}/join/" style="color:#141414; text-decoration: underline; text-underline-offset: .2em;">Join MoCA</a></li>
                <li><a href="{{ site.baseurl }}/contact/" style="color:#141414; text-decoration: underline; text-underline-offset: .2em;">Contact</a></li>
              </ul>
            </div>
            <p class="is-size-7" style="color:rgba(0,0,0,.70);">
              Home page intentionally avoids contact details.
            </p>
          </div>
        </div>

      </div>
    </div>

  </div>
</section>

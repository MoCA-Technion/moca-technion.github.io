---
layout: page
title: MoCA Lab
subtitle: Mobility Computation & Analytics (Technion)
hide_hero: true
---

<section class="section moca-hero-lite">
  <div class="container">
    <p class="moca-kicker mb-3">Technion · Mobility Computation &amp; Analytics Lab</p>

    <div class="columns is-vcentered">
      <div class="column is-8">
        <h1 class="title is-1 mb-3">MoCA Lab</h1>
        <p class="subtitle is-4 mb-4">
          We build scalable, theory-grounded models and computational tools for
          <strong>mobility systems</strong> and <strong>infrastructure analytics</strong>.
        </p>

        <div class="buttons mb-4">
          <a class="button is-primary is-medium" href="{{ site.baseurl }}/research/">Explore research</a>
          <a class="button is-ghost is-medium" href="{{ site.baseurl }}/publications/">Publications</a>
          <a class="button is-light is-medium" href="{{ site.baseurl }}/join/">Join</a>
        </div>

        <div class="mt-4">
          <span class="tag is-muted mr-2 mb-2">Perturbed utility &amp; choice</span>
          <span class="tag is-muted mr-2 mb-2">Trajectory-based estimation</span>
          <span class="tag is-muted mr-2 mb-2">Network &amp; equilibrium computation</span>
          <span class="tag is-muted mb-2">Bridge analytics</span>
        </div>
      </div>

      <div class="column is-4">
        <div class="card is-minimal">
          <div class="card-content">
            <p class="title is-6 mb-2">Focus</p>
            <p class="content mb-3">
              Clean, low-maintenance lab site: markdown-first, LaTeX-friendly, and auto-synced publications.
            </p>
            <p class="is-size-7 has-text-grey">
              Edit any page and push to GitHub → auto-deploy.
            </p>
          </div>
        </div>
      </div>
    </div>

    <hr style="background: rgba(0,0,0,.08)"/>

    <div class="columns is-multiline">
      <div class="column is-4">
        <div class="card is-minimal">
          <div class="card-content">
            <p class="moca-kicker mb-2">Mobility systems</p>
            <p class="title is-5 mb-2">Behavior + scale</p>
            <p class="content">
              Structural demand modeling and dynamic decision models that scale to real networks and large alternative sets.
            </p>
            <a href="{{ site.baseurl }}/research/" class="has-text-weight-semibold">Read more →</a>
          </div>
        </div>
      </div>

      <div class="column is-4">
        <div class="card is-minimal">
          <div class="card-content">
            <p class="moca-kicker mb-2">Bridge analytics</p>
            <p class="title is-5 mb-2">Data + structure</p>
            <p class="content">
              Robust, explainable computation for infrastructure condition, uncertainty, risk, and resilience.
            </p>
            <a href="{{ site.baseurl }}/research/#bridge-analytics" class="has-text-weight-semibold">Focus areas →</a>
          </div>
        </div>
      </div>

      <div class="column is-4">
        <div class="card is-minimal">
          <div class="card-content">
            <p class="moca-kicker mb-2">Computation</p>
            <p class="title is-5 mb-2">Optimization + inference</p>
            <p class="content">
              Equilibrium computation, fast estimation, and scalable algorithms for modern mobility and networks.
            </p>
            <a href="{{ site.baseurl }}/research/#computation" class="has-text-weight-semibold">Methods →</a>
          </div>
        </div>
      </div>
    </div>

    <div class="columns mt-5">
      <div class="column is-8 prose-ish">
        <h2 class="title is-4">Recent publications</h2>

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
        <div class="card is-minimal">
          <div class="card-content">
            <p class="title is-6 mb-2">Quick links</p>
            <div class="content">
              <ul>
                <li><a href="{{ site.baseurl }}/people/">People</a></li>
                <li><a href="{{ site.baseurl }}/join/">Join MoCA</a></li>
                <li><a href="{{ site.baseurl }}/contact/">Contact</a></li>
              </ul>
            </div>
            <p class="is-size-7 has-text-grey">Home page intentionally avoids contact details.</p>
          </div>
        </div>
      </div>
    </div>

  </div>
</section>

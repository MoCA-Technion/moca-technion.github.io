---
layout: page
title: Publications
permalink: /publications/
---

{% assign meta = site.data.publications_meta %}
{% if meta and meta.updated_at_utc %}
<p class="is-size-7 has-text-grey">Last updated (UTC): {{ meta.updated_at_utc }}</p>
{% endif %}

<div id="pub-top"></div>

{% assign pubs = site.data.publications | sort: "year" | reverse %}
{% if pubs == nil or pubs.size == 0 %}
<p>Publications have not been synced yet. Configure <code>SERPAPI_API_KEY</code> in your repo secrets and run the workflow "Update publications".</p>
{% else %}
{% assign grouped = pubs | group_by: "year" | sort: "name" | reverse %}

<!-- Year Navigation -->
<div class="pub-year-nav mb-5">
  <span class="has-text-grey">Jump to year: </span>
  {% for g in grouped %}
  <a href="#year-{{ g.name }}" class="pub-year-link">[{{ g.name }}]</a>
  {% endfor %}
</div>

{% for g in grouped %}
<h2 class="title is-4 mt-5" id="year-{{ g.name }}">{{ g.name }}</h2>
<hr class="pub-year-divider">
{% assign items = g.items %}
{% for p in items %}
<div class="pub-item mb-3{% if p.link %} pub-item-clickable{% endif %}">
  <div class="pub-bullet">•</div>
  <div class="pub-content">
    {% if p.link %}
    <a href="{{ p.link }}" target="_blank" rel="noopener" class="pub-item-link">
      <div><strong>{{ p.title }}</strong></div>
      <div class="pub-meta">
        {{ p.authors }}{% if p.venue %}. <em>{{ p.venue }}</em>{% endif %}{% if p.year %} ({{ p.year }}){% endif %}
      </div>
    </a>
    {% else %}
    <div><strong>{{ p.title }}</strong></div>
    <div class="pub-meta">
      {{ p.authors }}{% if p.venue %}. <em>{{ p.venue }}</em>{% endif %}{% if p.year %} ({{ p.year }}){% endif %}
    </div>
    {% endif %}
  </div>
</div>
{% endfor %}
<div class="pub-back-to-top mt-4 mb-5">
  <a href="#pub-top" class="has-text-link pub-back-to-top-link">Back to Top ↑</a>
</div>
{% endfor %}
{% endif %}

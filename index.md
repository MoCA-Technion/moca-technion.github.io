---
layout: page
title: MoCA Lab
permalink: /
hide_hero: true
---

<section class="hero moca-home-hero">
  <div class="hero-body">
    <div class="container">
      <p class="moca-kicker" style="color: #D59F0F; font-weight: 600; text-transform: uppercase; letter-spacing: 1px; margin-bottom: 0.5rem;">
        Technion - Israel Institute of Technology<br class="mobile-break"> Mobility Computation &amp; Analytics Lab
      </p>

      <h1 class="moca-hero-title">MoCA Lab</h1>

      <p class="moca-hero-subtitle">
        Scalable, theory-grounded models and computational tools<br>for
        <strong>next-generation mobility systems</strong>.
      </p>
      
      <div class="mt-5">
        <a href="{{ site.baseurl }}/join/" class="button is-medium moca-hero-button">
          We are hiring
        </a>
      </div>
    </div>
  </div>
</section>


<section class="section">
  <div class="container">

    <div class="mb-6">
      <h2 class="title is-3 mb-2">Research areas</h2>
      <div class="moca-accent mb-5"></div>
    </div>

    <div class="columns is-multiline">
      <div class="column is-4">
        <a href="{{ site.baseurl }}/research/#41-behavioral-foundations" class="moca-slab moca-slab--cream moca-slab-link" style="height:100%; display: block; text-decoration: none; color: inherit;">
          <p class="moca-kicker moca-kicker--dark mb-2">Behavioral foundations</p>
          <h2 class="title is-4 mb-2">Choice modeling</h2>
          <div class="moca-accent mb-4"></div>
          <p class="content">
            We study how travelers and platforms make decisions, modeling preferences, constraints, and rich patterns of substitution and heterogeneity in a way that is flexible, scalable, and consistent with real-world behavior.
          </p>
          <span class="has-text-weight-semibold">Read more →</span>
        </a>
      </div>

      <div class="column is-4">
        <a href="{{ site.baseurl }}/research/#42-dynamic-decisions-and-adaptation" class="moca-slab moca-slab--cream moca-slab-link" style="height:100%; display: block; text-decoration: none; color: inherit;">
          <p class="moca-kicker moca-kicker--dark mb-2">Dynamic systems</p>
          <h2 class="title is-4 mb-2">Equilibrium & Learning</h2>
          <div class="moca-accent mb-4"></div>
          <p class="content">
            We study sequential decision-making, repeated interactions, and adaptive behaviors to understand how behavior evolves over time, and how system-level behaviors emerge when many agents interact.
          </p>
          <span class="has-text-weight-semibold">Read more →</span>
        </a>
      </div>

      <div class="column is-4">
        <a href="{{ site.baseurl }}/research/#43-information-and-guidance" class="moca-slab moca-slab--cream moca-slab-link" style="height:100%; display: block; text-decoration: none; color: inherit;">
          <p class="moca-kicker moca-kicker--dark mb-2">Information & AI</p>
          <h2 class="title is-4 mb-2">Platform-mediated mobility</h2>
          <div class="moca-accent mb-4"></div>
          <p class="content">
            We study how digital platforms, information, guidance, and AI assistants influence mobility choices and system outcomes, and how human and algorithmic decision-makers coexist in mobility networks.
          </p>
          <span class="has-text-weight-semibold">Read more →</span>
        </a>
      </div>
    </div>

    <div class="mt-6">
      <h2 class="title is-3 mb-2">News</h2>
      <div class="moca-accent mb-5"></div>

{% assign news = site.news | sort: "date" | reverse %}
{% if news == nil or news.size == 0 %}
<p class="has-text-grey">No news items yet. <a href="{{ site.baseurl }}/news/add-news/">Add news</a> using the markdown editor.</p>
{% else %}
<div class="news-list">
  {% for item in news limit:5 %}
  {% comment %} Check if news has content beyond front matter {% endcomment %}
  {% assign has_content = false %}
  {% if item.content and item.content != "" and item.content != blank %}
    {% assign content_stripped = item.content | strip %}
    {% if content_stripped != "" %}
      {% assign has_content = true %}
    {% endif %}
  {% endif %}
  
  {% assign has_link = false %}
  {% if item.slug and has_content %}{% assign has_link = true %}{% endif %}
  {% if item.link %}{% assign has_link = true %}{% endif %}
  <div class="news-item{% if has_link %} news-item-clickable{% endif %}">
    {% if item.slug and has_content %}
    <a href="{{ site.baseurl }}/news/{{ item.slug }}/" class="news-item-link">
    {% elsif item.link %}
    <a href="{{ item.link }}" class="news-item-link" target="_blank" rel="noopener">
    {% endif %}
    <div class="news-content">
      <div class="news-date">
        {% if item.date_original %}
          {% assign date_to_check = item.date_original %}
          {% assign parts = date_to_check | split: "-" %}
          {% if parts.size == 2 %}
            {% assign months = "January,February,March,April,May,June,July,August,September,October,November,December" | split: "," %}
            {% assign month_num = parts[1] | plus: 0 %}
            {% assign month_index = month_num | minus: 1 %}
            {{ months[month_index] }} {{ parts[0] }}
          {% else %}
            {{ item.date | date: "%B %d, %Y" }}
          {% endif %}
        {% else %}
          {{ item.date | date: "%B %d, %Y" }}
        {% endif %}
      </div>
      <div class="news-title">{{ item.title }}</div>
      <div class="news-text">{{ item.summary | markdownify }}</div>
      {% if item.slug and has_content %}
      <div class="news-link">Read full story →</div>
      {% elsif item.link %}
      <div class="news-link">Read more →</div>
      {% endif %}
    </div>
    {% if has_link %}
    </a>
    {% endif %}
  </div>
  {% endfor %}
</div>
<p class="mt-4">
  <a href="{{ site.baseurl }}/news/" class="has-text-weight-semibold">All news →</a>
</p>
{% endif %}
    </div>

  </div>
</section>

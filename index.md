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
        Technion - Israel Institute of Technology
      </p>

      <h1 class="moca-hero-title">MoCA Lab</h1>
      
      <p class="moca-hero-tagline">Mobility Computation &amp; Analytics Laboratory</p>

      <p class="moca-hero-subtitle">
        We study how <strong>people, platforms, and policies</strong> interact in mobility systems,<br>
        building models and tools for <strong>efficient, fair, and human-centered</strong> transportation.
      </p>
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
          <p class="moca-kicker moca-kicker--dark mb-2">Mobility systems</p>
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

    {% assign all_projects = site.projects | sort: "date" | reverse %}
    {% if all_projects.size > 0 %}
    <div class="mt-6 mb-5">
      <h2 class="title is-3 mb-2">Our Projects</h2>
      <div class="moca-accent mb-4"></div>
      
      <div class="projects-slider-section">
        <div class="projects-slider-container">
          <div class="projects-slider">
            {% for project in all_projects %}
              {% comment %} Check if project has content beyond front matter {% endcomment %}
              {% assign has_content = false %}
              {% if project.content and project.content != "" and project.content != blank %}
                {% assign content_stripped = project.content | strip %}
                {% if content_stripped != "" %}
                  {% assign has_content = true %}
                {% endif %}
              {% endif %}
              
              {% assign has_link = false %}
              {% if project.slug and has_content %}{% assign has_link = true %}{% endif %}
              {% if project.link %}{% assign has_link = true %}{% endif %}
              
              <div class="project-slider-card">
                {% if project.slug and has_content %}
                <a href="{{ site.baseurl }}/projects/{{ project.slug }}/" class="project-slider-card-link">
                {% elsif project.link %}
                <a href="{{ project.link }}" class="project-slider-card-link" target="_blank" rel="noopener">
                {% else %}
                <div class="project-slider-card-content">
                {% endif %}
                  <div class="project-slider-card-inner {% if project.status == 'Open' %}project-slider-open{% endif %}">
                    {% if project.status %}
                      <span class="project-status project-status-{{ project.status | downcase }}">{{ project.status }}</span>
                    {% endif %}
                    {% if project.status == "Open" and project.target_students %}
                      <div class="project-slider-seeking">
                        <strong>Seeking:</strong> {{ project.target_students }}
                      </div>
                    {% endif %}
                    <h3 class="project-slider-title">{{ project.title }}</h3>
                    {% if project.summary %}
                    <p class="project-slider-summary">{{ project.summary }}</p>
                    {% endif %}
                    {% if has_link %}
                    <span class="project-slider-link">{% if project.slug and has_content %}Read more →{% else %}View project →{% endif %}</span>
                    {% endif %}
                  </div>
                {% if project.slug and has_content or project.link %}
                </a>
                {% else %}
                </div>
                {% endif %}
              </div>
            {% endfor %}
          </div>
        </div>
        <div class="projects-slider-nav">
          <button class="slider-nav-button slider-nav-prev" onclick="scrollProjectsSlider(-1)" aria-label="Previous projects">
            ‹
          </button>
          <button class="slider-nav-button slider-nav-next" onclick="scrollProjectsSlider(1)" aria-label="Next projects">
            ›
          </button>
        </div>
      </div>
      
      <p class="mt-3">
        <a href="{{ site.baseurl }}/projects/" class="has-text-weight-semibold">All projects →</a>
      </p>
    </div>
    {% endif %}

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

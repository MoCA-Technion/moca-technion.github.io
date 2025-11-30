---
layout: page
title: Projects
permalink: /projects/
---

<div id="projects-top"></div>

{% assign all_projects = site.projects | sort: "date" | reverse %}
{% if all_projects == nil or all_projects.size == 0 %}
<p class="has-text-grey">No projects added yet. <a href="{{ site.baseurl }}/projects/add-project/">Add a project</a> using the form.</p>
{% else %}

<div class="columns is-multiline">
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
    
    <div class="column is-4-tablet is-6-desktop">
      {% assign status_class = "" %}
      {% if project.status == "Open" %}{% assign status_class = "project-card-open" %}{% endif %}
      {% if project.status == "Concluded" %}{% assign status_class = "project-card-concluded" %}{% endif %}
      
      {% if project.slug and has_content %}
      <a href="{{ site.baseurl }}/projects/{{ project.slug }}/" class="project-card project-card-link {{ status_class }}">
      {% elsif project.link %}
      <a href="{{ project.link }}" class="project-card project-card-link {{ status_class }}" target="_blank" rel="noopener">
      {% else %}
      <div class="project-card {{ status_class }}">
      {% endif %}
        <div class="project-card-content">
          {% if project.status %}
            <span class="project-status project-status-{{ project.status | downcase }}">{{ project.status }}</span>
          {% endif %}
          {% if project.status == "Open" and project.target_students %}
            <div class="project-seeking">
              <strong>Seeking:</strong> {{ project.target_students }}
            </div>
          {% endif %}
          <h3 class="project-title">{{ project.title }}</h3>
          {% if project.summary %}
          <p class="project-summary">{{ project.summary }}</p>
          {% endif %}
          {% if project.date %}
          <div class="project-date">
            {% include format-news-date.html date=project.date %}
          </div>
          {% endif %}
          {% if has_link %}
          <span class="project-link">{% if project.slug and has_content %}Read more →{% else %}View project →{% endif %}</span>
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

{% endif %}


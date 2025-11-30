---
layout: page
title: Open Positions
permalink: /join/
---

<div class="content" style="max-width: 900px; margin: 0 auto;" markdown="1">

MoCA Lab welcomes motivated students and researchers who are passionate about advancing mobility systems through rigorous computational methods and data-driven insights.

We have **full funding available** for PhD students, MSc students, and postdoctoral researchers working in our research areas. You can either **join one of our open projects** or **develop your own research direction** that aligns with our work.

## Open Projects

{% assign open_projects = site.projects | where: "status", "Open" | sort: "date" | reverse %}
{% if open_projects.size > 0 %}
<p>We currently have open projects actively seeking team members:</p>

<div class="projects-slider-section" style="margin: 2rem 0;">
  <div class="projects-slider-container">
    <div class="projects-slider">
      {% for project in open_projects %}
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
                {% if project.target_students %}
                  {% assign status_text = project.status %}
                  {% assign students_short = project.target_students | replace: "Graduate students (PhD/MSc)", "PhD/MSc" | replace: "Research assistants / Master students", "MSc/RA" | replace: "PhD students", "PhD" | replace: "MSc students", "MSc" | replace: "Postdoctoral researchers", "Postdoc" | replace: "Graduate students or postdocs", "PhD/MSc/Postdoc" %}
                  <span class="project-status project-status-{{ project.status | downcase }}">{{ status_text }}, {{ students_short }}</span>
                {% else %}
                  <span class="project-status project-status-{{ project.status | downcase }}">{{ project.status }}</span>
                {% endif %}
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
  <a href="{{ site.baseurl }}/projects/" class="has-text-weight-semibold">View all projects →</a>
</p>
{% else %}
<p class="has-text-grey">No open projects at the moment, but we still welcome students interested in our research directions.</p>
{% endif %}

## Positions Available

<div class="box mb-5" style="border-left: 4px solid #002147; background-color: #fafafa;" markdown="1">
  <h3 class="title is-4 mb-4">PhD Students</h3>
  
  Work on problems spanning theory, methodology, and real-world application. Develop new models and algorithms, apply them to mobility challenges, and use data to estimate models and evaluate policies.

  **Requirements:**
  - Strong quantitative background (optimization, economics, control, statistics, machine learning)
  - Interest in both theoretical foundations and real-world applicability
  - Good programming skills
  - Strong written and verbal communication skills
</div>

<div class="box mb-5" style="border-left: 4px solid #002147; background-color: #fafafa;" markdown="1">
  <h3 class="title is-4 mb-4">MSc Students</h3>
  
  Work on focused research problems that connect theory to practice. Help model real-world mobility challenges, analyze data, or evaluate policies and platform designs.

  **Requirements:**
  - Good quantitative background
  - Programming experience
  - Commitment to high-quality research
</div>

<div class="box mb-5" style="border-left: 4px solid #002147; background-color: #fafafa;" markdown="1">
  <h3 class="title is-4 mb-4">Postdoctoral Researchers</h3>
  
  Work across the full research pipeline—from developing theoretical foundations and methodologies, to modeling real systems, to applying data-driven insights to improve policies and platform designs.

  **Requirements:**
  - PhD in a relevant field (transportation engineering, operations research, computer science, or related)
  - Strong publication record
  - Experience with computational methods and/or large-scale data analysis
</div>

<div class="box mb-5" style="border-left: 4px solid #002147; background-color: #fafafa;" markdown="1">
  <h3 class="title is-4 mb-4">Semester Projects & Visiting Students</h3>
  
  We welcome undergraduate and graduate students for semester projects, as well as visiting students and researchers from other institutions. Please contact us to discuss opportunities.
</div>

## Research Areas

We work in five main research directions:

- **Behavioral foundations** — Modeling how travelers and platforms make decisions
- **Dynamic decisions and adaptation** — Studying sequential decision-making and adaptive behaviors
- **Information and guidance** — Understanding how guidance affects network conditions
- **Equilibrium, stability, and system design** — Analyzing system-level behaviors and design
- **Human–AI mobility ecosystems** — Exploring how digital tools and AI influence mobility

Our work integrates choice modeling, network modeling, optimization, machine learning, and policy analysis.

## How to Apply

Please contact us to discuss your research interests and potential fit with the lab.

<div class="mb-4">
  {% include email-button.html email=site.data.site.email %}
</div>

**Include in your email:**
1. Brief introduction and research interests
2. Your CV
3. What you want to work on — mention specific open projects if interested, or describe your own research direction

**For external PhD applicants:** Please also include transcripts (unofficial is fine).

<p class="has-text-grey mt-4" style="font-size: 0.9rem;">
  <em>Note: After we confirm mutual interest, students must also complete the official application process through the Technion Graduate School. Both steps are required.</em>
</p>

</div>

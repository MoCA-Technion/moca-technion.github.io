---
layout: page
title: Our Team
permalink: /people/
---

## Principal Investigator

<div class="columns is-multiline mb-6">
  <div class="column is-12-mobile is-6-tablet is-4-desktop">
    <div class="card person-card">
      <div class="person-card-body">
        <div class="columns is-gapless mb-0 person-card-layout">
          <div class="column is-narrow person-card-photo-column">
            {% if site.data.site.pi_photo %}
            <a href="{{ site.baseurl }}/people/rui-yao/" class="person-card-photo-link">
            {% endif %}
            {% if site.data.site.pi_photo %}
            <figure class="image person-card-photo">
              <img src="{{ site.data.site.pi_photo }}" 
                   alt="{{ site.data.site.pi_name }} - {{ site.data.site.pi_title }} at {{ site.data.site.institution }}"
                   loading="lazy"
                   decoding="async"
                   width="200"
                   height="320">
            </figure>
            {% else %}
            <figure class="image person-card-photo" style="background: #f0f0f0;">
              <div style="display: flex; align-items: center; justify-content: center; height: 100%; color: #999; font-size: 0.8rem;">No photo</div>
            </figure>
            {% endif %}
            {% if site.data.site.pi_photo %}
            </a>
            {% endif %}
          </div>
          <div class="column person-card-info-column">
            <div class="person-card-info">
            <a href="{{ site.baseurl }}/people/rui-yao/" class="person-card-content-link">
            <h3 class="title person-card-name">{{ site.data.site.pi_name }}</h3>
            <p class="subtitle person-card-role">{{ site.data.site.pi_title }}</p>
            {% if site.data.site.pi_affiliation %}<p class="person-card-affiliation">{{ site.data.site.pi_affiliation }}</p>{% endif %}
            {% if site.data.site.institution %}<p class="person-card-institution">{{ site.data.site.institution }}</p>{% endif %}
            {% if site.data.site.office %}<p class="person-card-office">Office: {{ site.data.site.office }}</p>{% endif %}
            </a>
            {% if site.data.site.email %}
            <div class="person-card-email-button">
              {% include email-obfuscate.html email=site.data.site.email %}
            </div>
            {% endif %}
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

## Research Team

{% assign ppl = site.people | where_exp: "person", "person.slug != 'rui-yao'" %}
{% if ppl == nil or ppl.size == 0 %}
<div class="notification is-info" style="background: linear-gradient(135deg, #002147 0%, #003d7a 100%); border: none; border-radius: 8px; padding: 2rem; margin: 2rem 0;">
  <p style="font-size: 1.3rem; font-weight: 600; color: #ffffff; margin-bottom: 1rem;">You can be the next!</p>
  <p style="color: #ffffff; opacity: 0.95; margin-bottom: 1rem;">Join our research team and contribute to cutting-edge research in mobility systems and infrastructure analytics.</p>
  <a href="{{ site.baseurl }}/join/" class="button is-light" style="background: #ffffff; color: #002147; font-weight: 600; border: none;">
    View Open Positions
  </a>
</div>
{% else %}
<div class="columns is-multiline">
  {% for person in ppl %}
  <div class="column is-12-mobile is-6-tablet is-4-desktop">
    <div class="card person-card">
      <div class="person-card-body">
        <div class="columns is-gapless mb-0 person-card-layout">
          <div class="column is-narrow person-card-photo-column">
            {% if person.slug %}
            <a href="{{ site.baseurl }}/people/{{ person.slug }}/" class="person-card-photo-link">
            {% endif %}
            {% if person.photo %}
            <figure class="image person-card-photo">
              <img src="{{ person.photo }}" 
                   alt="{{ person.name }} - {{ person.role }} at {{ person.institution | default: site.data.site.institution }}"
                   loading="lazy"
                   decoding="async"
                   width="200"
                   height="320">
            </figure>
            {% else %}
            <figure class="image person-card-photo" style="background: #f0f0f0;">
              <div style="display: flex; align-items: center; justify-content: center; height: 100%; color: #999; font-size: 0.8rem;">No photo</div>
            </figure>
            {% endif %}
            {% if person.slug %}
            </a>
            {% endif %}
          </div>
          <div class="column person-card-info-column">
            <div class="person-card-info">
            {% if person.slug %}
            <a href="{{ site.baseurl }}/people/{{ person.slug }}/" class="person-card-content-link">
            {% endif %}
            <h3 class="title person-card-name">{{ person.name }}</h3>
            <p class="subtitle person-card-role">{{ person.role }}</p>
            {% if person.affiliation %}<p class="person-card-affiliation">{{ person.affiliation }}</p>{% endif %}
            {% if person.institution %}<p class="person-card-institution">{{ person.institution }}</p>{% endif %}
            {% if person.office %}<p class="person-card-office">Office: {{ person.office }}</p>{% endif %}
            {% if person.slug %}
            </a>
            {% endif %}
            {% if person.email %}
            <div class="person-card-email-button">
              {% include email-obfuscate.html email=person.email %}
            </div>
            {% endif %}
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  {% endfor %}
</div>
{% endif %}

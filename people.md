---
layout: page
title: People
subtitle: Team, collaborators, and students
permalink: /people/
---

## PI

<div class="card is-soft mb-5">
  <div class="card-content">
    <p class="title is-5 mb-2">{{ site.data.site.pi_name }}</p>
    <p class="subtitle is-6 mb-3">{{ site.data.site.pi_title }} · {{ site.data.site.institution }}</p>
    <p class="content">
      <a href="mailto:{{ site.data.site.email }}">{{ site.data.site.email }}</a> ·
      <a href="{{ site.data.site.scholar_profile }}" target="_blank" rel="noopener">Google Scholar</a>
    </p>
  </div>
</div>

## Lab members

{% assign ppl = site.data.people %}
{% if ppl == nil or ppl.size == 0 %}
<p class="has-text-grey">No members added yet. Edit <code>_data/people.yml</code> to add people.</p>
{% else %}
  <div class="columns is-multiline">
    {% for person in ppl %}
      <div class="column is-4">
        <div class="card is-soft">
          {% if person.photo %}
            <div class="card-image">
              <figure class="image is-square">
                <img src="{{ site.baseurl }}{{ person.photo }}" alt="{{ person.name }}">
              </figure>
            </div>
          {% endif %}
          <div class="card-content">
            <p class="title is-6 mb-1">{{ person.name }}</p>
            <p class="subtitle is-7 has-text-grey mb-3">{{ person.role }}</p>
            {% if person.interests %}<p class="content is-size-7">{{ person.interests }}</p>{% endif %}
            <p class="is-size-7">
              {% if person.email %}<a href="mailto:{{ person.email }}">Email</a>{% endif %}
              {% if person.website %}<a class="ml-3" href="{{ person.website }}" target="_blank" rel="noopener">Website</a>{% endif %}
            </p>
          </div>
        </div>
      </div>
    {% endfor %}
  </div>
{% endif %}

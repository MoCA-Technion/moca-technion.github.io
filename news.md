---
layout: page
title: News
permalink: /news/
---

<div id="news-top"></div>

{% assign all_news = site.news | sort: "date" | reverse %}
{% if all_news == nil or all_news.size == 0 %}
<p class="has-text-grey">No news items yet. <a href="{{ site.baseurl }}/news/add-news/">Add news</a> using the markdown editor.</p>
{% else %}
{% assign current_year = "" %}
{% for item in all_news %}
  {% assign date_str = item.date | to_string %}
  {% assign date_parts = date_str | split: "-" %}
  {% assign item_year = date_parts[0] %}
  {% if current_year != item_year %}
    {% if current_year != "" %}
<div class="pub-back-to-top mt-4 mb-5">
  <a href="#news-top" class="has-text-link pub-back-to-top-link">Back to Top ↑</a>
</div>
    {% endif %}
<h2 class="title is-4 mt-5" id="year-{{ item_year }}">{{ item_year }}</h2>
<hr class="pub-year-divider">
    {% assign current_year = item_year %}
  {% endif %}
  
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

<div class="pub-back-to-top mt-4 mb-5">
  <a href="#news-top" class="has-text-link pub-back-to-top-link">Back to Top ↑</a>
</div>
{% endif %}


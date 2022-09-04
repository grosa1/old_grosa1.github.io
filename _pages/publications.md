---
layout: page
permalink: /publications/
title: publications
description: <nobr><em>*</em></nobr> denotes equal contribution and joint lead authorship.
years: [2022, 2021, 2020, 2019]
nav: true
nav_order: 1
---
<!-- _pages/publications.md -->
<div class="publications">

{%- for y in page.years %}
  <h2 class="year">{{y}}</h2>
  {% bibliography -f papers -q @*[year={{y}}]* %}
{% endfor %}

</div>

<div class="paper-disclaimer">
		<p>* These documents are made available as a means to ensure timely dissemination of scholarly and technical work on a non-commercial basis. Copyright and all rights therein are maintained by the authors or by other copyright holders, notwithstanding that they have offered their works here electronically. It is understood that all persons copying this information will adhere to the terms and constraints invoked by each copyright holder. These works may not be reposted without the explicit permission of the copyright holder.</p>
</div>


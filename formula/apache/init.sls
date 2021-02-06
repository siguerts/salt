{% if grains['os_family'] in ['Debian', 'RedHat'] %}
apache:
  pkg:
    - installed
    - name: {{ pillar['pkgs']['apache'] }}

{% endif %}

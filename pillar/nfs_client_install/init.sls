pkgs:
  {% if grains['os_family'] == 'RedHat' %}
  nfs_client_install: nfs-utils
  {% elif grains['os_family'] == 'Debian' %}
  nfs_client_install: nfs-common
  {% endif %}

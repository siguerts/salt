{% if grains['os_family'] in ['Debian', 'RedHat'] %}
nfs_client_install:
  pkg:
    - installed
    - name: {{ pillar['pkgs']['nfs_client_install'] }}

  service:
    - name: {{ pillar['pkgs']['nfs_client_install'] }}
    - running
    - enable: True
    - reload: True

{% endif %}

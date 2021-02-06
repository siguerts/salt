ad_bind_packages_debian:
{% if grains['os_family'] in ['Debian] %}
  pkg:
    - installed
    - pkgs:
      - realmd
      - sssd
      - sssd-tools
      - samba-common
      - krb5-user
      - packagekit
      - samba-common-bin
      - samba-libs
      - adcli
      - ntp
{% endif %}

/etc/hosts:
  file:
    - append
    - text:
      - "192.168.0.188 dc1.siguerts.com dc1"

/etc/sssd/sssd.conf:
  file:
    - managed
    - source: salt://ad_bind/files/etc/sssd/sssd.conf
    - user: root
    - group: root
    - mode: 644

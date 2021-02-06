{% if grains['os_family'] in ['RedHat'] %}
ad_bind_packages_redhat:
  pkg:
    - installed
    - pkgs:
      - realmd
      - oddjob
      - oddjob-mkhomedir
      - adcli
      - samba-common
      - samba-common-tools
      - krb5-workstation
      - openldap-clients

{% elif grains['os_family'] in ['Debian'] %}
ad_bind_packages_debian:
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
    - mode: 600

/etc/krb5.keytab:
  file: 
    - managed
    - source: salt://ad_bind/files/etc/krb5.keytab

/etc/krb5.conf:
  file:
    - managed
    - source: salt://ad_bind/files/etc/krb5.conf

Join domain:
  cmd:
    - script
    - name: join AD realm script
    - source: salt://ad_bind/files/scripts/realm_join.sh

sssd:
  service:
    - running
    - enable: True
    - reload: True

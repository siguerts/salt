{% if grains['os_family'] in ['Debian', 'RedHat'] %}

user_data_mount:
  mount:
    - mounted
    - name: /user_data
    - device: 192.168.0.132:/volume1/super_data
    - opts: bg,hard,intr,nfsvers=3,nolock,rsize=131072,rw,tcp,wsize=131072
    - mkmnt: True
    - fstype: nfs

linux_links_mount:
  mount:
    - mounted
    - name: /linux_links
    - device: 192.168.0.132:/volume1/LINUX_LINKS
    - opts: bg,hard,intr,nfsvers=3,nolock,rsize=131072,rw,tcp,wsize=131072
    - mkmnt: True
    - fstype: nfs

dfs_links_mount:
  mount:
    - mounted
    - name: /dfs_links
    - device: 192.168.0.132:/volume1/DFS_LINKS
    - opts: bg,hard,intr,nfsvers=3,nolock,rsize=131072,rw,tcp,wsize=131072
    - mkmnt: True
    - fstype: nfs

{% endif %}

{% if grains['os_family'] in ['RedHat'] %}

create_storage_directory:
  file:
    - directory
    - name:  /storage
    - mode:  777

{% endif %}

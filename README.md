# vmware-to-proxmox
Migrate vm from VmWare to Proxmox
How to use:
create into proxmox a vm without instalation media, set RAM,HDD same or higher than vmware vm's.
Select type of hdd virtualization (IDE work for all type, sata have some issue  with linux migration from vmware)
Convert this vm to a template into proxmox and change into my code this value "107-Id-of-tempalte-vm" with template id ex: 110
$1 means id of the node from vmware
$2 means name of machine from vmware
$3 means new id for new vm into proxmox (check that id dosen't exist allready into proxmox)

if [ $# -ge 3 ];
then
qm clone 107-Id-of-tempalte-vm $3 --format raw --full true --name $2
wait
if [ $1 -eq '1' ];then
sshpass -p "vmwarePass" scp  -o StrictHostKeyChecking=no root@ipvmawarenode1:/vmfs/volumes/datastore1/$2/$2-flat.vmdk  /path/to/proxmox/locations/images/folder/$3/
elif [ $1 -eq '2' ];then
sshpass -p "vmwarePass" scp  -o StrictHostKeyChecking=no root@ipvmawarenode2:/vmfs/volumes/datastore2/$2/$2-flat.vmdk  /path/to/proxmox/locations/images/folder/$3/
elif [ $1 -eq '3' ]; then
sshpass -p "vmwarePass" scp  -o StrictHostKeyChecking=no root@ipvmawarenode3:/vmfs/volumes/datastore3/$2/$2-flat.vmdk  /path/to/proxmox/locations/images/folder/$3/
fi

if [ "$?" -eq "0" ];
then
    echo "Copy SUCCESS"
else
    echo "FAIL"
fi
wait
cd /path/to/proxmox/locations/images/folder/$3/
qemu-img convert $2-flat.vmdk vm-$3-disk-1.raw
wait
echo "Covert Succes"
wait
qm set $3 --name $2
wait
echo "Name Set to: " $2
wait
qm start $3
wait
echo "Vm Stareted"
else
echo "Invalid arg Ex:./migrate.sh 1/2/3(nr-node) name-vm-esxi id-proxmox"
fi

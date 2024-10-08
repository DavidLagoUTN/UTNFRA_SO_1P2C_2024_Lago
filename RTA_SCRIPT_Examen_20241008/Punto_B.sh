#!/bin/bash
DISCO=$(sudo fdisk -l |grep Disk |grep "10 GiB" |awk '{print $2}' |sed 's/://g')
echo "Particionando el disco: $DISCO"

sudo fdisk $DISCO << FIN

n
p


+1G
n
p


+1G
n
p


+1G
n
e


n

+1G
n

+1G
n

+1G
n

+1G
n

+1G
n

+1G
n


w
FIN
echo "Generadas las particiones:"
sudo fdisk -l $DISCO

echo "Formateando las particiones:"
sudo fdisk -l $DISCO |grep $DISCO |grep -viE 'Disk|exten' |awk '{print "sudo mkfs.ext4 "$1}' |/bin/bash

echo "Montando las particiones:"
sudo mount ${DISCO}1 /Examenes-UTN/alumno_1/parcial_1
sudo mount ${DISCO}2 /Examenes-UTN/alumno_1/parcial_2
sudo mount ${DISCO}3 /Examenes-UTN/alumno_1/parcial_3
sudo mount ${DISCO}5 /Examenes-UTN/alumno_2/parcial_1
sudo mount ${DISCO}6 /Examenes-UTN/alumno_2/parcial_2
sudo mount ${DISCO}7 /Examenes-UTN/alumno_2/parcial_3
sudo mount ${DISCO}8 /Examenes-UTN/alumno_3/parcial_1
sudo mount ${DISCO}9 /Examenes-UTN/alumno_3/parcial_2
sudo mount ${DISCO}10 /Examenes-UTN/alumno_3/parcial_3
sudo mount ${DISCO}11 /Examenes-UTN/profesores

echo "Validando montaje: "
df -h |grep Examenes-UTN

echo "${DISCO}1 /Examenes-UTN/alumno_1/parcial_1 ext4 default 0 0" | sudo tee -a /etc/fstab
echo "${DISCO}2 /Examenes-UTN/alumno_1/parcial_2 ext4 default 0 0" | sudo tee -a /etc/fstab
echo "${DISCO}3 /Examenes-UTN/alumno_1/parcial_3 ext4 default 0 0" | sudo tee -a /etc/fstab
echo "${DISCO}5 /Examenes-UTN/alumno_2/parcial_1 ext4 default 0 0" | sudo tee -a /etc/fstab
echo "${DISCO}6 /Examenes-UTN/alumno_2/parcial_2 ext4 default 0 0" | sudo tee -a /etc/fstab
echo "${DISCO}7 /Examenes-UTN/alumno_2/parcial_3 ext4 default 0 0" | sudo tee -a /etc/fstab
echo "${DISCO}8 /Examenes-UTN/alumno_3/parcial_1 ext4 default 0 0" | sudo tee -a /etc/fstab
echo "${DISCO}9 /Examenes-UTN/alumno_3/parcial_2 ext4 default 0 0" | sudo tee -a /etc/fstab
echo "${DISCO}10 /Examenes-UTN/alumno_3/parcial_3 ext4 default 0 0" | sudo tee -a /etc/fstab
echo "${DISCO}11 /Examenes-UTN/profesores ext4 default 0 0" | sudo tee -a /etc/fstab
sudo mount -a


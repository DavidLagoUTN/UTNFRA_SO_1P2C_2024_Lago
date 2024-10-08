#!/bin/bash

CLAVE=$(sudo grep "$USER" /etc/shadow | awk -F ':' '{print $2}')

sudo groupadd p1c2_2024_gAlumno

sudo useradd -m -s /bin/bash -G p1c2_2024_gAlumno p1c2_2024_A1
echo "p1c2_2024_A1:$CLAVE" | sudo chpasswd

sudo useradd -m -s /bin/bash -G p1c2_2024_gAlumno p1c2_2024_A2
echo "p1c2_2024_A2:$CLAVE" | sudo chpasswd

sudo useradd -m -s /bin/bash -G p1c2_2024_gAlumno p1c2_2024_A3
echo "p1c2_2024_A3:$CLAVE" | sudo chpasswd


sudo groupadd p1c2_2024_gProfesores

sudo useradd -m -s /bin/bash -G p1c2_2024_gProfesores p1c2_2024_P1
echo "p1c2_2024_P1:$CLAVE" | sudo chpasswd


sudo chmod -R 750 /Examenes-UTN/alumno_1
sudo chmod -R 760 /Examenes-UTN/alumno_2
sudo chmod -R 700 /Examenes-UTN/alumno_3
sudo chmod -R 775 /Examenes-UTN/profesores

su -c "whoami > /Examenes-UTN/alumnos_1/validar.txt"p1c2_2024_A1

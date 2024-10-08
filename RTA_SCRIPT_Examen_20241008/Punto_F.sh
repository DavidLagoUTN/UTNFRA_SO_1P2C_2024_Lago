echo "Mi IP Pública es: $(curl -s ifconfig.me)" > ~/repogit/UTNFRA_SO_1P2C_2024_Lago/RTA_ARCHIVOS_Examen_20241003/Filtro_Avanzado.txt
echo "Mi usuario es $(whoami)" >> ~/repogit/UTNFRA_SO_1P2C_2024_Lago/RTA_ARCHIVOS_Examen_20241003/Filtro_Avanzado.txt
sudo grep $USER /etc/shadow | awk -F ':' '{print "El Hash de mi Usuario es: " $2}' >> ~/repogit/UTNFRA_SO_1P2C_2024_Lago/RTA_ARCHIVOS_Examen_20241003/Filtro_Avanzado.txt
git remote get-url origin | awk '{print "La URL de mi repositorio es: " $0}' >> ~/repogit/UTNFRA_SO_1P2C_2024_Lago/RTA_ARCHIVOS_Examen_20241003/Filtro_Avanzado.txt

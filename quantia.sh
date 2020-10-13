#!/bin/bash
# Comandos Gerais
# free -g
# mkdir /mnt/ramdisk
# mount -t tmpfs -o size=500m tmpfs /mnt/ramdisk
# echo "$(ram_check)"

# Menu
echo "Ram v1"
echo "1.) ram"
echo "2.) dir"
echo "3.) mount"

# Selecionamento 
read -p "Selecione uma opção: " choice

# Functions need below:
ram_check() { # Monitorando ram
    echo "[+] Exibindo ram..."
    free -g
}

make_dir_ramdisk() { # Diretório
    echo "dir ramdisk in /mnt/"
    mkdir /mnt/ramdisk
}

mounter() { # Função para selecionar a quantia que o usuário deseja
    read -p "Insira a quantia de espaço que deseja montar ex 500m: " space
    echo "[+] Montando..."
    mount -t tmpfs -o size=$space tmpfs /mnt/ramdisk
    echo '[+] Terminado.'
}

# Todas às funções inseridas abaixo
if [ $choice == "ram" ]
then
  echo "$(ram_check)"

elif [ $choice == "dir" ]
then
   echo "$(make_dir_ramdisk)" 

elif [ $choice == "mount" ]
then
  echo "$(mounter)"

else
  echo "[-] Opção inválida."
fi

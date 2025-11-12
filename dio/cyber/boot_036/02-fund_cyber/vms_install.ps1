

# Enter - iniciar o boot
# F8 - concordar com a licença
# Enter - manter a única partição (C - cria partiçoes)
# Formatar a partição usando o NIFS file system (Outra opção é com FAT).

# Configuração Windows





#Windows XP
$executar = Read-Host "Deseja criar a VM WinXP no VirtualBox? (S/N)"
if ($executar -eq "S" -or $executar -eq "s") {
    Write-Host "Criando a máquina virtual"
    VBoxManage createvm --name "WinXP" --ostype "WindowsXP" --register --basefolder "C:/Users/pedro/virtual_box-vms"

    Write-Host "Definindo memória, CPUs e ordem de boot"
    VBoxManage modifyvm "WinXP" --memory 2048 --cpus 2 --boot1 dvd --boot2 disk --boot3 none --boot4 none

    Write-Host "Configurando rede em modo NAT"
    VBoxManage modifyvm "WinXP" --nic1 nat

    Write-Host "Criando o disco virtual de 20 GB"
    VBoxManage createmedium disk --filename "C:\Users\pedro\VirtualBox\disk\WinXP.vdi" --size 20480 --format VDI --variant Standard

    Write-Host "Criando e anexando o controlador IDE"
    VBoxManage storagectl "WinXP" --name "IDE Controller" --add ide

    Write-Host "Anexando a ISO do sistema ao dispositivo de DVD do controlador IDE"
    VBoxManage storageattach "WinXP" --storagectl "IDE Controller" --port 0 --device 0 --type dvddrive --medium "G:/Meu Drive/3_PROG/1_Rec/ISOs/windows/pt-br_windows_xp_professional_with_service_pack_3_x86_cd_vl_x14-74137.iso"

    Write-Host "Anexando o disco rígido (HD) virtual ao controlador IDE"
    VBoxManage storageattach "WinXP" --storagectl "IDE Controller" --port 0 --device 1 --type hdd --medium "C:\Users\pedro\VirtualBox\disk\WinXP.vdi"

    Write-Host "Configurando a instalação automática do sistema"
    VBoxManage unattended install "WinXP" --iso="G:/Meu Drive/3_PROG/1_Rec/ISOs/windows/pt-br_windows_xp_professional_with_service_pack_3_x86_cd_vl_x14-74137.iso" --user=Pedro --password=Pass@word --time-zone="E. South America Standard Time" --locale=pt_BR --key="MRX3F-47B9T-2487J-KWKMF-RPWBY"

    Write-Host "Iniciando a VM com interface gráfica"
    VBoxManage startvm "WinXP" --type gui

} else {
    Write-Host "Execução cancelada pelo usuário."
}



#Windows 7
$executar = Read-Host "Deseja criar a VM Win7 no VirtualBox? (S/N)"
if ($executar -eq "S" -or $executar -eq "s") {
    Write-Host "Criando a máquina virtual"
    VBoxManage createvm --name "Win7" --ostype "Windows7_64" --register --basefolder "C:\Users\pedro\VirtualBox\vm"

    Write-Host "Definindo memória, CPUs e ordem de boot"
    VBoxManage modifyvm "Win7" --memory 2048 --cpus 2 --boot1 dvd --boot2 disk --boot3 none --boot4 none

    Write-Host "Configurando rede em modo NAT"
    VBoxManage modifyvm "Win7" --nic1 nat

    Write-Host "Criando o disco virtual de 32 GB"
    VBoxManage createmedium disk --filename "C:\Users\pedro\VirtualBox\disk\Win7.vdi" --size 32000 --format VDI --variant Standard

    Write-Host "Criando e anexando o controlador IDE"
    VBoxManage storagectl "Win7" --name "IDE Controller" --add ide

    Write-Host "Anexando a ISO do sistema ao dispositivo de DVD do controlador IDE"
    VBoxManage storageattach "Win7" --storagectl "IDE Controller" --port 0 --device 0 --type dvddrive --medium "G:/Meu Drive/3_PROG/1_Rec/ISOs/windows/pt_windows_7_ultimate_with_sp1_x64_dvd_u_677358.iso"

    Write-Host "Anexando o disco rígido (HD) virtual ao controlador IDE"
    VBoxManage storageattach "Win7" --storagectl "IDE Controller" --port 0 --device 1 --type hdd --medium "C:\Users\pedro\VirtualBox\disk\Win7.vdi"

    Write-Host "Iniciando a VM com interface gráfica"
    VBoxManage startvm "Win7" --type gui

} else {
    Write-Host "Execução cancelada pelo usuário."
}



#Windows 10
$executar = Read-Host "Deseja criar a VM Win10 no VirtualBox? (S/N)"
if ($executar -eq "S" -or $executar -eq "s") {
    Write-Host "Criando a máquina virtual"
    VBoxManage createvm --name "Win10" --ostype "Windows7_64" --register --basefolder "C:\Users\pedro\VirtualBox\vm"

    Write-Host "Definindo memória, CPUs e ordem de boot"
    VBoxManage modifyvm "Win10" --memory 2048 --cpus 2 --boot1 dvd --boot2 disk --boot3 none --boot4 none

    Write-Host "Configurando rede em modo NAT"
    VBoxManage modifyvm "Win10" --nic1 nat

    Write-Host "Criando o disco virtual de 32 GB"
    VBoxManage createmedium disk --filename "C:\Users\pedro\VirtualBox\disk\Win10.vdi" --size 32000 --format VDI --variant Standard

    Write-Host "Criando e anexando o controlador SATA"
    VBoxManage storagectl "Win10" --name "SATA Controller" --add sata --controller IntelAhci

    Write-Host "Anexando o disco virtual ao controlador SATA"
    VBoxManage storageattach "Win10" --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium "C:\Users\pedro\VirtualBox\disk\Win10.vdi"

    Write-Host "Criando e anexando o controlador IDE"
    VBoxManage storagectl "Win10" --name "IDE Controller" --add ide

    Write-Host "Anexando a ISO do sistema ao dispositivo de DVD do controlador IDE"
    VBoxManage storageattach "Win10" --storagectl "IDE Controller" --port 0 --device 0 --type dvddrive --medium "G:/Meu Drive/3_PROG/1_Rec/ISOs/windows/Win10_21H1_English_x64.iso"

    Write-Host "Iniciando a VM com interface gráfica"
    VBoxManage startvm "Win10" --type gui

} else {
    Write-Host "Execução cancelada pelo usuário."
}



#Kali Linux
$executar = Read-Host "Deseja criar a VM Kali Linux no VirtualBox? (S/N)"
if ($executar -eq "S" -or $executar -eq "s") {
    Write-Host "Criando a máquina virtual"
    VBoxManage createvm --name "Kali" --ostype "Debian_64" --register --basefolder "C:\Users\pedro\VirtualBox\vm"

    Write-Host "Definindo memória, CPUs e ordem de boot"
    VBoxManage modifyvm "Kali" --memory 2048 --cpus 2 --boot1 dvd --boot2 disk --boot3 none --boot4 none

    Write-Host "Configurando rede em modo NAT"
    VBoxManage modifyvm "Kali" --nic1 nat

    Write-Host "Criando o disco virtual de 32 GB"
    VBoxManage createmedium disk --filename "C:\Users\pedro\VirtualBox\disk\Kali.vdi" --size 32000 --format VDI --variant Standard

    Write-Host "Criando e anexando o controlador SATA"
    VBoxManage storagectl "Kali" --name "SATA Controller" --add sata --controller IntelAhci

    Write-Host "Anexando o disco virtual ao controlador SATA"
    VBoxManage storageattach "Kali" --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium "C:\Users\pedro\VirtualBox\disk\Kali.vdi"

    Write-Host "Criando e anexando o controlador IDE"
    VBoxManage storagectl "Kali" --name "IDE Controller" --add ide

    Write-Host "Anexando a ISO do sistema ao dispositivo de DVD do controlador IDE"
    VBoxManage storageattach "Kali" --storagectl "IDE Controller" --port 0 --device 0 --type dvddrive --medium "C:\Users\pedro\Downloads\kali\kali-linux-2025.3-installer-amd64.iso"

    Write-Host "Iniciando a VM com interface gráfica"
    VBoxManage startvm "Kali" --type gui

} else {
    Write-Host "Execução cancelada pelo usuário."
}
#Metasploitable
$executar = Read-Host "Deseja criar a VM Metasploitable no VirtualBox? (S/N)"
if ($executar -eq "S" -or $executar -eq "s") {
    Write-Host "Criando a máquina virtual"
    VBoxManage createvm --name "mstab" --ostype "Linux_64" --register --basefolder "C:\Users\pedro\VirtualBox\vm"

    Write-Host "Definindo memória, CPUs e ordem de boot"
    VBoxManage modifyvm "mstab" --memory 2048 --cpus 1

    Write-Host "Configurando rede em modo NAT"
    VBoxManage modifyvm "mstab" --nic1 nat
    
    # Write-Host "Criando o disco virtual de 20 GB"
    # VBoxManage createmedium disk --filename "C:\Users\pedro\VirtualBox\disk\mstab.vdi" --size 20000 --format VDI --variant Standard

    Write-Host "Criando e anexando o controlador SATA"
    VBoxManage storagectl "mstab" --name "SATA Controller" --add sata --controller IntelAhci

    Write-Host "Anexando o disco virtual ao controlador SATA"
    # VBoxManage storageattach "mstab" --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium "C:\Users\pedro\VirtualBox\disk\mstab.vdi"
    VBoxManage storageattach "mstab" --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium "G:\Meu Drive\3_PROG\1_Rec\ISOs\metasploit\Metasploitable.vmdk"




    VBoxManage modifyvm "mstab" --ioapic off

    Write-Host "Iniciando a VM com interface gráfica"
    VBoxManage startvm "mstab" --type gui
} else {
    Write-Host "Execução cancelada pelo usuário."
}
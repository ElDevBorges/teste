import subprocess
import sys

# Função para instalar um pacote se não estiver instalado
def install_package(package):
    try:
        # Tenta importar o pacote
        __import__(package)
    except ImportError:
        # Se falhar, instala o pacote
        print(f"Pacote {package} não encontrado. Instalando...")
        subprocess.check_call([sys.executable, "-m", "pip", "install", package])

# Instala o pacote 'psutil' caso necessário
install_package("psutil")

# Agora você pode usar a funcionalidade do pacote
import psutil

def get_mac_address():
    addrs = psutil.net_if_addrs()
    for interface, snics in addrs.items():
        for snic in snics:
            if snic.family == psutil.AF_LINK:
                return snic.address
    return None

mac_address = get_mac_address()
if mac_address:
    print(f"Endereço MAC: {mac_address}")
else:
    print("Endereço MAC não encontrado.")

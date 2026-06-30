# Terraform_expample
Ejemplo simple del uso de terraform para hacer deploy y destroy en un servicio de nube
# Despliegue Automatizado de un Clúster AKS con Terraform

Este repositorio contiene la configuración de Infraestructura como Código (IaC) necesaria para aprovisionar de forma automática un clúster administrado de Kubernetes en Azure (**Azure Kubernetes Service - AKS**) utilizando **Terraform**. Además, se incluye el manifiesto para desplegar y exponer una aplicación web de ejemplo (Nginx).

El objetivo de este proyecto es demostrar la transición hacia arquitecturas en la nube modernas mediante la automatización, la seguridad por diseño y el cumplimiento del principio de privilegio mínimo.

---

## Arquitectura de la Infraestructura

El script de Terraform aprovisiona los siguientes recursos en Azure:

* **Resource Group (`azurerm_resource_group`):** Contenedor lógico que unifica el ciclo de vida de toda la infraestructura del proyecto.
* **Llave SSH (`tls_private_key`):** Generación dinámica de un par de llaves criptográficas RSA de 4096 bits para asegurar el acceso a los nodos de Linux sin contraseñas tradicionales.
* **Azure Kubernetes Service (`azurerm_kubernetes_cluster`):**
    * **Orquestador:** Kubernetes administrado.
    * **Node Pool por Defecto:** 1 Nodo utilizando el tamaño de máquina `Standard_B2s` (balance óptimo de costo/rendimiento para entornos de desarrollo).
    * **Identidad (`SystemAssigned`):** Identidad administrada asignada por el sistema para evitar el manejo manual de Service Principals y credenciales hardcodeadas.

---

## Estructura del Repositorio

```text
├── provider.tf        # Configuración del proveedor de Azure y versiones requeridas
├── variables.tf       # Parámetros y valores por defecto (Región, nombres, etc.)
├── main.tf            # Definición central de recursos (RG, SSH, AKS)
├── outputs.tf         # Salidas de datos y manejo de configuración sensible (kube_config)
├── deployment.yaml    # Manifiesto de Kubernetes (Deployment + Service LoadBalancer)
└── README.md          # Documentación del proyecto

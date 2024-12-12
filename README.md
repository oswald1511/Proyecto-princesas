<p align="center">
  <img src="https://upload.wikimedia.org/wikipedia/commons/b/b7/Disney_Princess_logo_2015.png" alt="Logo" width="400"/>
</p>

# 👑 Proyecto princesas

Un proyecto que interactúa con el usuario en forma de juego, sencillo e intuitivo, que sirve para pasar el rato, dedicado para el público fanático de la fantasía de Disney.

P.D: Con aparición sorpresa del emperador mickey😶

## 👥 Autores

- [@Oswaldo Maldonado](https://www.github.com/oswald1511)
- [@Rocio Vera](https://www.github.com/Rocio-Elizabeth-Vera)
- [@Nahuel Blanco](https://www.github.com/nahuelemi)

## 📈 Progreso

En esta seccion podemos ir agregando screeshots del progreso de la pagina 

### 📅 23/11/2024

<img src="./frontend/assets/screenshots/23-11-2024.png" alt="23/11/2024" width="700"/>

### 📅 26/11/2024

<img src="./frontend/assets/screenshots/26-11-2024.png" alt="26/11/2024" width="700"/>

### 📅 03/12/2024

<img src="./frontend/assets/screenshots/03-12-2024.png" alt="03/12/2024" width="700"/>

### 📅 04/12/2024

<img src="./frontend/assets/screenshots/04-12-2024.png" alt="04/12/2024" width="700"/>

## 📸 Screenshots
Aqui veriamos como se deberia de ver el proyecto terminado
![App Screenshot](https://via.placeholder.com/468x300?text=App+Screenshot+Here)

## 🚀 Levantar el proyecto de forma local

Para levantar el proyecto de forma local primero debes clonar el repositorio:

```sh
git clone https://github.com/tu-usuario/proyecto-princesas.git
```

### 📦 Dependencias

Asegúrate de tener instaladas las siguientes dependencias antes de comenzar:

- [Node.js](https://nodejs.org/)
- Docker:
  - **Linux**: [Docker](https://www.docker.com/)
  - **Windows**: [Docker Desktop](https://www.docker.com/products/docker-desktop) + [WSL2](https://docs.microsoft.com/en-us/windows/wsl/install)

> [!TIP]
> Asegúrate de mantener tus dependencias actualizadas para evitar problemas de compatibilidad.

### 🔧 Variables de Entorno

Para correr este proyecto, vas a necesitar añadir las siguientes variables de entorno a tu archivo `.env` dentro del directorio de backend:

`DATABASE_URL="postgresql://usuario:contraseña@localhost:puerto/nombre_bdd"
`

### 🛠️ Comandos a ejecutar


#### Como levantar BE

ejecutar los siguientes comandos en el directorio de backend: 

> [!WARNING]
> Asegúrate de que Docker esté corriendo antes de ejecutar docker compose up -d. De lo contrario, el contenedor no se iniciará correctamente.

```bash
npm install
docker compose up -d
npx  prisma migrate dev
npm run dev
```
#### Como levantar el FE

Ejecutar los siguientes comandos en el directorio de frontend:

```bash
npm install
npm run start
```
---

> 🌟 _"El trabajo en equipo hace que los sueños se cumplan."_ - Equipo Princesas 👑

---

<p align="center">
  <img src="https://upload.wikimedia.org/wikipedia/commons/b/b7/Disney_Princess_logo_2015.png" alt="Logo" width="400"/>
</p>

# 👑 Proyecto princesas

Agregar una descripcion del proyecto

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

## 📸 Screenshots
Aqui veriamos como se deberia de ver el proyecto terminado
![App Screenshot](https://via.placeholder.com/468x300?text=App+Screenshot+Here)

## 🚀 Levantar el proyecto de forma local

### 📦 Dependencias

Asegúrate de tener instaladas las siguientes dependencias antes de comenzar:

- [Node.js](https://nodejs.org/)
- Docker:
  - **Linux**: [Docker](https://www.docker.com/)
  - **Windows**: [Docker Desktop](https://www.docker.com/products/docker-desktop) + [WSL2](https://docs.microsoft.com/en-us/windows/wsl/install)

### 🔧 Variables de Entorno

Para correr este proyecto, vas a necesitar añadir las siguientes variables de entorno a tu archivo `.env`:

`DATABASE_URL="postgresql://usuario:contraseña@localhost:puerto/nombre_bdd"
`

### 🛠️ Comandos a ejecutar

#### Como levantar el FE

Ejecutar los siguientes comandos en wl directorio de frontend:

```bash
npm install
npm run start
```

#### Como levantar BE

ejecutar los siguientes comandos en el directorio de backend: 

```bash
  npm install
  npx  prisma migrate dev
  docker compose up -d
  npm run dev
```

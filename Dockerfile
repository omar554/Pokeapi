# Usar una imagen base oficial de Node.js
FROM node:18 as build

# Establecer el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copiar los archivos de configuración de tu proyecto
COPY package*.json ./

# Instalar dependencias
RUN npm install

# Copiar todo el código de la aplicación al contenedor
COPY . .

# Ejecutar pruebas unitarias
RUN npm test -- --watchAll=false

# Construir la aplicación para producción
RUN npm run build

# Servir la aplicación con un servidor NGINX
FROM nginx:1.25
COPY --from=build /app/build /usr/share/nginx/html

# Exponer el puerto en el que corre NGINX
EXPOSE 80

# Configuración por defecto para iniciar NGINX
CMD ["nginx", "-g", "daemon off;"]

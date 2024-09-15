# Utiliser une image de base Node.js LTS avec Alpine
FROM node:lts-alpine

# Définir le répertoire de travail dans le conteneur
WORKDIR /app

# Copier les fichiers package.json et package-lock.json dans le répertoire de travail
COPY package*.json ./

# Installer les dépendances
RUN npm install

# Copier le reste des fichiers de l'application dans le répertoire de travail
COPY . .

# Exposer le port 3000
EXPOSE 3000

# Définir la commande par défaut pour démarrer l'application
CMD ["npm", "run", "start"]
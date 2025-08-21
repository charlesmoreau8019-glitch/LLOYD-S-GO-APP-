# 🔧 Guide de Dépannage - Lloyds GO!

## 🚨 Problèmes courants et solutions

### 1. Erreur de connexion API

**Symptôme :** Les prix crypto ne se chargent pas
```
❌ Erreur: Impossible de récupérer les prix crypto
```

**Solutions :**
1. Vérifier la clé API CoinGecko dans `.env`
2. Contrôler la connectivité internet
3. Vérifier les limites de l'API

```env
# Dans .env
COINGECKO_API_KEY=votre_cle_api_ici
```

### 2. Erreur de base de données

**Symptôme :** Impossible de sauvegarder les données
```
❌ Erreur: Database connection failed
```

**Solutions :**
1. Vérifier les permissions du dossier
2. S'assurer que SQLite est installé
3. Vérifier le chemin de la base de données

```javascript
// Dans config/database.js
const dbPath = process.env.DB_PATH || './database.sqlite';
```

### 3. Erreur de port

**Symptôme :** Le serveur ne démarre pas
```
❌ Erreur: Port 3000 already in use
```

**Solutions :**
1. Changer le port dans `.env`
2. Fermer les autres applications
3. Utiliser un port différent

```env
PORT=3001
```

### 4. Erreur d'authentification

**Symptôme :** Impossible de se connecter
```
❌ Erreur: Invalid credentials
```

**Solutions :**
1. Vérifier la clé JWT_SECRET
2. Réinitialiser le mot de passe
3. Vérifier la base de données utilisateurs

### 5. Erreur CORS

**Symptôme :** Erreurs dans la console du navigateur
```
❌ CORS error: Access denied
```

**Solutions :**
1. Vérifier la configuration CORS dans `server.js`
2. Ajouter les domaines autorisés
3. Vérifier les headers de sécurité

## 🔍 Diagnostic

### Test de connectivité API
```bash
# Tester l'API CoinGecko
curl https://api.coingecko.com/api/v3/ping

# Tester l'API locale
curl http://localhost:3000/api/health
```

### Test de la base de données
```bash
# Vérifier le fichier de base de données
ls -la database.sqlite

# Tester la connexion SQLite
sqlite3 database.sqlite "SELECT name FROM sqlite_master;"
```

### Test des dépendances
```bash
# Vérifier les modules installés
npm list

# Réinstaller les dépendances
npm install
```

## 🛠️ Outils de diagnostic

### Page de test intégrée
Accédez à `test-deployment.html` pour :
- Tester la connectivité API
- Vérifier la base de données
- Tester l'authentification

### Logs système
```bash
# Voir les logs en temps réel
tail -f logs/combined.log

# Voir les erreurs
tail -f logs/error.log
```

### Monitoring des performances
```bash
# Vérifier l'utilisation mémoire
node --inspect server.js

# Profiler l'application
node --prof server.js
```

## 🔧 Réparations automatiques

### Script de réparation
```bash
#!/bin/bash
# repair.sh

echo "🔧 Réparation automatique..."

# 1. Nettoyer les modules
rm -rf node_modules
npm install

# 2. Réinitialiser la base de données
rm -f database.sqlite
node -e "require('./config/database.js').init()"

# 3. Vérifier les permissions
chmod 755 deploy/
chmod 644 deploy/*.js

# 4. Redémarrer le serveur
pkill -f "node server.js"
node server.js
```

### Réinitialisation complète
```bash
# Sauvegarder les données importantes
cp users.json users_backup.json

# Réinitialiser tout
rm -rf node_modules
rm -f database.sqlite
npm install
node server.js
```

## 📞 Support avancé

### Informations système
```bash
# Version Node.js
node --version

# Version npm
npm --version

# Système d'exploitation
uname -a

# Espace disque
df -h
```

### Logs détaillés
```bash
# Activer les logs détaillés
DEBUG=* node server.js

# Logs spécifiques
DEBUG=app:*,api:* node server.js
```

### Test de charge
```bash
# Installer Apache Bench
sudo apt-get install apache2-utils

# Test de charge
ab -n 1000 -c 10 http://localhost:3000/
```

## 🎯 Solutions par environnement

### Développement local
- Utiliser `npm run dev`
- Activer les logs détaillés
- Utiliser le mode debug

### Production (Netlify)
- Vérifier les variables d'environnement
- Contrôler les logs Netlify
- Tester les fonctions serverless

### Docker
```dockerfile
# Dockerfile de diagnostic
FROM node:18-alpine
WORKDIR /app
COPY deploy/ .
RUN npm install
EXPOSE 3000
CMD ["node", "server.js"]
```

## 📋 Checklist de diagnostic

### Avant le déploiement
- [ ] Toutes les dépendances installées
- [ ] Variables d'environnement configurées
- [ ] Base de données initialisée
- [ ] Permissions correctes

### Après le déploiement
- [ ] Serveur démarre sans erreur
- [ ] API accessible
- [ ] Base de données fonctionnelle
- [ ] Authentification opérationnelle
- [ ] Interface utilisateur responsive

### En cas de problème
- [ ] Vérifier les logs
- [ ] Tester les APIs
- [ ] Contrôler la base de données
- [ ] Vérifier la configuration
- [ ] Consulter la documentation

---

**💡 Conseil :** En cas de problème persistant, consultez les logs détaillés et contactez l'équipe de support avec les informations de diagnostic.

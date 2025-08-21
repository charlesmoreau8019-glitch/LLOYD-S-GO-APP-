# 🚀 Guide de Déploiement Gratuit sur Vercel - Lloyds GO!

## 🌟 Pourquoi Vercel ?

- ✅ **100% Gratuit** pour les projets personnels
- ✅ **Serverless Functions** incluses (comme Netlify)
- ✅ **Déploiement automatique** depuis GitHub
- ✅ **Performance excellente** avec CDN global
- ✅ **Interface simple** et intuitive

## 📋 Étapes de Déploiement

### **1. Préparer le Projet pour Vercel**

#### Créer le fichier `vercel.json`
```json
{
  "version": 2,
  "builds": [
    {
      "src": "functions/api.js",
      "use": "@vercel/node"
    },
    {
      "src": "*.html",
      "use": "@vercel/static"
    }
  ],
  "routes": [
    {
      "src": "/api/(.*)",
      "dest": "/functions/api.js"
    },
    {
      "src": "/(.*)",
      "dest": "/$1"
    }
  ],
  "env": {
    "NODE_ENV": "production"
  }
}
```

#### Modifier `package.json` pour Vercel
```json
{
  "name": "lloyds-go-app",
  "version": "1.0.0",
  "engines": {
    "node": "18.x"
  },
  "scripts": {
    "build": "echo 'No build step required'",
    "start": "node functions/api.js"
  }
}
```

### **2. Inscription sur Vercel**

1. Aller sur [vercel.com](https://vercel.com)
2. Cliquer sur "Sign Up"
3. Choisir "Continue with GitHub"
4. Autoriser l'accès à votre compte GitHub

### **3. Déploiement Automatique**

1. **Importer le projet** :
   - Cliquer sur "New Project"
   - Sélectionner votre repository GitHub
   - Vercel détectera automatiquement la configuration

2. **Configuration** :
   - **Framework Preset** : Other
   - **Root Directory** : `deploy`
   - **Build Command** : `npm install`
   - **Output Directory** : `.`

3. **Variables d'Environnement** :
   ```env
   NODE_ENV=production
   JWT_SECRET=votre-secret-jwt-super-securise-123456789
   COINGECKO_API_URL=https://api.coingecko.com/api/v3
   RATE_LIMIT_WINDOW_MS=900000
   RATE_LIMIT_MAX_REQUESTS=100
   LOG_LEVEL=info
   ```

4. **Déployer** :
   - Cliquer sur "Deploy"
   - Attendre 2-3 minutes
   - Votre site sera en ligne !

## 🌐 URLs de Votre Application

### **URLs Vercel**
```
https://votre-projet.vercel.app
https://votre-projet.vercel.app/admin.html
https://votre-projet.vercel.app/admin-balance.html
https://votre-projet.vercel.app/test-admin-access.html
```

### **API Backend**
```
https://votre-projet.vercel.app/api/health
https://votre-projet.vercel.app/api/auth/register
https://votre-projet.vercel.app/api/auth/login
```

## 🔧 Configuration Avancée

### **Domaine Personnalisé (Gratuit)**
1. Dans Vercel Dashboard
2. Aller dans "Settings" → "Domains"
3. Ajouter votre domaine
4. Configurer les DNS

### **Variables d'Environnement**
Dans Vercel Dashboard → Settings → Environment Variables :
```env
NODE_ENV=production
JWT_SECRET=votre-secret-jwt-super-securise-123456789
COINGECKO_API_URL=https://api.coingecko.com/api/v3
RATE_LIMIT_WINDOW_MS=900000
RATE_LIMIT_MAX_REQUESTS=100
LOG_LEVEL=info
ALLOWED_ORIGINS=https://votre-projet.vercel.app,https://localhost:8888
```

## 🧪 Test du Déploiement

### **Test de l'API**
```bash
curl https://votre-projet.vercel.app/api/health
```

### **Test d'Inscription**
```bash
curl -X POST https://votre-projet.vercel.app/api/auth/register \
  -H "Content-Type: application/json" \
  -d '{
    "firstName": "Test",
    "lastName": "User",
    "email": "test@example.com",
    "password": "password123"
  }'
```

## 📊 Avantages Vercel vs Netlify

| Fonctionnalité | Vercel | Netlify |
|----------------|--------|---------|
| **Gratuit** | ✅ Illimité | ✅ Limité |
| **Serverless Functions** | ✅ Incluses | ✅ Incluses |
| **Déploiement Auto** | ✅ GitHub | ✅ GitHub |
| **Performance** | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ |
| **Interface** | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ |
| **Support** | ✅ Excellent | ✅ Bon |

## 🚨 Dépannage

### **Erreur de Build**
- Vérifier le fichier `vercel.json`
- Contrôler les variables d'environnement
- Vérifier les logs de build

### **API non accessible**
- Vérifier la route `/api/(.*)` dans `vercel.json`
- Contrôler que `functions/api.js` existe
- Vérifier les variables d'environnement

### **Erreur CORS**
- Ajouter votre domaine dans `ALLOWED_ORIGINS`
- Vérifier les headers CORS dans l'API

## 🎯 Avantages du Plan Gratuit Vercel

- ✅ **100GB Bandwidth** par mois
- ✅ **Serverless Functions** illimitées
- ✅ **Déploiements** illimités
- ✅ **Domaines personnalisés** gratuits
- ✅ **HTTPS** automatique
- ✅ **CDN global** inclus
- ✅ **Analytics** de base

## 📞 Support

- **Documentation** : [vercel.com/docs](https://vercel.com/docs)
- **Community** : [github.com/vercel/vercel/discussions](https://github.com/vercel/vercel/discussions)
- **Support** : Support gratuit inclus

---

**Lloyds GO!** - Application bancaire et crypto moderne 🚀

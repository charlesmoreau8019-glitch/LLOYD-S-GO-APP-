# 🚀 Guide Complet de Déploiement en Ligne - Lloyds GO!

## 📋 Prérequis

- ✅ Compte GitHub
- ✅ Node.js installé (v18+)
- ✅ Projet Lloyds GO! prêt

## 🌟 Option 1 : Vercel (Recommandé - 100% Gratuit)

### **Étape 1 : Inscription Vercel**

1. **Aller sur [vercel.com](https://vercel.com)**
2. **Cliquer sur "Sign Up"**
3. **Choisir "Continue with GitHub"**
4. **Autoriser l'accès à votre compte GitHub**

### **Étape 2 : Préparer le Projet**

1. **Créer un repository GitHub** (si pas déjà fait)
2. **Pousser votre projet** vers GitHub
3. **Vérifier que le dossier `deploy/` contient** :
   - ✅ `vercel.json`
   - ✅ `package.json`
   - ✅ `functions/api.js`
   - ✅ Tous les fichiers HTML

### **Étape 3 : Déploiement Automatique**

1. **Dans Vercel Dashboard** :
   - Cliquer sur "New Project"
   - Sélectionner votre repository GitHub
   - Vercel détectera automatiquement la configuration

2. **Configuration** :
   - **Framework Preset** : `Other`
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
   ALLOWED_ORIGINS=https://votre-projet.vercel.app,https://localhost:8888
   ```

4. **Cliquer sur "Deploy"**

### **Étape 4 : Configuration Post-Déploiement**

1. **Dans Vercel Dashboard** → **Settings** → **Environment Variables**
2. **Ajouter toutes les variables d'environnement**
3. **Redeployer** pour appliquer les changements

## 🌐 URLs de Votre Application

### **URLs Principales**
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

## 🧪 Test des Fonctionnalités

### **Test 1 : API Backend**
```bash
curl https://votre-projet.vercel.app/api/health
```
**Réponse attendue :**
```json
{
  "status": "OK",
  "timestamp": "2024-01-01T12:00:00.000Z",
  "environment": "production"
}
```

### **Test 2 : Inscription Utilisateur**
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

### **Test 3 : Interface Web**
1. Ouvrir `https://votre-projet.vercel.app`
2. Tester l'inscription/connexion
3. Vérifier la navigation
4. Tester les pages admin

## 🔧 Configuration Avancée

### **Domaine Personnalisé (Gratuit)**
1. **Dans Vercel Dashboard** → **Settings** → **Domains**
2. **Ajouter votre domaine**
3. **Configurer les DNS** selon les instructions

### **Variables d'Environnement Complètes**
```env
NODE_ENV=production
JWT_SECRET=votre-secret-jwt-super-securise-123456789
COINGECKO_API_URL=https://api.coingecko.com/api/v3
RATE_LIMIT_WINDOW_MS=900000
RATE_LIMIT_MAX_REQUESTS=100
LOG_LEVEL=info
ALLOWED_ORIGINS=https://votre-projet.vercel.app,https://localhost:8888
DB_FILE=users.json
EMAIL_SERVICE=gmail
EMAIL_USER=votre-email@gmail.com
EMAIL_PASS=votre-mot-de-passe-app
```

## 📊 Fonctionnalités Disponibles

### **✅ Authentification**
- Inscription utilisateur
- Connexion sécurisée
- JWT tokens
- Gestion des sessions

### **✅ Gestion des Utilisateurs**
- Profils utilisateurs
- Modification des données
- Activation/désactivation
- Suppression de comptes

### **✅ Gestion des Soldes**
- Modification en temps réel
- Actions en masse
- Synchronisation automatique
- Export des données

### **✅ API Crypto**
- Prix en temps réel
- Données CoinGecko
- Calculs automatiques
- Mise à jour continue

### **✅ Interface Admin**
- Dashboard administrateur
- Gestion des soldes
- Statistiques en temps réel
- Actions en masse

### **✅ Sécurité**
- HTTPS automatique
- Rate limiting
- CORS configuré
- Validation des données

## 🚨 Dépannage

### **Erreur 404 sur l'API**
**Solution :**
1. Vérifier le fichier `vercel.json`
2. Contrôler que `functions/api.js` existe
3. Redéployer l'application

### **Erreur CORS**
**Solution :**
1. Ajouter votre domaine dans `ALLOWED_ORIGINS`
2. Vérifier les headers CORS
3. Redéployer

### **Erreur d'Authentification**
**Solution :**
1. Vérifier la variable `JWT_SECRET`
2. Régénérer une nouvelle clé
3. Redéployer

### **Prix Crypto non mis à jour**
**Solution :**
1. Vérifier `COINGECKO_API_URL`
2. Contrôler les limites de l'API
3. Vérifier les logs d'erreur

## 🎯 Checklist de Validation

- [ ] Site déployé sur Vercel
- [ ] Variables d'environnement configurées
- [ ] API backend fonctionnelle
- [ ] Interface web responsive
- [ ] Authentification opérationnelle
- [ ] Gestion des soldes fonctionnelle
- [ ] Prix crypto mis à jour
- [ ] Pages admin accessibles
- [ ] Synchronisation temps réel
- [ ] Tests de sécurité passés

## 📞 Support

### **Documentation**
- [Vercel Docs](https://vercel.com/docs)
- [Vercel Community](https://github.com/vercel/vercel/discussions)

### **Logs et Monitoring**
- **Vercel Dashboard** → **Functions** → **Logs**
- **Vercel Dashboard** → **Analytics**

## 🌟 Avantages du Déploiement Vercel

- ✅ **100% Gratuit** pour les projets personnels
- ✅ **Serverless Functions** incluses
- ✅ **Déploiement automatique** depuis GitHub
- ✅ **Performance excellente** avec CDN global
- ✅ **HTTPS automatique**
- ✅ **Domaines personnalisés** gratuits
- ✅ **Analytics** inclus
- ✅ **Support** gratuit

---

**Lloyds GO!** - Application bancaire et crypto moderne 🚀

# 🔧 Guide d'Accès aux Pages Admin - Lloyds GO!

## 🌐 URLs des Pages d'Administration

### **URLs Principales (après déploiement)**

```
https://lloydgoapp.netlify.app/admin.html
https://lloydgoapp.netlify.app/admin-balance.html
https://lloydgoapp.netlify.app/admin-complete.html
https://lloydgoapp.netlify.app/admin-simple.html
```

### **URLs de Test (déploiement preview)**

```
https://68a72bfa8284de83c5d48cbe--lloydgoapp.netlify.app/admin.html
https://68a72bfa8284de83c5d48cbe--lloydgoapp.netlify.app/admin-balance.html
https://68a72bfa8284de83c5d48cbe--lloydgoapp.netlify.app/admin-complete.html
https://68a72bfa8284de83c5d48cbe--lloydgoapp.netlify.app/admin-simple.html
```

## 📋 Pages d'Administration Disponibles

### 1. **🔧 Administration Générale** (`admin.html`)
- **Fonctionnalités** :
  - Vue d'ensemble du système
  - Statistiques générales
  - Gestion des utilisateurs
  - Configuration système

### 2. **💰 Gestion des Soldes** (`admin-balance.html`)
- **Fonctionnalités** :
  - Modification des soldes utilisateurs
  - Actions en masse
  - Synchronisation temps réel
  - Export des données

### 3. **📊 Administration Complète** (`admin-complete.html`)
- **Fonctionnalités** :
  - Toutes les fonctionnalités admin
  - Gestion avancée
  - Rapports détaillés
  - Configuration avancée

### 4. **⚙️ Administration Simple** (`admin-simple.html`)
- **Fonctionnalités** :
  - Interface simplifiée
  - Actions essentielles
  - Gestion basique

## 🚀 Comment Accéder aux Pages Admin

### **Étape 1 : Créer un Compte Utilisateur**

1. Aller sur la page principale : `https://lloydgoapp.netlify.app`
2. Cliquer sur "S'inscrire"
3. Remplir le formulaire d'inscription
4. Confirmer la création du compte

### **Étape 2 : Accéder aux Pages Admin**

#### **Méthode 1 : Navigation Directe**
- Taper directement l'URL dans le navigateur
- Exemple : `https://lloydgoapp.netlify.app/admin-balance.html`

#### **Méthode 2 : Page de Test**
- Aller sur : `https://lloydgoapp.netlify.app/test-admin-access.html`
- Cliquer sur les boutons pour accéder aux pages admin

#### **Méthode 3 : Navigation depuis le Site**
- Depuis la page principale, ajouter `/admin-balance.html` à l'URL

## 🔍 Test de Fonctionnement

### **Page de Test Automatique**
Accédez à : `https://lloydgoapp.netlify.app/test-admin-access.html`

Cette page va automatiquement :
- ✅ Tester l'API backend
- ✅ Vérifier les utilisateurs
- ✅ Contrôler les soldes
- ✅ Tester la connectivité
- ✅ Fournir des liens directs vers toutes les pages admin

### **Tests Manuels**

#### **Test de l'API**
```bash
curl https://lloydgoapp.netlify.app/.netlify/functions/api/api/health
```

#### **Test d'Inscription**
```bash
curl -X POST https://lloydgoapp.netlify.app/.netlify/functions/api/api/auth/register \
  -H "Content-Type: application/json" \
  -d '{
    "firstName": "Admin",
    "lastName": "Test",
    "email": "admin@test.com",
    "password": "password123"
  }'
```

## 🛠️ Configuration Requise

### **Variables d'Environnement**
Dans Netlify Dashboard > Site settings > Environment variables :

```env
NODE_ENV=production
JWT_SECRET=votre-secret-jwt-super-securise-123456789
COINGECKO_API_URL=https://api.coingecko.com/api/v3
RATE_LIMIT_WINDOW_MS=900000
RATE_LIMIT_MAX_REQUESTS=100
LOG_LEVEL=info
ALLOWED_ORIGINS=https://lloydgoapp.netlify.app,https://localhost:8888
```

## 🚨 Problèmes Courants

### **Erreur 404 sur les Pages Admin**
**Cause** : Pages non déployées
**Solution** :
1. Vérifier que le déploiement est complet
2. Redéployer avec `netlify deploy --prod`
3. Vérifier les logs de build

### **Erreur d'Authentification**
**Cause** : JWT_SECRET mal configuré
**Solution** :
1. Vérifier la variable `JWT_SECRET` dans Netlify
2. Régénérer une nouvelle clé si nécessaire

### **Aucun Utilisateur Affiché**
**Cause** : Aucun utilisateur créé
**Solution** :
1. Créer un compte utilisateur via l'inscription
2. Vérifier que l'utilisateur est bien enregistré
3. Recharger la page admin

## 📊 Fonctionnalités Admin Disponibles

### **Gestion des Utilisateurs**
- ✅ Affichage de tous les utilisateurs
- ✅ Modification des profils
- ✅ Activation/désactivation de comptes
- ✅ Suppression d'utilisateurs

### **Gestion des Soldes**
- ✅ Modification des soldes en temps réel
- ✅ Actions en masse (ajouter, soustraire, multiplier)
- ✅ Export des données
- ✅ Synchronisation automatique

### **Système de Sécurité**
- ✅ Authentification JWT
- ✅ Rate limiting
- ✅ CORS configuré
- ✅ HTTPS automatique

## 🎯 Checklist d'Accès

- [ ] Site déployé sur Netlify
- [ ] Variables d'environnement configurées
- [ ] Compte utilisateur créé
- [ ] API backend fonctionnelle
- [ ] Pages admin accessibles
- [ ] Fonctionnalités de gestion opérationnelles
- [ ] Tests de sécurité passés

## 📞 Support

Si vous ne pouvez pas accéder aux pages admin :

1. **Vérifier l'URL** : S'assurer que l'URL est correcte
2. **Tester l'API** : Vérifier que l'API backend fonctionne
3. **Créer un utilisateur** : S'assurer qu'au moins un utilisateur existe
4. **Vérifier les logs** : Consulter les logs Netlify pour les erreurs

---

**Lloyds GO!** - Application bancaire et crypto moderne 🚀

# Guide de Déploiement Netlify - Lloyds GO!

## 🚀 Déploiement Rapide

### 1. Préparation
```bash
# Installer Netlify CLI
npm install -g netlify-cli

# Se connecter à Netlify
netlify login
```

### 2. Configuration
Créer un fichier `netlify.toml` à la racine :
```toml
[build]
  publish = "."
  command = "npm install"

[[redirects]]
  from = "/*"
  to = "/index.html"
  status = 200

[build.environment]
  NODE_VERSION = "18"
```

### 3. Déploiement
```bash
# Déployer
netlify deploy --prod --dir=.

# Ou utiliser l'interface web Netlify
# 1. Aller sur netlify.com
# 2. Glisser-déposer le dossier deploy
# 3. Configurer les variables d'environnement
```

## 🔧 Variables d'environnement

Dans l'interface Netlify, configurer :
- `COINGECKO_API_KEY` : Votre clé API CoinGecko
- `JWT_SECRET` : Clé secrète pour JWT
- `PORT` : 3000 (par défaut)

## 📁 Structure de déploiement

```
deploy/
├── dashboard.html          # Dashboard principal
├── index.html             # Page d'accueil
├── register.html          # Inscription
├── admin-complete.html    # Administration
├── admin-balance.html     # Gestion soldes
├── js/                    # Scripts JavaScript
├── routes/                # Routes API
├── middleware/            # Middleware
├── models/                # Modèles
├── config/                # Configuration
├── package.json           # Dépendances
└── server.js              # Serveur
```

## 🌐 URLs importantes

- **Dashboard** : `/dashboard.html`
- **Admin** : `/admin-complete.html`
- **Balance** : `/admin-balance.html`
- **API** : `/api/*`

## ✅ Vérification post-déploiement

1. ✅ Page d'accueil accessible
2. ✅ Dashboard fonctionnel
3. ✅ Système d'authentification
4. ✅ API crypto opérationnelle
5. ✅ Interface d'administration
6. ✅ Gestion des soldes

## 🐛 Dépannage

### Erreur 404
- Vérifier le fichier `_redirects`
- S'assurer que tous les fichiers sont présents

### Erreur API
- Vérifier les variables d'environnement
- Contrôler les clés API

### Erreur de base de données
- Vérifier la configuration SQLite
- S'assurer que les permissions sont correctes

## 📞 Support

En cas de problème :
1. Vérifier les logs Netlify
2. Consulter la documentation
3. Tester en local d'abord

# 🏦 Lloyds GO! - Application Bancaire Moderne

Une application bancaire moderne et sécurisée construite avec Node.js, Express, MongoDB et React, offrant des fonctionnalités de gestion bancaire traditionnelle et de cryptomonnaies.

## ✨ Fonctionnalités

### 🏛️ Services Bancaires
- **Gestion de compte** : Solde, historique des transactions
- **Virements** : Transferts entre comptes
- **Dépôts et retraits** : Opérations bancaires classiques
- **RIB** : Relevé d'Identité Bancaire
- **Statistiques** : Analyses détaillées des flux financiers

### 🪙 Cryptomonnaies
- **Portefeuille crypto** : Gestion multi-cryptomonnaies
- **Achat/Vente** : Trading de cryptomonnaies
- **Prix en temps réel** : Intégration API CoinGecko
- **Statistiques** : Performance du portefeuille
- **Historique** : Suivi des transactions crypto

### 🔐 Sécurité
- **Authentification JWT** : Tokens sécurisés
- **Validation des données** : Express-validator
- **Rate limiting** : Protection contre les attaques
- **Helmet** : Sécurité des en-têtes HTTP
- **CORS** : Configuration sécurisée

### 👥 Gestion des Utilisateurs
- **Inscription/Connexion** : Système d'authentification complet
- **Profils utilisateurs** : Gestion des informations personnelles
- **Rôles** : Utilisateur et Administrateur
- **Administration** : Interface de gestion des utilisateurs

## 🚀 Technologies Utilisées

### Backend
- **Node.js** : Runtime JavaScript
- **Express.js** : Framework web
- **MongoDB** : Base de données NoSQL
- **Mongoose** : ODM pour MongoDB
- **JWT** : Authentification
- **bcryptjs** : Hashage des mots de passe
- **express-validator** : Validation des données
- **helmet** : Sécurité
- **cors** : Cross-Origin Resource Sharing
- **compression** : Compression des réponses
- **express-rate-limit** : Limitation de débit

### Frontend
- **React 18** : Bibliothèque UI
- **React Router** : Navigation
- **React Query** : Gestion d'état serveur
- **Tailwind CSS** : Framework CSS
- **Axios** : Client HTTP
- **React Hook Form** : Gestion des formulaires
- **React Hot Toast** : Notifications
- **Recharts** : Graphiques
- **Framer Motion** : Animations
- **Lucide React** : Icônes

## 📦 Installation

### Prérequis
- Node.js (v16 ou supérieur)
- MongoDB (v4.4 ou supérieur)
- npm ou yarn

### 1. Cloner le repository
```bash
git clone https://github.com/votre-username/lloyds-go.git
cd lloyds-go
```

### 2. Configuration de l'environnement
```bash
# Copier le fichier d'exemple
cp env.example .env

# Éditer les variables d'environnement
nano .env
```

Variables d'environnement requises :
```env
# Serveur
PORT=3000
NODE_ENV=development

# Base de données
MONGODB_URI=mongodb://localhost:27017/lloyds-go

# JWT
JWT_SECRET=votre-secret-jwt-super-securise

# Rate Limiting
RATE_LIMIT_WINDOW_MS=900000
RATE_LIMIT_MAX_REQUESTS=100

# Logging
LOG_LEVEL=info
```

### 3. Installation des dépendances
```bash
# Backend
npm install

# Frontend
cd frontend
npm install
cd ..
```

### 4. Démarrage de MongoDB
```bash
# Avec Docker
docker run -d -p 27017:27017 --name mongodb mongo:latest

# Ou avec MongoDB installé localement
mongod
```

### 5. Lancement de l'application

#### Mode développement
```bash
# Terminal 1 - Backend
npm run dev

# Terminal 2 - Frontend
cd frontend
npm start
```

#### Mode production
```bash
# Build du frontend
cd frontend
npm run build
cd ..

# Démarrage en production
npm start
```

## 🏗️ Structure du Projet

```
lloyds-go/
├── config/                 # Configuration
│   └── database.js        # Connexion MongoDB
├── middleware/            # Middlewares Express
│   ├── auth.js           # Authentification
│   └── errorHandler.js   # Gestion d'erreurs
├── models/               # Modèles Mongoose
│   ├── User.js          # Modèle utilisateur
│   ├── Transaction.js   # Modèle transaction
│   └── CryptoBalance.js # Modèle solde crypto
├── routes/               # Routes API
│   ├── auth.js          # Authentification
│   ├── users.js         # Gestion utilisateurs
│   ├── banking.js       # Services bancaires
│   ├── crypto.js        # Services crypto
│   └── transactions.js  # Gestion transactions
├── utils/               # Utilitaires
│   └── logger.js        # Système de logs
├── frontend/            # Application React
│   ├── public/          # Fichiers publics
│   ├── src/             # Code source
│   │   ├── components/  # Composants React
│   │   ├── contexts/    # Contextes React
│   │   ├── pages/       # Pages de l'application
│   │   ├── services/    # Services API
│   │   └── styles/      # Styles CSS
│   └── package.json     # Dépendances frontend
├── server.js            # Point d'entrée serveur
├── package.json         # Dépendances backend
└── README.md           # Documentation
```

## 🔌 API Endpoints

### Authentification
- `POST /api/auth/register` - Inscription
- `POST /api/auth/login` - Connexion
- `POST /api/auth/logout` - Déconnexion
- `POST /api/auth/refresh` - Rafraîchissement token
- `GET /api/auth/verify` - Vérification token

### Utilisateurs
- `GET /api/users/profile` - Profil utilisateur
- `PUT /api/users/profile` - Mise à jour profil
- `PUT /api/users/change-password` - Changement mot de passe
- `GET /api/users/balance` - Solde du compte

### Services Bancaires
- `POST /api/banking/transfer` - Effectuer un virement
- `POST /api/banking/deposit` - Effectuer un dépôt
- `POST /api/banking/withdrawal` - Effectuer un retrait
- `GET /api/banking/transactions` - Historique transactions
- `GET /api/banking/stats` - Statistiques bancaires
- `GET /api/banking/rib` - RIB

### Cryptomonnaies
- `GET /api/crypto/prices` - Prix des cryptomonnaies
- `GET /api/crypto/portfolio` - Portefeuille crypto
- `POST /api/crypto/buy` - Acheter des cryptomonnaies
- `POST /api/crypto/sell` - Vendre des cryptomonnaies
- `GET /api/crypto/stats` - Statistiques crypto

### Transactions
- `GET /api/transactions` - Toutes les transactions
- `GET /api/transactions/stats/summary` - Statistiques
- `GET /api/transactions/recent/:limit` - Transactions récentes

## 🎨 Interface Utilisateur

### Pages Principales
- **Dashboard** : Vue d'ensemble des finances
- **Banking** : Services bancaires traditionnels
- **Crypto** : Gestion des cryptomonnaies
- **Transactions** : Historique détaillé
- **Profile** : Gestion du compte utilisateur
- **Admin** : Interface d'administration (admin seulement)

### Composants UI
- **Cartes** : Affichage des informations
- **Formulaires** : Saisie des données
- **Tableaux** : Listes de données
- **Graphiques** : Visualisations
- **Modales** : Interactions utilisateur
- **Notifications** : Retours utilisateur

## 🔒 Sécurité

### Authentification
- Tokens JWT avec expiration
- Refresh tokens automatiques
- Hashage bcrypt des mots de passe
- Validation des données d'entrée

### Protection
- Rate limiting par IP
- Headers de sécurité (Helmet)
- Validation CORS stricte
- Protection XSS et CSRF

### Base de Données
- Validation Mongoose
- Indexation des champs critiques
- Sanitisation des données

## 📊 Base de Données

### Collections MongoDB
- **users** : Informations utilisateurs
- **transactions** : Historique des transactions
- **cryptobalances** : Soldes cryptomonnaies

### Indexes
- Email utilisateur (unique)
- Numéro de compte (unique)
- Dates de transactions
- Types de transactions

## 🚀 Déploiement

### Heroku
```bash
# Configuration Heroku
heroku create lloyds-go-app
heroku config:set NODE_ENV=production
heroku config:set MONGODB_URI=votre-uri-mongodb
heroku config:set JWT_SECRET=votre-secret-jwt

# Déploiement
git push heroku main
```

### Docker
```bash
# Build de l'image
docker build -t lloyds-go .

# Lancement du conteneur
docker run -p 3000:3000 lloyds-go
```

### Vercel (Frontend)
```bash
# Installation Vercel CLI
npm i -g vercel

# Déploiement
cd frontend
vercel
```

## 🧪 Tests

### Tests Backend
```bash
npm test
```

### Tests Frontend
```bash
cd frontend
npm test
```

### Tests E2E
```bash
npm run test:e2e
```

## 📈 Monitoring

### Logs
- Winston pour la journalisation
- Niveaux de log configurables
- Rotation des fichiers de logs

### Métriques
- Temps de réponse API
- Taux d'erreur
- Utilisation des ressources

## 🤝 Contribution

1. Fork le projet
2. Créer une branche feature (`git checkout -b feature/AmazingFeature`)
3. Commit les changements (`git commit -m 'Add some AmazingFeature'`)
4. Push vers la branche (`git push origin feature/AmazingFeature`)
5. Ouvrir une Pull Request

## 📝 Licence

Ce projet est sous licence MIT. Voir le fichier `LICENSE` pour plus de détails.

## 🆘 Support

Pour toute question ou problème :
- Ouvrir une issue sur GitHub
- Contacter l'équipe de développement
- Consulter la documentation technique

## 🔮 Roadmap

### Fonctionnalités Futures
- [ ] Authentification à deux facteurs (2FA)
- [ ] Notifications push
- [ ] Intégration Apple Pay / Google Pay
- [ ] Trading automatisé
- [ ] Analyse prédictive
- [ ] Support multi-devises
- [ ] API publique
- [ ] Intégration DeFi

### Améliorations Techniques
- [ ] Cache Redis
- [ ] Microservices
- [ ] GraphQL
- [ ] Tests automatisés
- [ ] CI/CD pipeline
- [ ] Monitoring avancé

---

**Lloyds GO!** - Votre banque du futur, aujourd'hui. 🚀


# 📊 Page Administrateur de Gestion des Soldes - Lloyd's GO!

## 🎯 Description

La page `admin-balance.html` est une interface d'administration avancée permettant aux gestionnaires et créateurs de Lloyd's GO! de modifier en temps réel tous les soldes des comptes utilisateurs. Cette page est synchronisée avec le dashboard principal pour assurer une mise à jour instantanée.

## 🔐 Accès et Sécurité

### Accès Restreint
- **Utilisateurs autorisés** : Gestionnaires et créateurs uniquement
- **URL** : `admin-balance.html`
- **Authentification** : Basée sur le système d'utilisateurs existant

### Sécurité
- Validation des montants avant application
- Confirmation pour les actions critiques
- Logs de toutes les modifications
- Sauvegarde automatique des données

## 🚀 Fonctionnalités Principales

### 1. 📈 Tableau de Bord Statistiques
- **Utilisateurs totaux** : Nombre d'utilisateurs enregistrés
- **Solde total** : Somme de tous les soldes EUR
- **Solde moyen** : Moyenne des soldes par utilisateur
- **Dernière mise à jour** : Timestamp de la dernière modification

### 2. ⚡ Actions en Masse
Permet de modifier simultanément les soldes de tous les utilisateurs :

#### Types d'Actions :
- **Ajouter un montant** : Ajoute le montant spécifié
- **Soustraire un montant** : Retire le montant spécifié
- **Multiplier par** : Multiplie le solde actuel par le facteur
- **Définir à** : Remplace le solde par le montant exact

#### Devises Supportées :
- 💶 **EUR** (Euro)
- 💵 **USD** (Dollar US)
- ₿ **BTC** (Bitcoin)
- Ξ **ETH** (Ethereum)

### 3. 👥 Gestion Individuelle des Utilisateurs
Pour chaque utilisateur, vous pouvez :

#### Modifier les Soldes :
- Champs de saisie en temps réel pour chaque devise
- Validation automatique des montants
- Indicateurs visuels des modifications
- Sauvegarde individuelle ou en masse

#### Actions Disponibles :
- **💾 Sauvegarder** : Applique les modifications
- **🔄 Reset** : Remet tous les soldes à zéro
- **Recherche** : Filtre les utilisateurs par nom/email

### 4. 🔄 Synchronisation en Temps Réel
- **Mise à jour instantanée** : Les modifications apparaissent immédiatement
- **Synchronisation cross-tab** : Fonctionne entre plusieurs onglets
- **Indicateur de statut** : Affiche l'état de la synchronisation
- **Logs en temps réel** : Console du navigateur

## 🛠️ Utilisation

### Première Utilisation
1. Ouvrir `admin-balance.html` dans le navigateur
2. Les soldes sont automatiquement initialisés à 0 pour tous les utilisateurs
3. Un utilisateur de démonstration est créé avec des soldes d'exemple

### Modification des Soldes

#### Méthode 1 : Modification Individuelle
1. Localiser l'utilisateur dans le tableau
2. Modifier directement les valeurs dans les champs de saisie
3. Cliquer sur "💾 Sauvegarder" pour appliquer les changements
4. Les modifications apparaissent instantanément dans le dashboard principal

#### Méthode 2 : Actions en Masse
1. Sélectionner le type d'action dans le menu déroulant
2. Entrer le montant à appliquer
3. Choisir la devise concernée
4. Cliquer sur "✅ Appliquer à tous"
5. Confirmer l'action si demandé

### Export et Import
- **📥 Exporter** : Sauvegarde tous les soldes dans un fichier JSON
- **📤 Importer** : Restaure les soldes depuis un fichier JSON
- **Format** : JSON avec métadonnées (date, version, etc.)

## 🔧 Configuration Technique

### Fichiers Requis
```
admin-balance.html          # Page principale
js/balanceManager.js        # Gestionnaire de soldes
js/userManager.js          # Gestionnaire d'utilisateurs
```

### Dépendances
- **localStorage** : Stockage local des données
- **Custom Events** : Communication entre pages
- **JSON** : Format d'échange des données

### Synchronisation
```javascript
// Événement de mise à jour
window.addEventListener('balanceUpdate', (e) => {
    // Traitement de la mise à jour
});

// Stockage cross-tab
localStorage.setItem('lloyds_balance_sync', JSON.stringify(data));
```

## 📊 Structure des Données

### Format des Soldes
```json
{
  "balances": {
    "1": {
      "EUR": 15000.50,
      "USD": 17850.75,
      "BTC": 0.25,
      "ETH": 3.75,
      "lastUpdate": 1640995200000
    }
  },
  "lastUpdate": 1640995200000,
  "totalBalance": 32850.25,
  "averageBalance": 16425.125
}
```

### Validation des Montants
- **EUR/USD** : 0 à 1,000,000
- **BTC** : 0 à 100
- **ETH** : 0 à 10,000
- **Précision** : 2 décimales pour EUR/USD, 8 pour crypto

## 🚨 Actions Critiques

### Réinitialisation
- **Utilisateur individuel** : Remet tous les soldes à 0
- **Tous les utilisateurs** : Confirmation double requise
- **Irréversible** : Aucune récupération possible

### Sauvegarde
- **Automatique** : À chaque modification
- **Manuelle** : Export JSON
- **Récupération** : Import depuis fichier

## 🔍 Dépannage

### Problèmes Courants

#### Synchronisation ne fonctionne pas
1. Vérifier que les deux pages sont ouvertes
2. Actualiser la page de destination
3. Vérifier la console pour les erreurs

#### Modifications non sauvegardées
1. Vérifier le localStorage du navigateur
2. S'assurer que les scripts sont chargés
3. Vérifier les permissions du navigateur

#### Erreurs de validation
1. Vérifier les limites de montants
2. S'assurer que les valeurs sont numériques
3. Vérifier le format des devises

### Logs de Débogage
```javascript
// Afficher les soldes dans la console
showBalances();

// Forcer une mise à jour
forceUpdateBalances();

// Vérifier la synchronisation
console.log(balanceManager.balances);
```

## 📱 Compatibilité

### Navigateurs Supportés
- ✅ Chrome 80+
- ✅ Firefox 75+
- ✅ Safari 13+
- ✅ Edge 80+

### Fonctionnalités Requises
- **localStorage** : Stockage local
- **Custom Events** : Communication
- **JSON** : Parsing et stringification
- **ES6+** : Classes et modules

## 🔄 Mise à Jour

### Version 1.0
- ✅ Gestion complète des soldes
- ✅ Synchronisation en temps réel
- ✅ Actions en masse
- ✅ Export/Import
- ✅ Interface responsive

### Versions Futures
- 📋 Historique des modifications
- 🔐 Authentification renforcée
- 📊 Graphiques de tendances
- 🔔 Notifications push
- 📱 Application mobile

## 📞 Support

Pour toute question ou problème :
- **Email** : support@lloydbanq.pro
- **Documentation** : Ce fichier README
- **Console** : Logs détaillés dans le navigateur

---

**⚠️ Attention** : Cette interface permet de modifier directement les soldes des utilisateurs. Utilisez-la avec précaution et toujours après validation des modifications.

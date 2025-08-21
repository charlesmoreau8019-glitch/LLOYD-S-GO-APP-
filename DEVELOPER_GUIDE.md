# GUIDE DÉVELOPPEUR - ALGORITHME DE GESTION DES SOLDES

## 🚀 DÉMARRAGE RAPIDE

### 1. Vérifier que l'algorithme est chargé
```javascript
// Dans la console du navigateur
console.log(BalanceAlgorithm); // Doit afficher l'objet avec toutes les fonctions
```

### 2. Vérifier la base actuelle
```javascript
// Toujours commencer par vérifier la base actuelle
BalanceAlgorithm.checkCurrentBase();
```

### 3. Utiliser l'algorithme de développement
```javascript
// Pour toute nouvelle modification, utiliser developmentAlgorithm
BalanceAlgorithm.developmentAlgorithm(currentBase => {
    // Votre logique ici
    return {
        mainBalance: currentBase.mainBalance + 100,
        portfolioBalance: currentBase.portfolioBalance,
        bankingBalance: currentBase.bankingBalance,
        stakingBalance: currentBase.stakingBalance
    };
});
```

## 📋 EXEMPLES PRATIQUES

### Exemple 1: Ajouter de l'argent au solde principal
```javascript
// Ajouter 500€ au solde principal
BalanceAlgorithm.addToMainBalance(500);
```

### Exemple 2: Acheter du Bitcoin
```javascript
// Acheter 0.001 BTC à 35,000€
BalanceAlgorithm.buyBitcoin(0.001, 35000);
```

### Exemple 3: Effectuer un dépôt bancaire
```javascript
// Déposer 1000€ sur le compte bancaire
BalanceAlgorithm.depositToBank(1000);
```

### Exemple 4: Modification personnalisée
```javascript
// Exemple: Augmenter tous les soldes de 10%
BalanceAlgorithm.developmentAlgorithm(currentBase => {
    return {
        mainBalance: currentBase.mainBalance * 1.1,
        portfolioBalance: currentBase.portfolioBalance * 1.1,
        bankingBalance: currentBase.bankingBalance * 1.1,
        stakingBalance: currentBase.stakingBalance * 1.1,
        cryptoBalances: {
            bitcoin: currentBase.cryptoBalances.bitcoin * 1.1,
            ethereum: currentBase.cryptoBalances.ethereum * 1.1,
            // ... autres cryptos
        }
    };
});
```

## 🔧 FONCTIONS UTILITAIRES

### Obtenir un solde spécifique
```javascript
// Solde principal
const mainBalance = BalanceAlgorithm.getCurrentBalance('mainBalance');

// Solde Bitcoin
const btcBalance = BalanceAlgorithm.getCurrentBalance('cryptoBalances', 'bitcoin');
```

### Mettre à jour un solde
```javascript
// Mettre à jour le solde principal
BalanceAlgorithm.updateBalance('mainBalance', 1000);

// Mettre à jour le solde Bitcoin
BalanceAlgorithm.updateBalance('cryptoBalances', 0.001, 'bitcoin');
```

### Calculer des totaux
```javascript
// Total de tous les soldes
const totalBalance = BalanceAlgorithm.calculateTotalBalance();

// Total des soldes crypto
const totalCrypto = BalanceAlgorithm.calculateTotalCryptoBalance();
```

## 🚫 CE QU'IL NE FAUT JAMAIS FAIRE

### ❌ Interdit - Valeurs codées en dur
```javascript
// JAMAIS faire ça
balanceAmount.textContent = '€20,320.50';
mainBalanceAmount.textContent = '€50,795.37';
```

### ❌ Interdit - Modifications directes
```javascript
// JAMAIS faire ça
document.getElementById('balanceAmount').textContent = '€100.00';
```

### ❌ Interdit - Calculs avec valeurs fictives
```javascript
// JAMAIS faire ça
let total = 50795.37 + 20320.50;
```

## ✅ CE QU'IL FAUT TOUJOURS FAIRE

### ✅ Correct - Utiliser l'algorithme
```javascript
// TOUJOURS faire ça
BalanceAlgorithm.developmentAlgorithm(currentBase => {
    return {
        mainBalance: currentBase.mainBalance + 100,
        // ... autres soldes
    };
});
```

### ✅ Correct - Lire depuis ZeroBalanceManager
```javascript
// TOUJOURS faire ça
const balance = BalanceAlgorithm.getCurrentBalance('mainBalance');
```

### ✅ Correct - Mettre à jour via l'algorithme
```javascript
// TOUJOURS faire ça
BalanceAlgorithm.updateBalance('mainBalance', newValue);
```

## 🔍 VALIDATION ET DÉBOGAGE

### Vérifier qu'aucune valeur fictive n'est utilisée
```javascript
// Vérification de sécurité
BalanceAlgorithm.validateNoFictitiousValues();
```

### Réinitialiser tous les soldes à zéro
```javascript
// En cas de problème
BalanceAlgorithm.resetAllBalancesToZero();
```

### Vérifier la cohérence
```javascript
// Après toute modification
BalanceAlgorithm.verifyConsistency();
```

## 📝 CHECKLIST DE DÉVELOPPEMENT

### Avant de commencer
- [ ] Vérifier que `BalanceAlgorithm` est disponible
- [ ] Lire la base actuelle avec `checkCurrentBase()`
- [ ] Planifier les modifications basées sur les valeurs actuelles

### Pendant le développement
- [ ] Utiliser `developmentAlgorithm()` pour toute modification
- [ ] Ne jamais coder de valeurs en dur
- [ ] Toujours calculer à partir des soldes actuels

### Après le développement
- [ ] Vérifier la cohérence avec `verifyConsistency()`
- [ ] Valider qu'aucune valeur fictive n'est présente
- [ ] Tester avec différents scénarios

## 🎯 PATRON DE DÉVELOPPEMENT RECOMMANDÉ

```javascript
// PATRON RECOMMANDÉ pour toute nouvelle fonctionnalité

function maNouvelleFonctionnalite(parametres) {
    return BalanceAlgorithm.developmentAlgorithm(currentBase => {
        // 1. Analyser la base actuelle
        console.log('Base actuelle:', currentBase);
        
        // 2. Calculer les nouvelles valeurs
        const nouvellesValeurs = {
            mainBalance: currentBase.mainBalance + parametres.montant,
            portfolioBalance: currentBase.portfolioBalance,
            bankingBalance: currentBase.bankingBalance,
            stakingBalance: currentBase.stakingBalance
        };
        
        // 3. Retourner les nouvelles valeurs
        return nouvellesValeurs;
    });
}

// Utilisation
maNouvelleFonctionnalite({ montant: 500 });
```

## 🆘 DÉPANNAGE

### Problème: BalanceAlgorithm non défini
```javascript
// Solution: Vérifier que le fichier js/balanceAlgorithm.js est chargé
console.log(typeof BalanceAlgorithm); // Doit retourner "object"
```

### Problème: ZeroBalanceManager non initialisé
```javascript
// Solution: Attendre que le système soit initialisé
setTimeout(() => {
    BalanceAlgorithm.checkCurrentBase();
}, 1000);
```

### Problème: Valeurs fictives détectées
```javascript
// Solution: Réinitialiser et recommencer
BalanceAlgorithm.resetAllBalancesToZero();
BalanceAlgorithm.validateNoFictitiousValues();
```

## 📞 SUPPORT

En cas de problème ou de question :
1. Vérifier la console du navigateur pour les erreurs
2. Utiliser `BalanceAlgorithm.checkCurrentBase()` pour diagnostiquer
3. Consulter la documentation complète dans `BALANCE_ALGORITHM.md`
4. Suivre le patron de développement recommandé

**RAPPEL: TOUTE NOUVELLE MODIFICATION DOIT UTILISER CET ALGORITHME !**

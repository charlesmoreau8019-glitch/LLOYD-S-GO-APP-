# 🧪 Test du Fonctionnement Cloud - Lloyds GO!

## ✅ Vérification du Déploiement

### 1. **Test de l'API Backend**

#### Test de Santé
```bash
curl https://votre-site.netlify.app/.netlify/functions/api/api/health
```

**Réponse attendue :**
```json
{
  "status": "OK",
  "timestamp": "2024-01-01T12:00:00.000Z",
  "uptime": 123.456,
  "environment": "production"
}
```

#### Test d'Inscription
```bash
curl -X POST https://votre-site.netlify.app/.netlify/functions/api/api/auth/register \
  -H "Content-Type: application/json" \
  -d '{
    "firstName": "Test",
    "lastName": "User",
    "email": "test@example.com",
    "password": "password123"
  }'
```

**Réponse attendue :**
```json
{
  "success": true,
  "message": "Utilisateur créé avec succès",
  "user": {
    "id": "uuid",
    "firstName": "Test",
    "lastName": "User",
    "email": "test@example.com"
  }
}
```

### 2. **Test de l'Interface Web**

#### Test de Navigation
1. Ouvrir votre site Netlify
2. Vérifier que la page se charge correctement
3. Tester la responsivité mobile
4. Vérifier les liens de navigation

#### Test d'Authentification
1. Cliquer sur "S'inscrire"
2. Remplir le formulaire d'inscription
3. Vérifier la création du compte
4. Se déconnecter et se reconnecter

#### Test des Fonctionnalités Crypto
1. Aller dans la section Crypto
2. Vérifier l'affichage des prix
3. Tester l'achat/vente de crypto
4. Vérifier la mise à jour des soldes

### 3. **Test de la Gestion des Soldes**

#### Test Admin
1. Aller sur `/admin-balance.html`
2. Vérifier l'affichage des utilisateurs
3. Modifier un solde
4. Sauvegarder les modifications

#### Test de Synchronisation
1. Modifier un solde dans l'admin
2. Vérifier la mise à jour dans le dashboard
3. Tester la synchronisation cross-tab

## 🔍 Vérifications Techniques

### 1. **Logs Netlify**
```bash
# Voir les logs des fonctions
netlify functions:list
netlify functions:invoke api --no-identity

# Logs du site
netlify logs
```

### 2. **Variables d'Environnement**
Vérifier dans Netlify Dashboard > Site settings > Environment variables :
- `JWT_SECRET` est configuré
- `NODE_ENV=production`
- `COINGECKO_API_URL` est correct

### 3. **Performance**
- Temps de chargement < 3 secondes
- API responses < 1 seconde
- Pas d'erreurs dans la console

## 🚨 Problèmes Courants

### Erreur 404 sur les API
**Cause :** Netlify Functions non déployées
**Solution :**
1. Vérifier le fichier `netlify.toml`
2. Redéployer avec `netlify deploy --prod`
3. Vérifier les logs de build

### Erreur CORS
**Cause :** Origines non autorisées
**Solution :**
1. Vérifier `ALLOWED_ORIGINS` dans les variables d'environnement
2. Ajouter votre domaine Netlify à la liste

### Erreur d'Authentification
**Cause :** JWT_SECRET mal configuré
**Solution :**
1. Vérifier la variable `JWT_SECRET`
2. Régénérer une nouvelle clé si nécessaire

### Prix Crypto non mis à jour
**Cause :** API externe non accessible
**Solution :**
1. Vérifier la connectivité internet
2. Contrôler les limites de l'API CryptoGecko
3. Vérifier les logs d'erreur

## 📊 Métriques de Succès

### Fonctionnalités Essentielles
- ✅ Site accessible en HTTPS
- ✅ Inscription/connexion fonctionnelle
- ✅ Gestion des soldes opérationnelle
- ✅ Prix crypto en temps réel
- ✅ Interface responsive

### Performance
- ✅ Temps de chargement < 3s
- ✅ API responses < 1s
- ✅ Pas d'erreurs console
- ✅ Synchronisation temps réel

### Sécurité
- ✅ HTTPS automatique
- ✅ JWT tokens sécurisés
- ✅ Rate limiting actif
- ✅ CORS configuré

## 🎯 Checklist de Validation

- [ ] Site déployé sur Netlify
- [ ] Variables d'environnement configurées
- [ ] API backend fonctionnelle
- [ ] Interface web responsive
- [ ] Authentification opérationnelle
- [ ] Gestion des soldes fonctionnelle
- [ ] Prix crypto mis à jour
- [ ] Synchronisation temps réel
- [ ] Tests de sécurité passés
- [ ] Performance optimale

## 📞 Support

Si vous rencontrez des problèmes :

1. **Vérifier les logs Netlify**
2. **Tester en mode développement local**
3. **Consulter la documentation Netlify**
4. **Vérifier les variables d'environnement**

---

**Lloyds GO!** - Application bancaire et crypto moderne 🚀

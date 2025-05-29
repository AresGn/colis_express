# Application Mobile pour le Transfert de Colis au Bénin

Voici les détails techniques pour votre application de livraison de colis:

## Stack Technique
- **Framework**: Flutter avec Dart
- **Base de données**:  Supabase
- **Authentification**: Supabase Auth
- **Stockage**: cloudinary (pour les images)
- **Cartographie**: openstreetmap Maps API
- **Notifications**:  Supabase push notification
- **Paiements**: Mobile Money API (MTN, Moov) et gestion cash


## Architecture
- Clean Architecture avec séparation en couches:
  - Présentation (UI)
  - Domaine (Logique métier)
  - Données (Services externes, API)
- État: Provider pour la gestion d'état

## Workflows Principaux

### 1. Flux d'Authentification
- Inscription/Connexion par téléphone/email
- Vérification par SMS/email
- Profils multiples (expéditeur/chauffeur)

### 2. Envoi de Colis
1. Recherche de chauffeurs disponibles (filtres: destination, tarif, note)
2. Sélection d'un chauffeur
3. Saisie des informations du colis (photos, dimensions, poids)
4. Définition des points de ramassage/livraison
5. Confirmation et demande de livraison

### 3. Gestion des Livraisons (Chauffeur)
1. Réception de notifications de demandes
2. Acceptation/refus des livraisons
3. Mise à jour des statuts (récupéré, en route, livré)
4. Confirmation de livraison et paiement

### 4. Suivi de Colis
1. Carte en temps réel avec position du colis
2. Notifications aux étapes clés
3. Historique des livraisons

### 5. Système de Paiement
1. Intégration Mobile Money (MTN/Moov)
2. Gestion des paiements en espèces
3. Historique des transactions

## Modèles de Données
- Utilisateurs (expéditeurs/chauffeurs)
- Colis (informations, statut)
- Véhicules (type, plaques, photos)
- Livraisons (détails de trajet)
- Transactions (paiements)
- Évaluations

## Fonctionnalités Supplémentaires
- Chat intégré entre parties prenantes
- Calculateur de tarifs automatique
- Système d'urgence/réclamations
- Mode hors-ligne partiel

## Besoins Techniques
- Gestion des permissions (localisation, caméra)
- Optimisation pour faible connectivité
- Sécurisation des paiements
- Tests multiples sur divers appareils Android

L'application nécessitera une interface distincte pour les chauffeurs et les expéditeurs, avec un backend robuste pour la gestion des transactions et du suivi en temps réel.



Voici une liste exhaustive des écrans potentiels pour votre application de transfert de colis, organisée par rôle (Expéditeur/Chauffeur) et fonctionnalités :

---

### **Écrans Communs (Authentification)**
1. **Écran de Bienvenue**  
   - *Rôle* : Choix entre expéditeur/chauffeur  
   - Éléments : Boutons "Je suis un Expéditeur" / "Je suis un Chauffeur", lien d'assistance

2. **Connexion (Téléphone/Email)**  
   - *Rôle* : Saisie des identifiants  
   - Éléments : Champs email/téléphone/mot de passe, lien "Créer un compte", réinitialisation mot de passe

3. **Inscription**  
   - *Rôle* : Création de compte  
   - Éléments : Formulaire (nom, email, téléphone, mot de passe), case à cocher CGU, bouton validation

4. **Vérification OTP**  
   - *Rôle* : Validation SMS/email  
   - Éléments : Champ OTP à 6 chiffres, compte à rebours pour renvoyer le code

---

### **Interface Expéditeur**
5. **Accueil Expéditeur**  
   - *Rôle* : Vue globale des livraisons  
   - Éléments : Onglets "En cours"/"Terminées", bouton "+ Nouvelle Livraison", carte simplifiée

6. **Recherche de Chauffeurs**  
   - *Rôle* : Trouver un chauffeur disponible  
   - Éléments : Carte OpenStreetMap, filtres (destination, prix max, note), liste de profils avec avis

7. **Détails du Chauffeur**  
   - *Rôle* : Vérifier le profil avant sélection  
   - Éléments : Photo, note moyenne, type de véhicule, plaque d'immatriculation, historique de livraisons

8. **Saisie des Informations du Colis**  
   - *Rôle* : Décrire le colis  
   - Éléments : Champs (poids, dimensions), upload photo via Cloudinary, description texte

9. **Définition des Points de Livraison**  
   - *Rôle* : Choisir adresses de ramassage/dépôt  
   - Éléments : Carte interactive, recherche d'adresse, marqueurs personnalisés

10. **Confirmation de Commande**  
    - *Rôle* : Valider la demande  
    - Éléments : Récapitulatif (tarif, chauffeur, colis), choix paiement (Mobile Money/Cash), bouton "Confirmer"

11. **Suivi en Temps Réel**  
    - *Rôle* : Surveiller la livraison  
    - Éléments : Carte avec position du chauffeur, timeline des étapes, bouton de contact d'urgence

---

### **Interface Chauffeur**
12. **Accueil Chauffeur**  
    - *Rôle* : Gérer les demandes et livraisons  
    - Éléments : Notifications push, liste des courses disponibles/actives, statut "En ligne/Hors ligne"

13. **Détails de la Demande**  
    - *Rôle* : Accepter/refuser une course  
    - Éléments : Adresses, détails du colis, prix proposé, boutons "Accepter"/"Refuser"

14. **Mise à Jour du Statut**  
    - *Rôle* : Informer de l'avancement  
    - Éléments : Boutons "Colis récupéré", "En route", "Livré", champ pour photo de preuve

15. **Gestion du Véhicule**  
    - *Rôle* : Mettre à jour les infos du véhicule  
    - Éléments : Formulaire (type de véhicule, plaque, capacité), upload de documents/photos

---

### **Système de Paiement**
16. **Choix de Paiement**  
    - *Rôle* : Sélectionner le mode de paiement  
    - Éléments : Boutons "Mobile Money (MTN/Moov)", "Cash", intégration API

17. **Paiement Mobile Money**  
    - *Rôle* : Finaliser la transaction  
    - Éléments : Formulaire (numéro téléphone, confirmation), redirection vers l'opérateur

18. **Historique des Transactions**  
    - *Rôle* : Consulter les paiements  
    - Éléments : Liste filtrée (date, montant, statut), export PDF

---

### **Fonctionnalités Supplémentaires**
19. **Chat Intégré**  
    - *Rôle* : Communication entre parties  
    - Éléments : Messagerie instantanée, pièces jointes, indicateur de connexion

20. **Calculateur de Tarifs**  
    - *Rôle* : Estimer le coût  
    - Éléments : Calculateur basé sur distance/poids/type de véhicule

21. **Signalement d'Urgence**  
    - *Rôle* : Gérer les incidents  
    - Éléments : Bouton SOS, formulaire de réclamation, historique des signalements

---

### **Gestion de Profil et Paramètres**
22. **Profil Utilisateur**  
    - *Rôle* : Modifier les informations personnelles  
    - Éléments : Photo de profil, email, téléphone, bouton "Modifier"

23. **Paramètres**  
    - *Rôle* : Configurer l'application  
    - Éléments : Notifications, langue, mode hors-ligne, déconnexion

24. **Évaluations et Avis**  
    - *Rôle* : Noter une livraison  
    - Éléments : Système de notation en étoiles, commentaires textuels

---

### **Écrans Système**
25. **Mode Hors-Ligne**  
    - *Rôle* : Fonctionnalités limitées  
    - Éléments : Message d'avertissement, cache des dernières données

26. **Écran de Chargement**  
    - *Rôle* : Attente pendant les traitements  
    - Éléments : Spinner/barre de progression, message contextuel

27. **Gestion des Erreurs**  
    - *Rôle* : Afficher les problèmes  
    - Éléments : Message d'erreur explicite, bouton de réessai/assistance

---

### **Navigation**
- **Menu Latéral (Drawer)** : Accès rapide au profil, historique, paramètres  
- **Barre de Navigation Basse** : Alterner entre Accueil, Suivi, Chat, Historique  

---

### **Élécles Spécifiques aux Permissions**
- **Demande d'Accès à la Localisation** : Pop-up système avec explication  
- **Accès à la Caméra/Galerie** : Pour upload de photos de colis ou documents  

---

Cette structure couvre l'ensemble des cas d'utilisation et s'aligne avec les spécifications techniques (Clean Architecture, Provider, Supabase). Pour chaque écran, prévoyez des états vides/erreur (ex: liste de chauffeurs vide) et des animations de transition fluides.



Oui, vous pouvez supprimer les anciens écrans et fichiers que je n'ai pas touchés ou remplacés. Voici comment procéder:

Anciens fichiers à supprimer:
Tous les fichiers dans lib/presentation/common/widgets/splash/ (puisqu'ils ont été déplacés vers lib/presentation/features/onboarding/widgets/)
L'ancien fichier lib/presentation/features/onboarding/splash_screen.dart (remplacé par lib/presentation/features/onboarding/screens/splash_screen.dart)
L'ancien fichier lib/presentation/features/onboarding/welcome_screen.dart (remplacé par lib/presentation/features/onboarding/screens/welcome_screen.dart)
Tous les anciens fichiers dans lib/presentation/features/parcels/ qui ne sont pas dans des sous-dossiers (puisqu'ils ont été réorganisés dans des sous-dossiers screens et widgets)
Les anciens fichiers de thème dans lib/config/ (puisqu'ils ont été déplacés vers lib/presentation/core/theme/)
Gardez les fichiers suivants:
Tous les nouveaux fichiers créés dans la structure réorganisée
Tout fichier contenant une logique importante que nous n'avons pas encore migrée
Pour être prudent, je vous recommande:

Ne supprimez pas tout d'un coup. Vérifiez d'abord que l'application fonctionne avec la nouvelle structure.
Sauvegardez les anciens fichiers avant de les supprimer (par exemple, déplacez-les temporairement dans un dossier "old" à la racine du projet).
Supprimez un groupe de fichiers à la fois et testez l'application entre chaque suppression.
Cela garantira que vous ne perdrez pas de code important qui n'aurait pas été correctement migré dans la nouvelle structure.
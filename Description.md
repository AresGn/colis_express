# Application Mobile pour le Transfert de Colis au Bénin

Voici les détails techniques pour votre application de livraison de colis:

## Stack Technique
- **Framework**: Flutter avec Dart
- **Base de données**: Firebase Firestore
- **Authentification**: Firebase Auth
- **Stockage**: Firebase Storage (pour les images)
- **Cartographie**: Google Maps API
- **Notifications**: Firebase Cloud Messaging
- **Paiements**: Mobile Money API (MTN, Moov) et gestion cash

## Packages Flutter Essentiels
```
firebase_core
firebase_auth
cloud_firestore
firebase_storage
google_maps_flutter
geolocator
flutter_polyline_points
provider
get_it: 
http: 
image_picker: 
flutter_local_notifications: 
firebase_messaging: 
intl: 
cached_network_image: 
flutter_rating_bar: 
```

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
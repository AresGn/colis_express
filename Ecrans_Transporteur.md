# 📱 Détail de l'écran : MVP\_transporteur-collecte (Collecte du colis)

## 🧭 Objectif

Permettre au transporteur de consulter les détails d'une commande à collecter, puis confirmer ou signaler un problème.

---

## 🧱 Structure Générale

* L’écran est de type **scrollable vertical** avec structure en colonnes.
* **Fond principal** : `#F8FAFC` (gris clair très doux)
* Les composants sont séparés visuellement par des **cartes blanches** avec ombrage léger (`box-shadow`) et des **coins arrondis** (`border-radius: 16px`)

---

## 🔝 En-tête (Header)

* **Fond dégradé** orange → `linear-gradient(135deg, #F59E0B 0%, #D97706 100%)`
* **Padding** : 20px vertical, 16px horizontal
* **Couleur du texte** : blanc

### ➕ Composants de l'en-tête :

* **Bouton Retour** (à gauche)

  * Style : fond blanc semi-transparent (`rgba(255,255,255,0.2)`), padding 8px, border-radius 8px
  * Icône : flèche vers la gauche (SVG, trait blanc)
* **Titre** : `Collecte du colis` (taille : 18px, gras)
* **Sous-texte** : `Confirmez la collecte du colis` (taille : 12px, opacité 0.9)

---

## 📦 Carte Commande

* **Fond** : blanc
* **Bordure arrondie** : `16px`
* **Ombre légère** : `0 2px 8px rgba(0, 0, 0, 0.05)`
* **Padding** : 16px

### 🧾 Informations affichées :

#### 📛 En-tête commande

* **Titre** : `Commande #CMD-789012`
* **Badge de statut** : `En attente de collecte`

  * Couleur fond : `#FEF3C7` (amber-100)
  * Texte : `#92400E` (amber-800), taille XS, arrondi full

#### 🧍 Point de collecte

* Icône : 📦 (`feather icon package`), fond `amber-100`, couleur icône `amber-600`
* Texte secondaire : `À collecter chez`
* Nom : `Jean Dupont`
* Adresse : `123 Rue du Commerce, Cotonou`
* Téléphone : `+229 12 34 56 78`

#### 📍 Point de livraison

* Icône : 📍 (`feather icon map-pin`), fond `green-100`, couleur icône `green-600`
* Texte secondaire : `À livrer à`
* Nom : `Marie Koné`
* Adresse : `456 Avenue des Cocotiers, Porto-Novo`
* Téléphone : `+229 87 65 43 21`

#### 📋 Détails colis

* Titre section : `Détails du colis`
* Bordure supérieure grise très claire : `#F3F4F6`
* Grille 2 colonnes avec :

  * Poids : `2.5 kg`
  * Dimensions : `30 x 20 x 15 cm`
  * Type : `Document`
  * Valeur déclarée : `25 000 FCFA`

---

## 📝 Instructions spéciales

* Fond blanc, coins arrondis `16px`, ombrage
* Titre : `Instructions spéciales`
* Contenu : `Fragile - À manipuler avec précaution. Le colis contient des documents importants.`

---

## ✅ Boutons d’action principaux

* Espace vertical entre eux : `12px`

### 🟡 Bouton 1 : Confirmer la collecte

* Couleur : `#F59E0B` → `hover:#D97706`
* Texte : blanc, gras, taille 16px
* Padding : 12-16px, arrondi `12px`
* Icône `check-circle` (feather), marge droite `8px`

### 🔴 Bouton 2 : Signaler un problème

* Bordure rouge `#EF4444`, texte rouge, `hover:bg-red-50`
* Padding : 12-16px, arrondi `12px`
* Icône `x-circle` (feather), marge droite `8px`

---

## ⬇️ Footer sticky (version alternative affichée en bas de scroll)

* Fond blanc, bordure top grise `#E5E7EB`
* Padding horizontal : 16px
* Bouton unique **"Confirmer la collecte"**

  * Vert `#10B981`, texte blanc, gras 600, taille 16px
  * Padding vertical 16px, coins `12px`, icône check

---

## 🧑‍💻 Notes de Développement Flutter

* Utiliser `SingleChildScrollView` pour scroll
* Utiliser `Container` avec `BoxDecoration` (shadow, borderRadius)
* Boutons : `ElevatedButton`, `OutlinedButton`, `IconButton` avec `Row`
* Icons : utiliser `flutter_feather_icons`
* Textes : attention aux `TextStyle` pour poids, taille, opacité
* Badge : `Container` avec `padding`, `background`, `borderRadius`, `Text` centré

---

## 📌 Conclusion

Cet écran de collecte est visuellement épuré, fonctionnel et simple. Il repose sur une hiérarchie claire : commande → adresses → détails → actions. Toutes les zones sont modulables et facilement transposables dans une interface Flutter avec des widgets standards personnalisés.


# 📱 Détail de l'écran : MVP\_transporteur-commandes (Nouvelles commandes)

## 🧭 Objectif

Afficher à un transporteur la liste des commandes disponibles, avec filtres rapides et actions (accepter/refuser).

---

## 🧱 Structure Générale

* Layout vertical scrollable (`SingleChildScrollView`)
* **Fond principal** : `#F8FAFC`
* Les cartes de commande sont bien séparées par des **conteneurs blancs arrondis** avec ombrage léger

---

## 🔝 En-tête (Header)

* Fond blanc, padding `16px`, bordure bas gris clair `#E5E7EB`
* **Disposition** : `Row` avec un `IconButton` retour + `Column` titre

### ➕ Composants :

* **Bouton retour** (icône flèche gauche, `#374151` foncé)
* **Titre** : `Nouvelles commandes` (taille 18px, gras, couleur `#1F2937`)
* **Sous-titre** : `3 commandes disponibles` (14px, gris `#6B7280`)

---

## 🔎 Filtres Rapides

* Contexte : Affichage horizontal (`Row` scrollable)
* **Style bouton** : `borderRadius: 20px`, `fontSize: 12px`, `fontWeight: 600`, padding 8-16px
* **Filtres disponibles** :

  * Toutes (3) → bouton vert `#008751`, texte blanc
  * Proximité (2) → fond gris clair `#F3F4F6`, texte gris foncé `#374151`
  * Urgent (1) → idem

---

## 📦 Cartes de commande

* **Conteneur** : `background: white`, `border-radius: 16px`, padding `20px`, `box-shadow` léger, `margin-bottom: 16px`
* **Effet hover** : `translateY(-2px)` + ombrage renforcé
* **Bord gauche coloré** selon type :

  * Rouge `#EF4444` (URGENT)
  * Bleu `#3B82F6` (STANDARD)
  * Jaune `#F59E0B` (EXPRESS)

### ✏️ Détails d'une carte

#### 🧾 En-tête commande

* Numéro commande : `#CE2024-XXX`, gras 700, taille 16px, `#1F2937`
* Badge : `URGENT`, `STANDARD`, `EXPRESS`

  * Couleur dynamique : fond + texte + `borderRadius: 12px`, padding 2px 8px, `fontSize: 10px`
* Temps : ex : `Il y a 5 minutes`, 12px, gris `#6B7280`

#### 💵 Commission

* Montant : `3200 FCFA`, vert `#10B981`, gras 700, taille 18px
* Légende : `Commission`, 12px gris `#6B7280`

#### 🗺️ Détails trajet

* Ligne départ/arrivée : `📍 Cotonou → Porto-Novo` + `• 45 km • 1h`
* Adresses : `Collecte: ...` `Livraison: ...` (indentation gauche 24px, gris clair, 13px)

#### ✅ Actions boutons

* Bouton **Refuser** :

  * Fond blanc, bordure grise `#E5E7EB`, texte gris `#6B7280`
  * Hover : bordure rouge `#EF4444`, texte rouge
* Bouton **Accepter** :

  * Dégradé vert : `linear-gradient(135deg, #10B981 → #34D399)`
  * Texte blanc, gras 600, arrondi 8px
  * Hover : ombre verte renforcée

---

## 🧑‍💻 Notes Flutter

* Filtres → `SingleChildScrollView(scrollDirection: Axis.horizontal)` + `Wrap` ou `Row`
* Commandes → `ListView.builder`
* Boutons → `OutlinedButton`, `ElevatedButton`, `Container` personnalisé pour badges
* Évènements `onPressed` à relier à logique backend ou simulation locale
* Ajouter `setState()` pour acceptation/refus

---

## 📌 Conclusion

L'écran offre une **UX directe et rapide**, avec hiérarchisation visuelle claire (badge de priorité, distance, commission). Tous les éléments sont **facilement transposables en Flutter**, et la logique de filtrage/action peut être implémentée efficacement grâce à des composants standards.


# 📱 Détail de l'écran : MVP\_transporteur-connexion (Authentification transporteur)

## 🧭 Objectif

Permettre à un transporteur de se connecter à l'application avec un numéro de téléphone et mot de passe, tout en indiquant son statut (en ligne ou hors ligne).

---

## 🧱 Structure Générale

* **Disposition verticale** (scrollable si nécessaire)
* **Fond principal** : dégradé vertical vert `linear-gradient(135deg, #008751 → #22C55E)`
* **Conteneur de formulaire** : `Container` blanc arrondi (radius `20px`), ombré, centré verticalement

---

## 🚚 En-tête Visuel Transporteur

* **Icône** dans encadré semi-transparent avec blur :

  * carré `80x80px`, fond `rgba(255,255,255,0.2)`
  * icône emoji camion `🚛`, centré, taille 32px
* **Titre** : `Espace Transporteur`, taille `24px`, gras 700, blanc, effet d’ombre (`text-shadow`)
* **Sous-titre** : `Connectez-vous pour gérer vos livraisons`, taille `14px`, opacité 0.9

---

## 🔐 Formulaire de Connexion

* **Container blanc** avec `padding: 24px`, `border-radius: 20px`, `box-shadow`

### 📞 Champ Téléphone

* Label : `Numéro de téléphone`, taille 14px, poids 500, couleur `#333`
* Input :

  * Largeur 100%, `padding: 16px 16px 16px 60px`
  * `border: 2px solid #E5E7EB`, `border-radius: 12px`
  * Fond gris très clair `#F9FAFB`
  * **Préfixe +229** en position absolue à gauche

### 🔑 Champ Mot de passe

* Label : `Mot de passe`, style identique au champ téléphone
* Input :

  * type `password`, même style visuel que téléphone

### 🟢 Statut "En ligne"

* Checkbox standard, alignée à gauche d’un texte : `Me connecter en ligne (disponible pour livraisons)`
* Checkbox `checked` par défaut, taille 18px, `accent-color: #008751`

---

## ✅ Bouton de Connexion

* Texte : `Se connecter`, gras 600, taille 16px
* Couleur : dégradé vert `linear-gradient(135deg, #008751 → #22C55E)`
* Arrondi `12px`, padding vertical `16px`
* `box-shadow` vert doux au survol (`hover`)

---

## 🧾 Lien d’inscription partenaire

* Texte : `Nouveau transporteur ? Devenir partenaire`
* Bouton `Devenir partenaire` :

  * fond transparent, texte vert `#008751`, souligné
  * `hover` : vert foncé `#065F46`

---

## 🦶 Pied de page MVP

* Alignement centré, texte blanc, taille `12px`, opacité 0.8
* Contenu : `MVP Transporteur • Colis Express Bénin`

---

## 🧑‍💻 Notes Flutter

* Formulaire : utiliser `TextField`, `InputDecoration`, `Stack` pour préfixe `+229`
* Statut en ligne : `CheckboxListTile`
* Connexion bouton : `ElevatedButton` avec `BoxDecoration` pour dégradé
* Lien inscription : `GestureDetector` avec `Text.rich()` ou `TextSpan`

---

## 📌 Conclusion

Un écran simple, professionnel, avec branding clair et bon contraste. Tous les éléments visuels et interactifs peuvent être recréés avec des `Container`, `TextField`, `Checkbox`, `ElevatedButton`, tout en conservant l’esprit MVP. L'expérience est fluide et directe pour un transporteur débutant.


# 📱 Détail de l'écran : MVP\_transporteur-dashboard (Tableau de bord transporteur)

## 🧭 Objectif

Permettre au transporteur de consulter rapidement ses statistiques, accéder aux nouvelles commandes, aux livraisons en cours, et visualiser ses revenus journaliers.

---

## 🧱 Structure Générale

* **Disposition verticale** complète avec `ScrollView`
* **Fond principal** : `#F8FAFC`
* Les sections sont visuellement distinctes avec `Container` en fond blanc ou dégradé et des `border-radius` harmonieux

---

## 👋 En-tête de Bienvenue

* Fond en dégradé vert `linear-gradient(135deg, #008751 → #22C55E)`
* Padding : `20px 16px`, texte blanc
* **Nom transporteur** : `Salut Koffi !`, taille `20px`, gras 700
* **Sous-titre** : `TransExpress • En ligne`, taille 14px, opacité 0.9
* **Statut** : pastille verte animée (pulsation, `#10B981`), cercle `12x12px`
* **Avatar** : cercle blanc semi-transparent `40x40px`, emoji `👤` centré

---

## 📊 Statistiques rapides

* Présentation en `GridView` 3 colonnes, `gap: 12px`
* Chiffres (gras, 20px) + légendes (12px, opacité 0.9)

  * `3` Nouvelles
  * `2` En cours
  * `12` Aujourd'hui

---

## 📨 Bouton Nouvelles Commandes

* Style : `Container` avec `border-radius: 16px`, fond jaune `linear-gradient(135deg, #FCD116 → #F59E0B)`, ombre légère
* Texte principal : `Nouvelles commandes`, 18px, gras 700, couleur texte `#92400E`
* Texte secondaire : `3 commandes en attente`, 14px, opacité 0.8
* Icône : `📬`
* Badge à droite : fond brun clair, texte `3`, arrondi 20px

---

## 🛠️ Actions secondaires

Présentées en `GridView` 2 colonnes, `gap: 12px`

### 1. Livraisons

* Icône : `🚚`
* Texte : `Livraisons`, 14px, gras 600, `#374151`
* Sous-texte : `2 en cours`, 12px, `#6B7280`
* Conteneur : fond blanc, bordure grise claire, coins arrondis 12px

### 2. Revenus

* Icône : `💰`
* Texte : `Revenus`, même style
* Sous-texte : `Aujourd'hui`

---

## 🚛 Livraisons en cours

* Conteneur principal : fond blanc, arrondi 16px, `padding: 20px`
* Titre : `🚚 Livraisons en cours`, `fontSize: 18px`, `fontWeight: 700`

### Carte livraison

#### 1. Livraison #CE2024-003

* Fond : `#FEF3C7`, bordure `#F59E0B`, arrondi `12px`, `padding: 12px`
* Icône 📦 fond dégradé orange, carré `40x40`, bord `8px`
* Texte : `Cotonou → Parakou • À collecter`, `#92400E`
* Bouton : `Collecter`, fond orange `#F59E0B`, texte blanc, arrondi `6px`, `fontSize: 12px`

#### 2. Livraison #CE2024-002

* Fond : `#EFF6FF`, bordure `#3B82F6`
* Texte : `Abomey → Cotonou • En transit`, couleur `#1E40AF`
* Bouton : `Livrer`, fond bleu `#3B82F6`, texte blanc

---

## 💸 Revenus du jour

* Conteneur en **dégradé vert** : `linear-gradient(135deg, #10B981 → #34D399)`
* Coins arrondis `16px`, `padding: 20px`, texte centré blanc
* Titre : `💰 Revenus aujourd'hui`, taille `16px`, poids `600`
* Montant : `18,500 FCFA`, taille `28px`, poids `700`
* Sous-texte : `12 livraisons terminées`, taille `14px`, opacité 0.9

---

## 🦶 Pied de page MVP

* Fond blanc, texte centré `#9CA3AF`, taille `12px`
* Contenu : `MVP Transporteur v1.0 • Colis Express Bénin`

---

## 🧑‍💻 Notes Flutter

* Grille : `GridView` pour stats + actions secondaires
* Boutons : `ElevatedButton`, `OutlinedButton`, ou `Container` stylisé avec `InkWell`
* État temps réel (ex : pastille pulsée) via `AnimatedContainer` ou `TweenAnimationBuilder`
* Livraisons → `ListView.builder` avec style coloré selon état (À collecter, En transit)

---

## 📌 Conclusion

Ce tableau de bord est une synthèse efficace de toutes les fonctions clés pour le transporteur. L’interface est visuellement attrayante, simple et optimisée pour une interaction rapide. Chaque composant est clairement identifiable et se transpose naturellement avec les widgets Flutter standards.


# 📱 Détail de l'écran : MVP\_transporteur-livraison (Processus de livraison)

## 🧭 Objectif

Fournir au transporteur toutes les informations nécessaires pour finaliser une livraison : coordonnées, adresse, paiement à percevoir, instructions, et actions de confirmation ou signalement.

---

## 🧱 Structure Générale

* **ScrollView vertical**, fond principal `#F8FAFC`
* Plusieurs sections `Container` blancs avec `border-radius: 16px`, `padding`, `box-shadow` léger
* Boutons d'action fixes en bas de l'écran dans une barre `sticky`

---

## 🔝 En-tête

* Fond dégradé bleu `linear-gradient(135deg, #3B82F6 → #60A5FA)`
* Bouton retour (icône flèche blanche, fond semi-transparent arrondi `8px`)
* Titre : `Livraison en cours` (18px, blanc, gras)
* Sous-titre : `#CE2024-003` (14px, opacité 0.9)

### 🚚 Statut actuel

* Conteneur semi-transparent `rgba(255,255,255,0.2)`, `border-radius: 12px`, `padding: 16px`
* Icône : `🚚`, texte `En route vers le destinataire`
* ETA : `Arrivée estimée: 17:30`

---

## 📦 Détails du colis

* Grille 2 colonnes : expéditeur et destinataire
* Nom, téléphone (format masqué)
* Description : `Vêtements et accessoires`
* Lieu collecte : `Akpakpa Centre, Cotonou`

---

## 🗺️ Adresse de livraison

* Section blanche avec titre : `📍 Adresse de livraison`
* Encadré vert clair `#F0FDF4` avec bord `#10B981`
* Adresse : `Quartier Agla, Rue de la Paix`
* Détails : repères visuels + consigne pour demander Marie Adjovi au gardien

### 📞 Actions livraison

* Bouton **Appeler** : fond bleu `#3B82F6`, texte blanc, icône `📞`
* Bouton **GPS** : fond blanc, bordure grise, texte `#374151`, icône `🗺️`

---

## 💰 Paiement à collecter

* Titre : `💰 Paiement à collecter`
* Encadré jaune clair `#FEF3C7` avec bord `#F59E0B`
* Montant : `2700 FCFA`, texte `#92400E`, gros, gras
* Mention : `À collecter auprès du destinataire`

---

## 💡 Instructions spéciales

* Conteneur bleu clair `#EFF6FF`, bordure `#3B82F6`
* Icône : `💡`, titre `Instructions`
* Points clés :

  * Vérifier identité
  * Collecter paiement avant remise
  * Prendre photo confirmation

---

## ✅ Actions de livraison (en bas d’écran)

* Boutons dans `Row`, `gap: 12px`

### 🔴 Bouton "Problème"

* Fond blanc, bordure grise, texte gris `#6B7280`
* Hover : rouge `#EF4444`

### 🟢 Bouton "Confirmer livraison"

* Dégradé vert `linear-gradient(135deg, #10B981 → #34D399)`
* Texte blanc, gras, `box-shadow` vert

---

## 🧑‍💻 Notes Flutter

* Utiliser `Scaffold` avec `bottomNavigationBar` personnalisé pour les boutons
* Sections → `Container`, `BoxDecoration`, `Column`
* Boutons → `ElevatedButton`, `OutlinedButton` avec `Row` pour icônes
* Instructions : `Row` avec `Icon` + `Expanded`
* Confirmation → boîte de dialogue `showDialog`

---

## 📌 Conclusion

Cet écran résume l'étape finale de la mission transporteur. Il est visuellement clair, intuitif et complet. Chaque action est contextualisée et facilement accessible pour garantir une livraison fluide et bien encadrée. L’interface s’intègre parfaitement à une architecture Flutter modulaire avec des composants réutilisables.



# 📱 Détail de l'écran : MVP\_transporteur-livraison (Processus de livraison)

## 🧭 Objectif

Fournir au transporteur toutes les informations nécessaires pour finaliser une livraison : coordonnées, adresse, paiement à percevoir, instructions, navigation GPS, et actions de confirmation ou signalement.

---

## 🧱 Structure Générale

* **ScrollView vertical**, fond principal `#F8FAFC`
* Plusieurs sections `Container` blancs avec `border-radius: 16px`, `padding`, `box-shadow` léger
* Boutons d'action fixes en bas de l'écran dans une barre `sticky`
* Composant interactif plein écran : carte Leaflet avec itinéraire

---

## 🔝 En-tête

* Fond dégradé bleu `linear-gradient(135deg, #3B82F6 → #60A5FA)`
* Bouton retour (icône flèche blanche, fond semi-transparent arrondi `8px`)
* Titre : `Livraison en cours` (18px, blanc, gras)
* Sous-titre : `#CE2024-003` (14px, opacité 0.9)

### 🚚 Statut actuel

* Conteneur semi-transparent `rgba(255,255,255,0.2)`, `border-radius: 12px`, `padding: 16px`
* Icône : `🚚`, texte `En route vers le destinataire`
* ETA : `Arrivée estimée: 17:30`

---

## 📦 Détails du colis

* Grille 2 colonnes : expéditeur et destinataire
* Nom, téléphone (format masqué)
* Description : `Vêtements et accessoires`
* Lieu collecte : `Akpakpa Centre, Cotonou`

---

## 🗺️ Adresse de livraison

* Section blanche avec titre : `📍 Adresse de livraison`
* Encadré vert clair `#F0FDF4` avec bord `#10B981`
* Adresse : `Quartier Agla, Rue de la Paix`
* Détails : repères visuels + consigne pour demander Marie Adjovi au gardien

### 📞 Actions livraison

* Bouton **Appeler** : fond bleu `#3B82F6`, texte blanc, icône `📞`
* Bouton **GPS** : fond blanc, bordure grise, texte `#374151`, icône `🗺️`

---

## 💰 Paiement à collecter

* Titre : `💰 Paiement à collecter`
* Encadré jaune clair `#FEF3C7` avec bord `#F59E0B`
* Montant : `2700 FCFA`, texte `#92400E`, gros, gras
* Mention : `À collecter auprès du destinataire`

---

## 💡 Instructions spéciales

* Conteneur bleu clair `#EFF6FF`, bordure `#3B82F6`
* Icône : `💡`, titre `Instructions`
* Points clés :

  * Vérifier identité
  * Collecter paiement avant remise
  * Prendre photo confirmation

---

## 🗺️ Navigation GPS intégrée

* Carte Leaflet plein écran avec trace dynamique entre position actuelle et point de collecte
* Marqueurs personnalisés (cercle bleu pour position, orange pour point de collecte)
* Contrôles :

  * Bouton retour (haut gauche)
  * Mode de transport (haut droit) avec 3 icônes (route, navigation, bus)
* Panneau flottant bas (`nav-panel`) :

  * Infos : distance restante (`À 1.2 km`), durée (`7 min`), ETA (`9:48`)
  * Résumé : adresse du point de collecte et créneau estimé (`9:48 - 9:55`)
  * Actions rapides : `Détails`, `Appeler`, `Vue 3D`

---

## ✅ Actions de livraison (en bas d’écran)

* Boutons dans `Row`, `gap: 12px`

### 🔴 Bouton "Problème"

* Fond blanc, bordure grise, texte gris `#6B7280`
* Hover : rouge `#EF4444`

### 🟢 Bouton "Confirmer livraison"

* Dégradé vert `linear-gradient(135deg, #10B981 → #34D399)`
* Texte blanc, gras, `box-shadow` vert

---

## 🧑‍💻 Notes Flutter

* Navigation : intégrer `flutter_map` ou `google_maps_flutter` pour une carte interactive
* `Stack` pour surimposer la carte avec boutons flottants
* `DraggableScrollableSheet` pour le panneau bas (infos ETA + actions)
* Icônes et boutons : `IconButton`, `GestureDetector`, `ElevatedButton` stylisés
* API GPS et navigation à prévoir pour version native

---

## 📌 Conclusion

Cette extension de l'écran de livraison avec navigation GPS ajoute une **dimension interactive et fonctionnelle essentielle** au transporteur. Elle combine informations logistiques, suivi temps réel, et interaction directe. Chaque composant peut être transposé proprement en Flutter avec un `Stack` intelligent et widgets stylisés adaptés au mobile.

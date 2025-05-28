# 📱 Détail de l'écran : MVP\_splash (Écran de démarrage simplifié)

## 🧭 Objectif

Offrir une première impression visuelle forte de l'application avec une animation fluide, branding clair, et redirection automatique vers l'écran de connexion.

---

## 🧱 Structure Générale

* **Fond** : dégradé vertical `linear-gradient(135deg, #FCD116 → #008751)`
* **Disposition** : `Column`, alignée au centre vertical et horizontal, `padding: 40px 20px`
* **Alignement** : `text-align: center`

---

## 📦 Logo principal

* Container carré `120x120px`, fond blanc, `border-radius: 24px`
* Icône : emoji `📦`, taille `48px`, couleur `#008751`, poids `font-weight: 900`
* **Effet** : `box-shadow`, animation `bounceIn` avec delay `0.5s`

---

## 🔠 Branding

* **Titre** : `Colis Express`, taille `32px`, gras `900`, couleur blanc, `text-shadow`
* **Sous-titre** : `Bénin`, taille `20px`, gras `600`, opacité `0.95`
* **Description** : `Livraison rapide et sécurisée de vos colis partout au Bénin`

  * Taille `16px`, opacité `0.9`, `max-width: 280px`, `line-height: 1.5`

---

## 🔄 Indicateur de chargement

* **Structure** : `Row` avec `gap: 12px`, centré
* **Spinner** : cercle `20x20px`, `border: 2px` avec `border-top` blanc uniquement
* **Animation** : rotation infinie (`spin 1s linear infinite`)
* **Texte** : `Chargement...`, `font-size: 14px`, `font-weight: 500`, blanc opacifié

---

## 🔖 Tag MVP version

* Position : `absolute bottom: 20px`, centré horizontalement avec `translateX(-50%)`
* Fond semi-transparent `rgba(255,255,255,0.2)`
* `border-radius: 20px`, `backdrop-filter: blur(10px)`
* Texte : `MVP v1.0`, taille `12px`, blanc, gras `600`

---

## 🧑‍💻 Notes Flutter

* Utiliser `Scaffold` avec `Stack` si besoin de positionnement absolu (version)
* `AnimatedContainer` pour fadeIn/bounce
* `CircularProgressIndicator` personnalisé pour spinner
* Redirection automatique avec `Future.delayed(...).then(...)`
* Widgets : `Column`, `Center`, `Text`, `Container`, `Positioned`

---

## 📌 Conclusion

L’écran `MVP_splash` remplit parfaitement son rôle de **présentation animée du produit**. Sa conception centrée et animée, son branding fort et son indicateur de chargement guident l'utilisateur de façon fluide vers la suite du parcours. Idéalement intégré avec une redirection vers la connexion dans un flux MVP Flutter.


# 📱 Détail de l'écran : MVP\_accueil (Dashboard principal simplifié)

## 🧭 Objectif

Accueillir l’expéditeur avec un message personnalisé et lui offrir un accès direct aux fonctionnalités essentielles : création de colis, suivi, historique et aperçu des colis récents.

---

## 🧱 Structure Générale

* **Disposition verticale**, `ScrollView`, fond `#F8FAFC`
* Sections principales séparées visuellement : header coloré, actions, historiques
* Design centrée sur **simplicité** et **rapidité d’accès** aux fonctions clés

---

## 🔝 Header utilisateur

* Fond : dégradé vert `linear-gradient(135deg, #008751 → #22C55E)`
* Padding : `20px 16px`, texte blanc
* Texte :

  * Titre : `Bonjour Marie !` (20px, gras)
  * Sous-texte : `Prêt à envoyer un colis ?` (14px, opacité 0.9)
* Avatar : cercle `40x40px`, fond blanc semi-transparent, emoji `👤` centré

---

## ✨ Bouton "Nouveau colis"

* Fond : dégradé jaune `linear-gradient(135deg, #FCD116 → #F59E0B)`
* Texte : `Nouveau colis`, 18px, gras, couleur texte `#92400E`
* Sous-texte : `Créer un envoi`, 14px, opacité 0.8
* Icône : `📦`, taille 24px
* `border-radius: 16px`, `box-shadow` doux, `padding: 20px`

---

## 🛠️ Actions secondaires (2 colonnes)

* Grille `2x1`, `gap: 12px`

### 📍 Suivre

* Icône : `📍`, 20px
* Titre : `Suivre`, texte `#374151`, gras
* Style : fond blanc, bordure grise `#E5E7EB`, `border-radius: 12px`, `padding: 16px`

### 📋 Historique

* Icône : `📋`, mêmes styles que Suivre
* Note : bouton inactif pour MVP (fonctionnalité à implémenter)

---

## 📦 Colis récents

* Conteneur blanc, `border-radius: 16px`, `box-shadow` doux, `padding: 20px`
* Titre : `Colis récents`, `font-size: 18px`, `font-weight: 700`, `color: #1F2937`

### ✅ Colis 1

* Emoji : `📦`, fond dégradé vert `#10B981 → #34D399`
* ID : `#CE2024-001`
* Détail : `Vers Parakou • Livré`
* Statut : `✓ Livré`, texte vert `#10B981`, `font-weight: 600`

### 🚚 Colis 2

* Emoji : `📦`, fond dégradé bleu `#3B82F6 → #60A5FA`
* ID : `#CE2024-002`
* Détail : `Vers Abomey • En transit`
* Statut : `🚚 Transit`, texte bleu `#3B82F6`, `font-weight: 600`

---

## 🦶 Footer MVP

* Fond blanc, `border-top: 1px solid #E5E7EB`
* Texte centré, `font-size: 12px`, couleur `#9CA3AF`
* Contenu : `MVP v1.0 • Colis Express Bénin`

---

## 🧑‍💻 Notes Flutter

* Grille : `GridView` ou `Wrap` pour actions secondaires
* Boutons : `ElevatedButton` (principal), `OutlinedButton` (secondaires)
* Section récente : `ListView` ou `Column`
* Animation légère possible sur bouton principal avec `InkWell`
* Navigation : redirection avec `Navigator.pushNamed(...)`

---

## 📌 Conclusion

L’écran d’accueil est clair, structuré, et fonctionnel. Il centralise les interactions importantes (création, suivi, historique) tout en restant **léger visuellement**. Les colis récents renforcent la continuité d’usage. Tout est conçu pour une conversion rapide vers Flutter.

# 📱 Détail de l'écran : MVP\_confirmation (Récapitulatif commande)

## 🧭 Objectif

Permettre à l’expéditeur de visualiser un récapitulatif clair et complet de la commande créée, avec les informations essentielles (trajet, transporteur, colis) et finaliser par confirmation ou modification.

---

## 🧱 Structure Générale

* `ScrollView` vertical, fond général `#F8FAFC`
* Sections en `Container` : blancs ou colorés, `border-radius: 16px`, `padding`, ombrage doux
* `Sticky footer` contenant deux boutons d’action

---

## 🔝 En-tête

* Fond blanc, `border-bottom: 1px solid #E5E7EB`
* Titre : `Confirmation`, `font-size: 18px`, `font-weight: 700`, couleur `#1F2937`
* Sous-titre : `Vérifiez votre commande`, `font-size: 14px`, `#6B7280`
* Bouton retour : flèche noire `#374151`, fond transparent

---

## ✅ Message de confirmation

* Conteneur fond dégradé vert `linear-gradient(135deg, #10B981 → #34D399)`, texte blanc, centré
* Icône : `✅`, `font-size: 32px`
* Texte : `Commande créée !`, taille `20px`, gras
* Numéro : `#CE2024-003` dans capsule semi-transparente blanche `padding: 8px`, `border-radius: 8px`

---

## 📋 Récapitulatif

Conteneur blanc, `box-shadow`, `padding: 20px`

### 🗺️ Trajet

* Icône : `🗺️`, `font-size: 20px`
* Texte : `Cotonou → Parakou`, distance `~420 km`

### 🚛 Transporteur

* Fond vert clair `#F0FDF4`, bordure `#10B981`
* Emoji camion, fond dégradé vert
* Nom : `TransExpress`, rating : `⭐ 4.8/5`, temps estimé : `2h`
* Prix : `2500 FCFA`, texte vert, gras

### 📦 Colis

* Titre `Colis`, `font-size: 14px`, gras, `#1F2937`
* Description : `Vêtements et accessoires`

---

## 💡 Informations importantes

* Fond jaune clair `#FEF3C7`, bord `#F59E0B`, `border-radius: 12px`
* Icône 💡 + texte `Informations importantes`
* Liste points :

  * Le paiement se fait à la livraison
  * SMS de confirmation sera envoyé
  * Le transporteur contactera avant collecte

---

## ☎️ Contacts

* Conteneur blanc avec `box-shadow`
* Deux blocs : Expéditeur et Destinataire

  * Nom + numéro téléphone masqué `+229 97 XX XX XX`
  * Texte bleu `#3B82F6`

---

## 🛠️ Boutons d’action (bas écran)

### ✏️ Modifier

* Fond blanc, bordure `#E5E7EB`, texte gris `#374151`
* Hover : bleu `#3B82F6`

### ✅ Confirmer la commande

* Fond dégradé vert `linear-gradient(135deg, #008751 → #22C55E)`
* Texte blanc, gras, `box-shadow` vert

---

## 🧑‍💻 Notes Flutter

* Utiliser `ListView` + `Container` pour chaque section
* `AlertDialog` pour modification ou confirmation
* `ElevatedButton`, `OutlinedButton`, `Row`, `Icon + Text`
* `Hero` ou `AnimatedSwitcher` pour success message
* Navigation post-confirmation vers `MVP_suivi`

---

## 📌 Conclusion

L’écran `MVP_confirmation` est à la fois rassurant et instructif. Il présente un résumé clair de la commande, invite à la relecture, et offre un **point final d’engagement utilisateur** via la confirmation. Parfaitement transposable en Flutter.


# 📱 Détail de l'écran : MVP\_connexion (Authentification simplifiée)

## 🧭 Objectif

Permettre aux utilisateurs de se connecter à leur compte avec un numéro de téléphone et un mot de passe dans une interface claire et intuitive.

---

## 🧱 Structure Générale

* **Disposition verticale**, `padding: 20px`, fond blanc
* **Disposition centrée** sur la partie haute avec header/logo + formulaire de connexion
* **Footer** collé en bas avec texte MVP

---

## 🔝 En-tête visuel

* Bloc centré `margin: 40px 0`
* Icône : 📦, dans un carré `80x80px`, fond dégradé jaune → vert (`linear-gradient(135deg, #FCD116 → #008751)`), `border-radius: 20px`
* Titre : `Connexion`, taille `24px`, gras, couleur `#333`
* Sous-titre : `Accédez à votre compte Colis Express`, `font-size: 14px`, couleur `#666`

---

## 📝 Formulaire de connexion

### 📞 Champ téléphone

* Label : `Numéro de téléphone`, taille `14px`, gras
* Input : `TextField`, padding à gauche `60px`, `border: 2px solid #E5E7EB`, `border-radius: 12px`, `font-size: 16px`, fond `#F9FAFB`
* Préfixe fixe `+229` positionné absolument à gauche (`left: 16px`)

### 🔑 Champ mot de passe

* Label : `Mot de passe`, même style
* Input : même style que téléphone mais sans préfixe

---

## ✅ Bouton de connexion

* Texte : `Se connecter`, `font-size: 16px`, `font-weight: 600`, texte blanc
* Fond : dégradé vert `linear-gradient(135deg, #008751 → #22C55E)`
* `padding: 16px`, `border-radius: 12px`, `box-shadow` vert léger
* `margin-top: 20px`

---

## 🆕 Lien inscription

* Texte : `Pas de compte ? Créer un compte`
* Style : `font-size: 14px`, `color: #6B7280`
* Bouton `Créer un compte` : fond transparent, texte vert `#008751`, souligné

---

## 🦶 Footer MVP

* Texte centré : `Version MVP • Colis Express Bénin`
* `font-size: 12px`, `color: #9CA3AF`, `border-top: 1px solid #E5E7EB`, `padding: 20px 0`

---

## 🧑‍💻 Notes Flutter

* `Scaffold` + `SafeArea`
* Champs : `TextField`, avec `Stack` ou `Row` pour préfixe `+229`
* Bouton : `ElevatedButton` stylisé (dégradé via `BoxDecoration` dans `Ink`)
* `GestureDetector` pour le lien inscription
* `Form` + `TextEditingController` pour validation locale

---

## 📌 Conclusion

L’écran de connexion est minimaliste, lisible, et rapide à implémenter. Son design doux et intuitif est parfaitement adapté à une expérience MVP. Il constitue la porte d’entrée simple et fonctionnelle pour l’utilisateur.



📦 Détail de l'écran : MVP_creation-colis (Formulaire simplifié)

🧭 Objectif

Permettre à l’utilisateur de saisir rapidement les informations de collecte, de livraison et de description du colis, de manière simplifiée.

🧱 Structure Générale

Scroll vertical, fond général #F8FAFC

Sections visuelles séparées : Expéditeur, Destinataire, Colis

Container blanc, border-radius: 16px, box-shadow doux, padding: 20px

Bouton final en bas : continuer vers la sélection transporteur

🧾 Section Expéditeur

Titre : 👤 Expéditeur, taille 16px, gras, couleur #1F2937

Champs :

Nom complet (input)

Téléphone (input avec préfixe +229 intégré)

Adresse de collecte (textarea)

🧾 Section Destinataire

Titre : 📍 Destinataire, même style que précédemment

Champs :

Nom complet

Téléphone (avec préfixe)

Adresse de livraison (textarea)

🧾 Section Colis

Titre : 📦 Colis

Champs :

Description du contenu (textarea)

Photo (optionnelle), zone cliquable avec bordure pointillée, état vide ou preview avec bouton supprimer

✅ Bouton Validation

Texte : Continuer vers sélection transporteur

Fond dégradé vert #008751 → #22C55E, border-radius: 12px, font-weight: 600, font-size: 16px

box-shadow vert, padding: 16px, full-width

🧑‍💻 Notes Flutter

TextField avec décorateur prefixText pour +229

TextFormField + Form avec GlobalKey pour validation

ImagePicker pour la photo colis

Visibility widget pour alternance entre placeholder photo / preview

📌 Conclusion

Ce formulaire est très optimisé pour le MVP, minimaliste mais suffisant pour effectuer un envoi. Il s'intègre facilement dans une UI Flutter avec Form, Column, Container, et une gestion légère de la validation.


## 🟢 Écran : `MVP_livraison-confirmee` — Confirmation de Livraison Simplifiée

### 🎯 Objectif

Confirmer visuellement au destinataire que son colis a bien été livré, fournir les infos clés, recueillir une évaluation rapide et proposer deux actions post-livraison : refaire un envoi ou retourner à l’accueil.

---

### 🖼️ Structure générale

* **Disposition verticale centrée**.
* **Fond dégradé vert** `linear-gradient(135deg, #10B981 0%, #34D399 100%)`.
* **Alignement central** de tous les éléments.
* **Espacement généreux** entre blocs.
* **Style visuel de type “succès” animé**.

---

### ✅ Animation de succès

* Cercle blanc `120x120px`, bord arrondi `100%`.
* Icône `✅` (check) en vert animé (keyframe `bounceIn + checkmark`).
* Ombre portée : `box-shadow: 0 8px 32px rgba(0, 0, 0, 0.2)`.

---

### 🧾 Informations principales

| Élément             | Détails                                                                     |
| ------------------- | --------------------------------------------------------------------------- |
| **Titre principal** | `Livraison réussie !`, blanc, taille `28px`, `font-weight: 900`             |
| **Sous-titre**      | Texte explicatif, `16px`, blanc, `opacity: 0.95`, centré, max-width `280px` |

---

### 📦 Carte d’informations de livraison

* Fond : `rgba(255,255,255,0.2)` + `backdrop-filter: blur(10px)`
* Bord : arrondi `16px`, padding `20px`
* Contenu :

  * **Numéro** : `#CE2024-003`, gras
  * **Trajet** : `Cotonou → Parakou`
  * **Livré le** : Aujourd'hui 17:25
  * **Transporteur** : TransExpress
  * **Destinataire** : Marie Adjovi
* Texte : blanc, petit (14px), séparations par `border-top` transparent blanc `0.3`.

---

### ⭐ Évaluation rapide par emoji

| Type      | Détails                                                                   |
| --------- | ------------------------------------------------------------------------- |
| Format    | 5 boutons emojis : 😞 😐 🙂 😊 🤩                                         |
| Style     | `font-size: 24px`, `opacity: 0.6`, effet hover : `scale(1.2)`             |
| Sélection | Ajout classe `.selected`, accent visuel immédiat                          |
| Feedback  | Message pop-up adapté à la note choisie (ex. : “Merci pour votre retour”) |

---

### 🎯 Actions post-livraison

| Bouton                    | Style et effet                                                |
| ------------------------- | ------------------------------------------------------------- |
| 📦 **Nouveau colis**      | Fond blanc, texte vert `#10B981`, bord arrondi `12px`, shadow |
| 🏠 **Retour à l'accueil** | Fond semi-transparent, texte blanc, bord blanc, effet blur    |

---

### 🧼 Footer

* Texte : `Merci d'avoir utilisé Colis Express Bénin • MVP v1.0`
* Style : blanc, `12px`, `opacity: 0.8`, centré

---

### 🎯 Interactions disponibles

* Boutons emojis de notation
* Bouton "Nouveau colis" → redirige vers `MVP_creation-colis.html`
* Bouton "Accueil" → redirige vers `MVP_accueil.html`




---

# 💳 Détail de l’écran : MVP\_paiement (Paiement à la livraison)

## 🧭 Objectif

Permettre au **destinataire** de finaliser la réception d’un colis via un **paiement à la livraison**, en choisissant un mode de paiement et en confirmant l’opération.

---

## 🧱 Structure Générale

* **Disposition principale** : `Column` verticale avec 3 grandes zones :

  * En-tête (`Header`)
  * Corps scrollable (`Scrollable Content`)
  * Actions (`Bottom Bar`)
* **Fond général** : `#F8FAFC`, clair, doux, sans distraction
* **Bords et arrondis** : `border-radius: 12–16px` sur toutes les cartes
* **Box shadow léger** : `box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05)`

---

## 🎨 En-tête (Header)

* **Fond** : `linear-gradient(135deg, #E8112D → #F87171)`
* **Texte centré** :

  * Emoji `💳` taille `32px`
  * Titre `Paiement à la livraison` : `font-size: 20px`, `font-weight: 700`
  * Sous-texte `Votre colis arrive bientôt !` : `font-size: 14px`, `opacity: 0.9`

---

## 📦 Bloc 1 : Infos du colis

* **Carte blanche** avec :

  * **Emoji titre** : `📦` + `Colis en cours de livraison` (taille `16px`, bold)
  * **Encart vert** avec :

    * Badge Emoji `🚛` sur fond dégradé `#10B981 → #34D399`
    * Référence colis `#CE2024-003`
    * Expéditeur `Jean Dupont (Cotonou)`
    * Statut : `🚚 En livraison` (vert `#10B981`)
  * **Infos détaillées** :

    * Transporteur : `TransExpress`
    * Contenu : `Vêtements`
    * Arrivée estimée : `Dans 15 minutes` (bleu `#3B82F6`)

---

## 💰 Bloc 2 : Détail du paiement

* **Carte blanche** avec :

  * Emoji `💰` + titre `Détail du paiement`
  * **Tableau résumé** :

    * Frais de livraison : `2500 FCFA`
    * Frais de service : `200 FCFA`
    * **Total à payer** : `2700 FCFA` en rouge `#E8112D`, `font-size: 18px`, `bold`

---

## 💳 Bloc 3 : Choix du mode de paiement

* **Carte blanche** avec :

  * Emoji `💳` + titre `Choisir le mode de paiement`
  * **Méthodes proposées** :

    1. **Mobile Money**

       * Icône `📱`, fond `#F59E0B → #FBBF24`
       * Sous-texte : `MTN Money, Moov Money`
       * Radio bouton grisé non sélectionné
    2. **Espèces** (sélectionné par défaut)

       * Icône `💵`, fond `#10B981 → #34D399`
       * Sous-texte : `Paiement en liquide au transporteur`
       * Cercle vert rempli (`selected`)
       * Fond vert clair `#F0FDF4`, bord vert `#10B981`

* **Interactions** :

  * Hover : fond `#EFF6FF`, bord bleu `#3B82F6`
  * Clic : bascule du mode sélectionné (effet visuel immédiat)

---

## ℹ️ Bloc 4 : Information importante

* **Bannière** :

  * Fond bleu très clair `#EFF6FF`
  * Bord `#3B82F6`
  * Emoji `ℹ️`
  * Titre : `Information importante` (bleu foncé)
  * Texte :
    *"Le paiement se fait uniquement à la réception du colis. Le transporteur vous contactera avant la livraison."*

---

## ✅ Barre d’action (Footer)

* **Disposition horizontale** : `Row` avec deux boutons

1. 🔴 **Bouton Refuser**

   * Style : `fond blanc`, `bord gris`, texte gris
   * Hover : bord et texte rouges `#EF4444`

2. 🟢 **Bouton Confirmer le paiement**

   * Style : `fond dégradé #10B981 → #34D399`, texte blanc
   * Effet : ombre verte au hover `rgba(16,185,129,0.4)`
   * Texte : `Confirmer le paiement`

---

## 🔄 Interaction et Logique JavaScript

* **Sélection dynamique** du mode de paiement

* **Confirmation** :

  * Change le bouton en `"Confirmation..."`, grisé
  * Simulation d’attente avec `setTimeout(...)`
  * Message final :

    > "Paiement confirmé !
    > Méthode: Espèces
    > Montant: 2700 FCFA"

* **Refus** :

  * Confirmation via `confirm(...)`
  * Message : `Livraison refusée. Le colis sera retourné à l'expéditeur.`

---

## 🧑‍💻 Notes Flutter

* `Scaffold` avec `SafeArea` + `Column`
* `ListView` pour le contenu scrollable
* `Container` avec `BoxDecoration` pour chaque carte
* `GestureDetector` pour bascule méthode de paiement
* `AlertDialog` pour confirmation/refus
* Widgets recommandés : `Text`, `Row`, `Column`, `Container`, `ElevatedButton`, `OutlinedButton`

---

## 📌 Conclusion

Cet écran MVP offre une **expérience fluide et claire** de paiement à la livraison. L'interface guide l'utilisateur à travers le récapitulatif de commande, le choix de méthode de paiement et l'action finale, dans un environnement épuré, coloré et entièrement mobile-friendly. Il est **parfaitement structuré pour un portage Flutter fidèle.**

# 🚚 Détail de l’écran : MVP\_selection-transporteur (Liste simplifiée)

## 🤝 Objectif

Permettre à l'utilisateur (expéditeur) de choisir un transporteur pour un trajet donné en visualisant les options disponibles (prix, durée, avis).

---

## 🧰 Structure Générale

* Disposition principale : `Column` verticale
* Trois grandes zones :

  * Header (retour + titre)
  * Info Trajet
  * Liste scrollable de transporteurs
* Fond principal : `#F8FAFC`
* `overflow-y: auto`

---

## 📅 En-tête (Header)

* Fond : `#FFFFFF`, `border-bottom: 1px solid #E5E7EB`
* Disposition : `Row` avec icône retour + titre + sous-titre
* Bouton retour :

  * SVG flèche gauche, `stroke: #374151`
  * `padding: 8px`, `cursor: pointer`
* Titre : `font-size: 18px`, `font-weight: 700`, `color: #1F2937`
* Sous-titre : `font-size: 14px`, `color: #6B7280`

---

## 📍 Info Trajet

* Fond : `linear-gradient(135deg, #3B82F6 → #60A5FA)`, texte blanc
* Marges : `margin: 16px`, `border-radius: 12px`, `padding: 16px`
* Emoji : `🗸`
* Texte :

  * Lieu : `Cotonou → Parakou`, `font-weight: 600`
  * Distance : `~420 km`, `opacity: 0.9`, `font-size: 12px`

---

## 🚚 Liste des transporteurs (scrollable)

### 🚛 Carte : TransExpress (recommandé)

* Bord vert `#10B981`, bandeau "Recommandé" en haut à droite
* Icône : `🚛` sur fond `#10B981 → #34D399`
* Nom : `TransExpress`, `font-weight: 700`, `font-size: 18px`
* Avis : `⭐⭐⭐⭐⭐` orange `#F59E0B` + `4.8/5 (127 avis)`
* Infos :

  * Prix : `2500 FCFA`, vert `#10B981`
  * Temps : `2h`, bleu `#3B82F6`
  * Type : `🚛`, texte : `Camion`
* Bouton : `Choisir ce transporteur`

  * Fond : `#10B981 → #34D399`, texte blanc
  * Hover : `box-shadow`, effet `translateY(-2px)`

### 🚐 Carte : RapidColis

* Fond : `#FFFFFF`, bord gris `#E5E7EB`
* Icône : `🚐`, fond `#3B82F6 → #60A5FA`
* Nom : `RapidColis`, Avis : `4.6/5 (89 avis)`
* Infos :

  * Prix : `2200 FCFA`
  * Temps : `3h`
  * Type : `Fourgon`
* Bouton : même style en dégradé bleu

### 🏍️ Carte : MotoLivraison

* Fond : `#FFFFFF`, bord gris `#E5E7EB`
* Icône : `🏍️`, fond `#F59E0B → #FBBF24`
* Nom : `MotoLivraison`, Avis : `4.9/5 (203 avis)`
* Infos :

  * Prix : `1800 FCFA`
  * Temps : `1h`
  * Type : `Moto`
* Bouton : dégradé orange

---

## 🔄 Interaction JavaScript

* Clic sur carte = clic sur bouton
* Bouton "Choisir" :

  * Se désactive, devient vert foncé `#059669`
  * Message "Sélectionné ✓"
  * Popup : nom, prix, durée + redirection simulée vers confirmation

---

## 🧑‍💻 Notes Flutter

* Utiliser `ListView.builder` pour la liste des transporteurs
* `Container` + `BoxDecoration` pour chaque carte
* `GestureDetector` pour déclencher les actions
* `showDialog` pour confirmation
* Widgets recommandés : `Text`, `Row`, `Column`, `Container`, `ElevatedButton`, `ListTile`

---

## 📌 Conclusion

Cet écran de sélection des transporteurs combine clarté visuelle, interactivité fluide et données essentielles (avis, temps, prix, type). Idéal pour une intégration Flutter rapide et intuitive, avec une logique très simple à reproduire pour la navigation et la sélection dynamique.


# 📍 Détail de l’écran : MVP\_suivi-carte (Suivi sur carte)

## 🤝 Objectif

Afficher la position actuelle du transporteur en temps réel sur une carte interactive avec des détails sur la commande, les adresses et les informations du livreur.

---

## 🧰 Structure Générale

* Disposition verticale `Column` avec 3 zones :

  * Header dégradé (retour + titre)
  * Carte Leaflet
  * Informations livraison + contact
* Fond principal : `#F8FAFC`, coins arrondis sur les cartes

---

## 🌍 En-tête

* Fond : `linear-gradient(135deg, #FCD116 → #F59E0B)`
* Bouton retour :

  * SVG flèche blanche, `background: rgba(255,255,255,0.2)`
  * `padding: 8px`, `border-radius: 8px`
* Titre : `Suivi en temps réel`, `font-size: 18px`, `font-weight: 700`, `color: white`
* Sous-texte : `Suivez votre colis sur la carte`, `font-size: 12px`, `opacity: 0.9`

---

## 📊 Carte Leaflet

* ID : `#map`, `height: 400px`, `border-radius: 16px`
* Lib : `Leaflet 1.9.4`
* Centre : position simulée `currentPosition`
* Marqueurs personnalisés :

  * Départ (orange) : `#F59E0B`
  * Destination (vert) : `#10B981`
  * Position actuelle (bleu) : `#3B82F6`, `box-shadow` visuel
* Ligne tracée : polyline en bleu pointillé entre les 3 points

---

## 📖 Carte d’infos livraison

* En-tête :

  * `Commande #CMD-789012`, `font-weight: 700`
  * Badge : `En cours de livraison`, fond `#FEF3C7`, texte `#92400E`

* Etapes :

  * Icônes circulaires vertes pour départ/destination
  * Adresses :

    * Départ : `123 Rue du Commerce, Cotonou`, étiquettes + horaires
    * Destination : `456 Avenue des Cocotiers, Porto-Novo`

* Infos transporteur :

  * Nom : `Thomas K.`, icône utilisateur gris
  * Véhicule : `Moto bleue - BJ-1234-XY`

---

## 📞 Carte contact

* Titre : `Contact transporteur`
* Boutons horizontaux :

  1. **Appeler** : icône téléphone (stroke `#6B7280`)
  2. **Message** : icône SMS (stroke `#6B7280`)
* Style : `border: 1px solid #E5E7EB`, `background: white`, `border-radius: 8px`, `padding: 10px`

---

## 🔄 Logique JavaScript (Leaflet)

* Affichage carte avec marqueurs : `L.marker()`
* Ajout de polyline `L.polyline(...)`
* Affichage de popups sur clic ou auto

---

## 🧑‍💻 Notes Flutter

* Intégrer la carte via `flutter_map` ou `google_maps_flutter`
* Créer `CustomPaint` ou `Stack` pour les lignes et positions
* Boutons : `OutlinedButton`, `Row`, `Expanded`
* Infos : `Card`, `ListTile`, `Container`

---

## 📌 Conclusion

L’écran `MVP_suivi-carte` permet un suivi visuel clair, enrichi d’informations utiles et de boutons de contact. C’est un composant clé de l’expérience utilisateur temps réel, combinant **carte dynamique**, **UI native** et **accessibilité directe au livreur**.


# ⏲️ Détail de l’écran : MVP\_suivi (Timeline simplifiée)

## 🤝 Objectif

Afficher l'état d'avancement d'une commande via une **timeline visuelle** claire, avec actions rapides pour contacter ou partager le suivi.

---

## 🧰 Structure Générale

* Disposition : `Column`, structure verticale mobile-friendly
* Zones principales :

  * Header (titre + numéro de commande)
  * Bandeau de statut (en transit)
  * Timeline des étapes
  * Actions rapides (contact/partage)
  * Footer (version + info maj)
* Fond principal : `#F8FAFC`, scrollable verticalement

---

## 📅 En-tête (Header)

* Fond blanc, `border-bottom: 1px solid #E5E7EB`
* Icône retour : flèche `stroke: #374151`
* Titre : `Suivi colis`, `font-size: 18px`, `bold`, `#1F2937`
* Sous-titre : `#CE2024-003`, `font-size: 14px`, `#6B7280`

---

## 🚚 Bandeau de statut actuel

* Fond : `linear-gradient(135deg, #3B82F6 → #60A5FA)`
* Emoji : `🚚`, `font-size: 32px`
* Titre : `En transit`, `font-size: 20px`, `font-weight: 700`
* Sous-texte : `Votre colis est en route...`, `font-size: 14px`, `opacity: 0.9`
* Badge : `Arrivée estimée: 17:30`, fond blanc semi-transparent, `border-radius: 8px`

---

## ⏳ Timeline des étapes

Chaque étape est composée de :

* Icône circulaire (couleur selon l'état)
* Trait vertical entre les cercles
* Titre, description, horodatage

### ✅ Étape 1 : Commande confirmée

* Icône : rond vert `#10B981`, check blanc
* Titre : `Commande confirmée`
* Description : `Votre commande a été créée...`
* Heure : `Aujourd'hui 14:30`, vert

### ✅ Étape 2 : Collectée

* Icône : même style vert + check
* Titre : `Collecté par transporteur`
* Heure : `Aujourd'hui 15:45`

### ⏳ Étape 3 : En transit

* Icône : camion bleu `#3B82F6`, animé `pulse`
* Titre : `En transit vers destination`
* Heure : `Aujourd'hui 16:20 • En cours...`

### 📦 Étape 4 : Livraison à venir

* Icône grise `#D1D5DB`, `📦`
* Titre : `Livraison en cours`
* Estimation : `Aujourd'hui 17:30`, texte gris `#9CA3AF`

---

## ✨ Actions rapides

* Carte avec deux boutons côte-à-côte :

1. **Contacter transporteur**

   * Bouton bleu `#3B82F6`, texte blanc
   * Emoji `📞`, `font-size: 14px`, `bold`
   * Hover : `#2563EB`
   * Action : `alert()` simulant un appel

2. **Partager le suivi**

   * Bouton blanc, bord gris `#E5E7EB`
   * Emoji `📤`, texte sombre `#374151`
   * Hover : texte et bord deviennent `#3B82F6`
   * Action : `navigator.share` ou `navigator.clipboard`

---

## 🛋 Footer

* Texte centé : `Mise à jour automatique • MVP v1.0`
* `font-size: 12px`, `color: #9CA3AF`

---

## 🧑‍💻 Notes Flutter

* Utiliser `ListView` pour scroll vertical
* `AnimatedContainer` pour effet `pulse` sur l'étape active
* `Row` + `Column` pour structure étapes
* `ElevatedButton`, `OutlinedButton` pour actions
* API possible via `Timer.periodic` pour mise à jour

---

## 📌 Conclusion

L’écran `MVP_suivi` propose une **visualisation fluide de l'avancement** de la livraison. La timeline intuitive, les boutons d’action rapide et l’estimation d’arrivée rendent l’interface très engageante. Idéal pour une intégration Flutter dynamique avec interactions utilisateur simples.

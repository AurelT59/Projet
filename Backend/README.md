openapi: 3.0.0
info:
  title: API Aliments
  version: 1.0.0
paths:
  /aliments.php:
    get:
      summary: Récupérer tous les aliments
      responses:
        '200':
          description: Succès
          content:
            application/json:
              example: 
                - CODE: '3038359003356'
                  PRODUIT: banzaï noodle saveur poulet
                  QUANTITE: '60'
                  PORTION: '340'
                  MARQUE: Lustucru,Panzani
                  NUTRISCORE_GRADE: c
                - CODE: '3181232138345'
                  PRODUIT: Original burger CHEESE
                  QUANTITE: '145'
                  PORTION: '145'
                  MARQUE: Charal
                  NUTRISCORE_GRADE: d
                - CODE: '3228857000166'
                  PRODUIT: Pain 100% mie complet
                  QUANTITE: '500'
                  PORTION: null
                  MARQUE: Harrys
                  NUTRISCORE_GRADE: c
                - CODE: '3242272261650'
                  PRODUIT: XtremBox - Radiatori  Bœuf Sauce au poivre
                  QUANTITE: '400'
                  PORTION: '400'
                  MARQUE: Sodebo, pasta xtrem
                  NUTRISCORE_GRADE: c
    post:
      summary: Créer un nouvel aliment
      requestBody:
        required: true
        content:
          application/json:
            example: 
              code: 0
              produit: pizza 4 fromages
              quantite: 500
              portion: 250
              marque: sodebo
              nutriscore_grade: C
              composition:
                - id_ingredient: 48
                  pourcentage: 75
                - id_ingredient: 49
                  pourcentage: 25
              labels:
                - id_categories: 27
              composition_nutritive:
                - id_nutriment: 4
                  valeur_100: 100
                  valeur_portion: 250
                  unite: g
      responses:
        '201':
          description: Création réussie
          content:
            application/json:
              example:
                code: 0;
        '500':
          description: Erreur interne au serveur

  '/aliments?code=':
    parameters:
      - name: code
        in: path
        required: true
        description: Code de l'aliment à manipuler
        schema:
          type: string
    get:
      summary: Récupérer un aliment par son code
      responses:
        '200':
          description: Succès
          content:
            application/json:
              example:
                aliment:
                  - CODE: '3032220061100'
                    PRODUIT: PRESIDENT BURGER CHEDDAR EMMENTAL 12 TRANCHES 200g
                    QUANTITE: '200'
                    PORTION: '30'
                    MARQUE: Président,Lactalis
                    NUTRISCORE_GRADE: e
                ingredients:
                  - CODE: '3032220061100'
                    ID_INGREDIENT: '2'
                    POURCENTAGE: '2'
                  - CODE: '3032220061100'
                    ID_INGREDIENT: '6'
                    POURCENTAGE: '0'
                  - CODE: '3032220061100'
                    ID_INGREDIENT: '7'
                    POURCENTAGE: '0'
                  - CODE: '3032220061100'
                    ID_INGREDIENT: '25'
                    POURCENTAGE: '0'
                  - CODE: '3032220061100'
                    ID_INGREDIENT: '27'
                    POURCENTAGE: '0'
                  - CODE: '3032220061100'
                    ID_INGREDIENT: '31'
                    POURCENTAGE: '50'
                  - CODE: '3032220061100'
                    ID_INGREDIENT: '32'
                    POURCENTAGE: '46'
                  - CODE: '3032220061100'
                    ID_INGREDIENT: '33'
                    POURCENTAGE: '1'
                  - CODE: '3032220061100'
                    ID_INGREDIENT: '34'
                    POURCENTAGE: '1'
                  - CODE: '3032220061100'
                    ID_INGREDIENT: '35'
                    POURCENTAGE: '0'
                  - CODE: '3032220061100'
                    ID_INGREDIENT: '36'
                    POURCENTAGE: '0'
                  - CODE: '3032220061100'
                    ID_INGREDIENT: '37'
                    POURCENTAGE: '0'
                categories:
                  - CODE: '3032220061100'
                    ID_NUTRIMENT: '1'
                    VALEUR_100: '0.45'
                    VALEUR_PORTION: '0.135'
                    UNITE: mg
                  - CODE: '3032220061100'
                    ID_NUTRIMENT: '2'
                    VALEUR_100: '4.5'
                    VALEUR_PORTION: '1.35'
                    UNITE: g
                  - CODE: '3032220061100'
                    ID_NUTRIMENT: '4'
                    VALEUR_100: '17'
                    VALEUR_PORTION: '5.1'
                    UNITE: g
                  - CODE: '3032220061100'
                    ID_NUTRIMENT: '7'
                    VALEUR_100: '13.5'
                    VALEUR_PORTION: '4.05'
                    UNITE: g
                  - CODE: '3032220061100'
                    ID_NUTRIMENT: '8'
                    VALEUR_100: '2.4'
                    VALEUR_PORTION: '0.72'
                    UNITE: g
                  - CODE: '3032220061100'
                    ID_NUTRIMENT: '9'
                    VALEUR_100: '961'
                    VALEUR_PORTION: '288'
                    UNITE: kJ
                nutriments:
                  - CODE: '3032220061100'
                    ID_CATEGORIES: '35'
                  - CODE: '3032220061100'
                    ID_CATEGORIES: '36'
                  - CODE: '3032220061100'
                    ID_CATEGORIES: '37'
                  - CODE: '3032220061100'
                    ID_CATEGORIES: '38'
                  - CODE: '3032220061100'
                    ID_CATEGORIES: '39'
                  - CODE: '3032220061100'
                    ID_CATEGORIES: '40'
                  - CODE: '3032220061100'
                    ID_CATEGORIES: '41'
                  - CODE: '3032220061100'
                    ID_CATEGORIES: '42'
                
        '404':
          description: Aliment non trouvé
    put:
      summary: Mettre à jour un aliment par son code
      requestBody:
        required: true
        content:
          application/json:
            example:
              code: 0
              produit: pizza 4 fromages
              quantite: 500
              portion: 250
              marque: sodebo
              nutriscore_grade: C
              composition:
                - id_ingredient: 48
                  pourcentage: 75
                - id_ingredient: 49
                  pourcentage: 25
              labels:
                - id_categories: 27
              composition_nutritive:
                - id_nutriment: 4
                  valeur_100: 100
                  valeur_portion: 250
                  unite: g
      responses:
        '200':
          description: Mise à jour réussie
          content:
            application/json:
              example:
                code: 0
        '500':
          description: Erreur interne au serveur
        '404':
          description: Aliment non trouvé
    delete:
      summary: Supprimer un aliment par son code
      responses:
        '204':
          description: Suppression réussie
          content:
            application/json:
              example:
                code: 0
        '500':
          description: Erreur interne au serveur
        '404':
          description: Aliment non trouvé
  /utilisateurs.php:
    get:
      summary: Récupérer un utilisateur par identifiant
      parameters:
        - name: identifiant
          in: query
          required: true
          schema:
            type: string
      responses:
        '200':
          description: Succès
          content:
            application/json:
              example:
                - IDENTIFIANT: 'test'
                  ID_SPORTIF: '2'
                  ID_SEXE: '1'
                  PRENOM: 'sqcsq'
                  NOM: 'sqcqsc'
                  AGE: '21'
                  POIDS: '90'
                  TAILLE: '180'
        '404':
          description: Utilisateur non trouvé

    post:
      summary: Créer un nouvel utilisateur
      requestBody:
        required: true
        content:
          application/json:
            example:
              identifiant: aurelt
              id_sportif: 2
              id_sexe: 1
              mot_de_passe: lol
              prenom: Aurel
              nom: Ter
              age: 21
              poids: 60
              taille: 180
      responses:
        '200':
          description: Création réussie
          content:
            application/json:
              example:
                identifiant: aurelt
        '501':
          description: Identifiant déjà existant
        '500':
          description: Erreur interne au serveur
    put:
      summary: Mettre à jour un utilisateur par identifiant
      requestBody:
        required: true
        content:
          application/json:
            example:
              identifiant_actuel: aurelt
              identifiant_nouveau: aurelt
              id_sportif: 2
              id_sexe: 1
              mot_de_passe: nouveau_mot_de_passe
              prenom: Aurel
              nom: Ter
              age: 21
              poids: 60
              taille: 180
      responses:
        '200':
          description: Mise à jour réussie
          content:
            application/json:
              example:
                identifiant: aurelt
        '501':
          description: Identifiant déjà existant
        '500':
          description: Erreur interne au serveur
        '404':
          description: Utilisateur non trouvé

    delete:
      summary: Supprimer un utilisateur par identifiant
      requestBody:
        required: true
        content:
          application/json:
            example:
              identifiant: aurelt
      responses:
        '204':
          description: Suppression réussie
          content:
            application/json:
              example:
                identifiant: aurelt
        '500':
          description: Erreur interne au serveur
        '404':
          description: Utilisateur non trouvé
  /nomenclature.php:
    get:
      summary: Récupérer la nomenclature des ingrédients, catégories et nutriments
      responses:
        '200':
          description: Succès
          content:
            application/json:
              example:
                ingredients:
                  - ID_INGREDIENT: '2'
                    NOM: eau
                  - ID_INGREDIENT: '6'
                    NOM: sel
                  - ID_INGREDIENT: '7'
                    NOM: arôme
                  - ID_INGREDIENT: '25'
                    NOM: colorant
                  - ID_INGREDIENT: '27'
                    NOM: correcteur d'acidité
                  - ID_INGREDIENT: '31'
                    NOM: LAIT écrémé reconstitué
                  - ID_INGREDIENT: '32'
                    NOM: fromages
                  - ID_INGREDIENT: '33'
                    NOM: beurre
                    CODE: '3032220061100'
                    POURCENTAGE: '1'
                  - ID_INGREDIENT: '34'
                    NOM: lactosérum
                    CODE: '3032220061100'
                    POURCENTAGE: '1'
                  - ID_INGREDIENT: '35'
                    NOM: protéines de LAIT
                    CODE: '3032220061100'
                    POURCENTAGE: '0'
                  - ID_INGREDIENT: '36'
                    NOM: sel de fonte
                    CODE: '3032220061100'
                    POURCENTAGE: '0'
                  - ID_INGREDIENT: '37'
                    NOM: épaississant
                    CODE: '3032220061100'
                    POURCENTAGE: '0'
                categories:
                  - ID_CATEGORIES: '35'
                    NOM: Produits laitiers
                    CODE: '3032220061100'
                  - ID_CATEGORIES: '36'
                    NOM: Produits fermentés
                    CODE: '3032220061100'
                  - ID_CATEGORIES: '37'
                    NOM: Produits laitiers fermentés
                    CODE: '3032220061100'
                  - ID_CATEGORIES: '38'
                    NOM: Fromages
                    CODE: '3032220061100'
                  - ID_CATEGORIES: '39'
                    NOM: Fromages de vache
                    CODE: '3032220061100'
                  - ID_CATEGORIES: '40'
                    NOM: Frais
                    CODE: '3032220061100'
                  - ID_CATEGORIES: '41'
                    NOM: Fromages en tranches
                    CODE: '3032220061100'
                  - ID_CATEGORIES: '42'
                    NOM: Fromages fondus
                    CODE: '3032220061100'
                nutriments:
                  - ID_NUTRIMENT: '1'
                    NOM: Calcium
                    NOM_EN: calcium
                    CODE: '3032220061100'
                    VALEUR_100: '0.45'
                    VALEUR_PORTION: '0.135'
                    UNITE: mg
                  - ID_NUTRIMENT: '2'
                    NOM: Glucides
                    NOM_EN: carbohydrates
                    CODE: '3032220061100'
                    VALEUR_100: '4.5'
                    VALEUR_PORTION: '1.35'
                    UNITE: g
                  - ID_NUTRIMENT: '4'
                    NOM: Matières grasses
                    NOM_EN: fat
                    CODE: '3032220061100'
                    VALEUR_100: '17'
                    VALEUR_PORTION: '5.1'
                    UNITE: g
                  - ID_NUTRIMENT: '7'
                    NOM: Protéines
                    NOM_EN: proteins
                    CODE: '3032220061100'
                    VALEUR_100: '13.5'
                    VALEUR_PORTION: '4.05'
                    UNITE: g
                  - ID_NUTRIMENT: '8'
                    NOM: Sel
                    NOM_EN: salt
                    CODE: '3032220061100'
                    VALEUR_100: '2.4'
                    VALEUR_PORTION: '0.72'
                    UNITE: g
                  - ID_NUTRIMENT: '9'
                    NOM: Énergie
                    NOM_EN: energy
                    CODE: '3032220061100'
                    VALEUR_100: '961'
                    VALEUR_PORTION: '288'
                    UNITE: kJ
        '404':
          description: Aucun aliment trouvé
        '500':
          description: Erreur interne au serveur
  /nomenclature_utilisateurs.php:
    get:
      summary: Récupérer la nomenclature des sexes et sports pratiqués
      responses:
        '200':
          description: Succès
          content:
            application/json:
              example:
                sexes:
                  - ID_SEXE: '1'
                    NOM: Femme
                  - ID_SEXE: '2'
                    NOM: Homme
                sports:
                  - ID_SPORTIF: '1'
                    NOM: Nulle
                  - ID_SPORTIF: '2'
                    NOM: Ponctuelle
                  - ID_SPORTIF: '3'
                    NOM: Fréquente
                  - ID_SPORTIF: '4'
                    NOM: Intensive
        '404':
          description: Aucune nomenclature trouvée
        '500':
          description: Erreur interne au serveur
  /journal.php:
    get:
      summary: Récupérer les entrées du journal alimentaire
      parameters:
        - in: query
          name: identifiant
          description: Identifiant de l'utilisateur
          required: false
          schema:
            type: string
        - in: query
          name: id_journal
          description: ID de l'entrée du journal
          required: false
          schema:
            type: integer
        - in: query
          name: date1
          description: Date de début pour la recherche
          required: false
          schema:
            type: string
        - in: query
          name: date2
          description: Date de fin pour la recherche
          required: false
          schema:
            type: string
      responses:
        '200':
          description: Succès
          content:
            application/json:
              example:
                - ID_JOURNAL: '5'
                  CODE: '3038359003356'
                  IDENTIFIANT: lil
                  QUANTITE: '1'
                  DATE: '2022-10-12'
                  produit: banzaï noodle saveur poulet
        '404':
          description: Aucune entrée trouvée
        '500':
          description: Erreur interne au serveur
    post:
      summary: Ajouter une entrée au journal alimentaire
      requestBody:
        required: true
        content:
          application/json:
            example:
              code: 3038359003356
              identifiant: lil
              quantite: 1
              date: '2022-10-12'
      responses:
        '200':
          description: Succès
          content:
            application/json:
              example:
                id_journal: 7
        '500':
          description: Erreur interne au serveur
    put:
      summary: Mettre à jour une entrée du journal alimentaire
      requestBody:
        required: true
        content:
          application/json:
            example:
              id_journal: 7
              code: 3038359003356
              quantite: 2
              date: '2022-10-11'
      responses:
        '200':
          description: Succès
          content:
            application/json:
              example:
                id_journal: 7
        '404':
          description: Entrée non trouvée
        '500':
          description: Erreur interne au serveur
    delete:
      summary: Supprimer une entrée du journal alimentaire
      requestBody:
        required: true
        content:
          application/json:
            example:
              id_journal: 7
      responses:
        '200':
          description: Succès
          content:
            application/json:
              example:
                id_journal: 7
        '404':
          description: Entrée non trouvée
        '500':
          description: Erreur interne au serveur

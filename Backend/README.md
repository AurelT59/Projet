Calculs pour les recommendations nutritives par jour : https://www.toutelanutrition.com/wikifit/nutrition/alimentation/calculer-ses-macros -> faire déclencheur SQL
Il faut que énergie soit dans les nutriments, et la valeur et l'unité dans composition_nutritive

Déclencheur SQL :
BEGIN
    DECLARE new_quantite DECIMAL(10, 2);
    DECLARE new_reco DECIMAL(10, 2);
    
    IF NEW.ID_SEXE = 2 THEN
        SET new_quantite = NEW.POIDS * 10 + NEW.TAILLE * 6.25 + NEW.AGE * 5 + 5;
    ELSEIF NEW.ID_SEXE = 1 THEN
        SET new_quantite = NEW.POIDS * 10 + NEW.TAILLE * 6.25 + NEW.AGE * 5 - 161;
    ELSE
        SET new_quantite = 0;
    END IF;
    
    IF NEW.ID_SPORTIF = 1 THEN
        SET new_reco = new_quantite * 1.2;
    ELSEIF NEW.ID_SPORTIF = 2 THEN
        SET new_reco = new_quantite * 1.55;
    ELSEIF NEW.ID_SPORTIF = 3 THEN
        SET new_reco = new_quantite * 1.725;
    ELSE
        SET new_reco = new_quantite;
    END IF;

DELIMITER //
CREATE TRIGGER calcul_calcium
AFTER INSERT ON utilisateurs
FOR EACH ROW
BEGIN
    DECLARE new_quantite DECIMAL(10, 2);
    
    IF NEW.ID_SEXE = 1 THEN
        SET new_quantite = 0.95;
    ELSEIF NEW.ID_SEXE = 2 THEN
        SET new_quantite = 1;
    ELSE
        SET new_quantite = 0;
    END IF;

    INSERT INTO recommendations (IDENTIFIANT, ID_NUTRIMENT, QUANTITE)
    VALUES (NEW.IDENTIFIANT, 1, new_quantite);
END;
//
DELIMITER ;


requêtes http : 

-> ALIMENTS <-

GET :

- body : empty

- exemple return :

[
    {
        "CODE": "3038359003356",
        "PRODUIT": "banzaï noodle saveur poulet",
        "QUANTITE": "60",
        "PORTION": "340",
        "MARQUE": "Lustucru,Panzani",
        "ENERGY": null,
        "ENERGY_UNIT": null,
        "NUTRISCORE_GRADE": "c"
    },
    {
        "CODE": "3181232138345",
        "PRODUIT": "Original burger CHEESE",
        "QUANTITE": "145",
        "PORTION": "145",
        "MARQUE": "Charal",
        "ENERGY": "1204",
        "ENERGY_UNIT": "kJ",
        "NUTRISCORE_GRADE": "d"
    },
    {
        "CODE": "3228857000166",
        "PRODUIT": "Pain 100% mie complet",
        "QUANTITE": "500",
        "PORTION": null,
        "MARQUE": "Harrys",
        "ENERGY": "1053",
        "ENERGY_UNIT": "kJ",
        "NUTRISCORE_GRADE": "c"
    },
    {
        "CODE": "3242272261650",
        "PRODUIT": "XtremBox - Radiatori  Bœuf Sauce au poivre",
        "QUANTITE": "400",
        "PORTION": "400",
        "MARQUE": "Sodebo, pasta xtrem",
        "ENERGY": "698",
        "ENERGY_UNIT": "kJ",
        "NUTRISCORE_GRADE": "c"
    }
]

POST :

- exemple body : 

{
    "code": 0,
    "produit": "pizza 4 fromages",
    "quantite": 500,
    "portion": 250,
    "marque": "sodebo",
    "energy": 1000,
    "energy_unit": "kcal",
    "nutriscore_grade": "C",
    "composition": [
        {
            "id_ingredient": 48,   ATTENTION : L'INGRÉDIENT D'ID 48 DOIT EXISTER DANS LA BDD
            "pourcentage": 75
        },
        {
            "id_ingredient": 49,   ATTENTION : L'INGRÉDIENT D'ID 49 DOIT EXISTER DANS LA BDD
            "pourcentage": 25
        }
    ],
    "labels": [
        {
            "id_categories": 27    ATTENTION : LA CATÉGORIE D'ID 27 DOIT EXISTER DANS LA BDD
        }
    ],
    "composition_nutritive": [
        {
            "id_nutriment": 4,    ATTENTION : LE NUTRIMENT D'ID 4 DOIT EXISTER DANS LA BDD
            "valeur_100": 100,
            "valeur_portion": 250,
            "unite": "g"
        }
    ]
}

- exemple return : 

{
    "code": 0;
}

PUT :

- exemple body :
- exemple return :

DELETE : 


-> UTILISATEURS <-

GET :

- exemple body :

{
    "identifiant" : "test"
}

- exemple return :

[
    {
        "IDENTIFIANT": "test",
        "ID_SPORTIF": "2",
        "ID_SEXE": "1",
        "MOT_DE_PASSE": "xsx",
        "PRENOM": "sqcsq",
        "NOM": "sqcqsc",
        "AGE": "21",
        "POIDS": "90",
        "TAILLE": "180"
    }
]

POST :

- exemple body :

{
    "identifiant": "aurelt",
    "id_sportif": 2,
    "id_sexe": 1,
    "mot_de_passe": "lol",
    "prenom": "Aurel",
    "nom": "Ter",
    "age": 21,
    "poids": 60,
    "taille": 180
}

-exemple return :

{
    "identifiant": "aurelt"
}

PUT :

- exemple body :

{
    "identifiant": "aurelt",
    "id_sportif": 2,
    "id_sexe": 1,
    "mot_de_passe": "nouveau_mot_de_passe",
    "prenom": "Aurel",
    "nom": "Ter",
    "age": 21,
    "poids": 60,
    "taille": 180
}

-exemple return :

{
    "identifiant": "aurelt"
}

DELETE :

- exemple body :

{
    "identifiant": "aurelt"
}

-exemple return :

{
    "identifiant": "aurelt"
}
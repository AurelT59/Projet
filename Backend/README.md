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

GET + code:

-exemple $_GET :

?code=3032220061100

-exemple return :

{
    "aliment": [
        {
            "CODE": "3032220061100",
            "PRODUIT": "PRESIDENT BURGER CHEDDAR EMMENTAL 12 TRANCHES 200g",
            "QUANTITE": "200",
            "PORTION": "30",
            "MARQUE": "Pr\u00e9sident,Lactalis",
            "NUTRISCORE_GRADE": "e"
        }
    ],
    "ingredients": [
        {
            "CODE": "3032220061100",
            "ID_INGREDIENT": "2",
            "POURCENTAGE": "2"
        },
        {
            "CODE": "3032220061100",
            "ID_INGREDIENT": "6",
            "POURCENTAGE": "0"
        },
        {
            "CODE": "3032220061100",
            "ID_INGREDIENT": "7",
            "POURCENTAGE": "0"
        },
        {
            "CODE": "3032220061100",
            "ID_INGREDIENT": "25",
            "POURCENTAGE": "0"
        },
        {
            "CODE": "3032220061100",
            "ID_INGREDIENT": "27",
            "POURCENTAGE": "0"
        },
        {
            "CODE": "3032220061100",
            "ID_INGREDIENT": "31",
            "POURCENTAGE": "50"
        },
        {
            "CODE": "3032220061100",
            "ID_INGREDIENT": "32",
            "POURCENTAGE": "46"
        },
        {
            "CODE": "3032220061100",
            "ID_INGREDIENT": "33",
            "POURCENTAGE": "1"
        },
        {
            "CODE": "3032220061100",
            "ID_INGREDIENT": "34",
            "POURCENTAGE": "1"
        },
        {
            "CODE": "3032220061100",
            "ID_INGREDIENT": "35",
            "POURCENTAGE": "0"
        },
        {
            "CODE": "3032220061100",
            "ID_INGREDIENT": "36",
            "POURCENTAGE": "0"
        },
        {
            "CODE": "3032220061100",
            "ID_INGREDIENT": "37",
            "POURCENTAGE": "0"
        }
    ],
    "categories": [
        {
            "CODE": "3032220061100",
            "ID_NUTRIMENT": "1",
            "VALEUR_100": "0.45",
            "VALEUR_PORTION": "0.135",
            "UNITE": "mg"
        },
        {
            "CODE": "3032220061100",
            "ID_NUTRIMENT": "2",
            "VALEUR_100": "4.5",
            "VALEUR_PORTION": "1.35",
            "UNITE": "g"
        },
        {
            "CODE": "3032220061100",
            "ID_NUTRIMENT": "4",
            "VALEUR_100": "17",
            "VALEUR_PORTION": "5.1",
            "UNITE": "g"
        },
        {
            "CODE": "3032220061100",
            "ID_NUTRIMENT": "7",
            "VALEUR_100": "13.5",
            "VALEUR_PORTION": "4.05",
            "UNITE": "g"
        },
        {
            "CODE": "3032220061100",
            "ID_NUTRIMENT": "8",
            "VALEUR_100": "2.4",
            "VALEUR_PORTION": "0.72",
            "UNITE": "g"
        },
        {
            "CODE": "3032220061100",
            "ID_NUTRIMENT": "9",
            "VALEUR_100": "961",
            "VALEUR_PORTION": "288",
            "UNITE": "kJ"
        }
    ],
    "nutriments": [
        {
            "CODE": "3032220061100",
            "ID_CATEGORIES": "35"
        },
        {
            "CODE": "3032220061100",
            "ID_CATEGORIES": "36"
        },
        {
            "CODE": "3032220061100",
            "ID_CATEGORIES": "37"
        },
        {
            "CODE": "3032220061100",
            "ID_CATEGORIES": "38"
        },
        {
            "CODE": "3032220061100",
            "ID_CATEGORIES": "39"
        },
        {
            "CODE": "3032220061100",
            "ID_CATEGORIES": "40"
        },
        {
            "CODE": "3032220061100",
            "ID_CATEGORIES": "41"
        },
        {
            "CODE": "3032220061100",
            "ID_CATEGORIES": "42"
        }
    ]
}

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

- exemple body :
- exemple return :


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
    "identifiant_actuel": "aurelt",
    "identifiant_nouveau": "aurelt",
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


-> NOMENCLATURE <-

GET:

-exemple return :

{
    "ingredients": [
        {
            "ID_INGREDIENT": "2",
            "NOM": "eau"
        },
        {
            "ID_INGREDIENT": "6",
            "NOM": "sel"
        },
        {
            "ID_INGREDIENT": "7",
            "NOM": "arôme"
        },
        {
            "ID_INGREDIENT": "25",
            "NOM": "colorant"
        },
        {
            "ID_INGREDIENT": "27",
            "NOM": "correcteur d'acidité"
        },
        {
            "ID_INGREDIENT": "31",
            "NOM": "LAIT écrémé reconstitué"
        },
        {
            "ID_INGREDIENT": "32",
            "NOM": "fromages"
        },
        {
            "ID_INGREDIENT": "33",
            "NOM": "beurre",
            "CODE": "3032220061100",
            "POURCENTAGE": "1"
        },
        {
            "ID_INGREDIENT": "34",
            "NOM": "lactosérum",
            "CODE": "3032220061100",
            "POURCENTAGE": "1"
        },
        {
            "ID_INGREDIENT": "35",
            "NOM": "protéines de LAIT",
            "CODE": "3032220061100",
            "POURCENTAGE": "0"
        },
        {
            "ID_INGREDIENT": "36",
            "NOM": "sel de fonte",
            "CODE": "3032220061100",
            "POURCENTAGE": "0"
        },
        {
            "ID_INGREDIENT": "37",
            "NOM": "épaississant",
            "CODE": "3032220061100",
            "POURCENTAGE": "0"
        }
    ],
    "categories": [
        {
            "ID_CATEGORIES": "35",
            "NOM": "Produits laitiers",
            "CODE": "3032220061100"
        },
        {
            "ID_CATEGORIES": "36",
            "NOM": " Produits fermentés",
            "CODE": "3032220061100"
        },
        {
            "ID_CATEGORIES": "37",
            "NOM": " Produits laitiers fermentés",
            "CODE": "3032220061100"
        },
        {
            "ID_CATEGORIES": "38",
            "NOM": " Fromages",
            "CODE": "3032220061100"
        },
        {
            "ID_CATEGORIES": "39",
            "NOM": " Fromages de vache",
            "CODE": "3032220061100"
        },
        {
            "ID_CATEGORIES": "40",
            "NOM": " Frais",
            "CODE": "3032220061100"
        },
        {
            "ID_CATEGORIES": "41",
            "NOM": " Fromages en tranches",
            "CODE": "3032220061100"
        },
        {
            "ID_CATEGORIES": "42",
            "NOM": " Fromages fondus",
            "CODE": "3032220061100"
        }
    ],
    "nutriments": [
        {
            "ID_NUTRIMENT": "1",
            "NOM": "Calcium",
            "NOM_EN": "calcium",
            "CODE": "3032220061100",
            "VALEUR_100": "0.45",
            "VALEUR_PORTION": "0.135",
            "UNITE": "mg"
        },
        {
            "ID_NUTRIMENT": "2",
            "NOM": "Glucides",
            "NOM_EN": "carbohydrates",
            "CODE": "3032220061100",
            "VALEUR_100": "4.5",
            "VALEUR_PORTION": "1.35",
            "UNITE": "g"
        },
        {
            "ID_NUTRIMENT": "4",
            "NOM": "Matières grasses",
            "NOM_EN": "fat",
            "CODE": "3032220061100",
            "VALEUR_100": "17",
            "VALEUR_PORTION": "5.1",
            "UNITE": "g"
        },
        {
            "ID_NUTRIMENT": "7",
            "NOM": "Protéines",
            "NOM_EN": "proteins",
            "CODE": "3032220061100",
            "VALEUR_100": "13.5",
            "VALEUR_PORTION": "4.05",
            "UNITE": "g"
        },
        {
            "ID_NUTRIMENT": "8",
            "NOM": "Sel",
            "NOM_EN": "salt",
            "CODE": "3032220061100",
            "VALEUR_100": "2.4",
            "VALEUR_PORTION": "0.72",
            "UNITE": "g"
        },
        {
            "ID_NUTRIMENT": "9",
            "NOM": "Énergie",
            "NOM_EN": "energy",
            "CODE": "3032220061100",
            "VALEUR_100": "961",
            "VALEUR_PORTION": "288",
            "UNITE": "kJ"
        }
    ]
}
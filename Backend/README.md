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

ALIMENTS

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


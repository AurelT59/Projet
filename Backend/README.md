Calculs pour les recommendations nutritives par jour : https://www.toutelanutrition.com/wikifit/nutrition/alimentation/calculer-ses-macros -> faire déclencheur SQL
Il faut que énergie soit dans les nutriments, et la valeur et l'unité dans composition_nutritive

requêtes http : 

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


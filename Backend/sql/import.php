<?php
//URL à récup : https://world.openfoodfacts.org/api/v2/product/737628064502.json


require_once('../init_pdo.php');

// URL du JSON
$url = 'https://world.openfoodfacts.org/api/v2/product/5053990155354.json';

/*TEST
$sql = "SELECT * FROM nutriments";
$request = $pdo->prepare($sql);
$request->execute();
$res = $request->fetchAll(PDO::FETCH_OBJ);
print_r($res);*/


$json_data = file_get_contents($url);

if ($json_data === false) {
    die('Échec de la récupération du JSON');
}

$data = json_decode($json_data, true);
if ($data === null) {
    die('Échec du décodage du JSON');
}

//Table aliments
$code = $data['code'];
$nom_produit = $data['product']['product_name'];
$quantite = $data['product']['product_quantity'];
$portion = $data['product']['serving_quantity'];
$marque = $data['product']['brands'];
$energie_kcal = $data['product']['nutriments']['energy-kcal_value'];
$nutriscore = end($data['product']['nutriscore'])['grade'];
$categories = (string)$data['product']['categories'];

//Insertion de l'aliment dans la BDD
$sql = "INSERT INTO `aliments` (`CODE`, `PRODUIT`, 
`QUANTITE`, `PORTION`, `MARQUE`, `ENERGY_KCAL_VALUE`, `NUTRISCORE_GRADE`, `CATEGORIES`) VALUES ('" . $code . "','" .
    $nom_produit . "','" . $quantite . "','" . $portion . "','" . $marque . "','" . $energie_kcal . "','" . $nutriscore . "','" . $categories . "')";
$request = $pdo->prepare($sql);
$success = $request->execute();
print_r($success);

//Table composition
$tab = $data['product']['ingredients'];
$tab_ingredients_compo = [];
for ($i = 0; $i < count($tab); $i++) {
    array_push($tab_ingredients_compo, [$tab[$i]['text'], $tab[$i]['percent_estimate']]);
}

print_r($tab_ingredients_compo);


//Table nutriments

//A été utilisé pour insérer les nutriments dans la BDD
/*
$tab_nutriments = [
    ['Calcium', 'calcium'], ['Glucides', 'carbohydrates'],
    ['Cholestérol', 'cholesterol'], ['Matières grasses', 'fat'], ['Fibres', 'fiber'],
    ['Fer', 'iron'], ['Protéines', 'proteins'], ['Sel', 'salt']
];


for ($i = 0; $i < count($tab_nutriments); $i++) {
    $sql = "INSERT INTO nutriments (nom,nom_en) VALUES (:nom,:nomen)";
    $request = $pdo->prepare($sql);
    $request->bindParam(':nom', $tab_nutriments[$i][0]);
    $request->bindParam(':nomen', $tab_nutriments[$i][1]);
    $request->execute();
}
*/

//Permet de récupérer la table des nutriments
$sql = "SELECT * FROM nutriments";
$request = $pdo->prepare($sql);
$request->execute();
$tab_nutriments = $request->fetchAll(PDO::FETCH_OBJ);

//Table composition nutritive
$tab = $data['product']['nutriments'];
$tab_nutriments_compo = [];
for ($i = 0; $i < count($tab_nutriments); $i++) {
    $id_nutriment = $tab_nutriments[$i]->ID_NUTRIMENT;
    $nom_en = $tab_nutriments[$i]->NOM_EN;
    if (isset($tab[$nom_en])) {
        array_push($tab_nutriments_compo, [$id_nutriment, $tab[$nom_en], $tab[$nom_en . '_serving'], $tab[$nom_en . '_unit']]);
    }
}


print_r($tab_nutriments_compo);

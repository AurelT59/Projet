<?php
//URL à récup : https://world.openfoodfacts.org/api/v2/product/737628064502.json


require_once('../init_pdo.php');

// URL du JSON
$code_barre = "3228857000166";
$url = 'https://world.openfoodfacts.org/api/v2/product/' . $code_barre . '.json';



$json_data = file_get_contents($url);

if ($json_data === false) {
    die('Échec de la récupération du JSON');
}

$data = json_decode($json_data, true);
if ($data === null) {
    die('Échec du décodage du JSON');
}

//Permet de vérifier si la valeur existe dans le json transmis par OpenFoodFacts
function exist($key, $val)
{
    if (array_key_exists($key, $val)) {
        return "'" . addslashes($val[$key]) . "'";
    } else {
        return "NULL";
    }
}

//----------------------------------------------------------------------------------------------------

//Table aliments
$code = $data['code'];
$nom_produit = exist('product_name', $data['product']);
$quantite = exist('product_quantity', $data['product']);
$portion = exist('serving_quantity', $data['product']);
$marque = exist('brands', $data['product']);
$energy = exist('energy', $data['product']['nutriments']);
$energy_unit = exist('energy_unit', $data['product']['nutriments']);
$nutriscore = exist('grade', end($data['product']['nutriscore']));
$categories = $data['product']['categories'];

//Insertion de l'aliment dans la BDD
$sql = "INSERT INTO `aliments` (`CODE`, `PRODUIT`, 
`QUANTITE`, `PORTION`, `MARQUE`, `ENERGY`, `ENERGY_UNIT`, `NUTRISCORE_GRADE`) VALUES ('" . $code . "'," .
    $nom_produit . "," . $quantite . "," . $portion . "," . $marque . "," . $energy . "," . $energy_unit . "," . $nutriscore . ")";
$request = $pdo->prepare($sql);
$success = $request->execute();


//----------------------------------------------------------------------------------------------------

//Table composition
$tab = $data['product']['ingredients'];

//Gestion si l'ingrédient existe déjà ou non
for ($i = 0; $i < count($tab); $i++) {
    $sql = "SELECT ID_INGREDIENT FROM `ingredients` WHERE NOM = '" . addslashes($tab[$i]['text']) . "'";
    $request = $pdo->prepare($sql);
    $request->execute();
    $tab_id = $request->fetchAll(PDO::FETCH_OBJ);

    //Problème : j'utilise le nom pour le trouver, 
    //et ce n'est pas unique (si il y a plusieurs fois le même nom, alors je sélectionne le premier)
    if (count($tab_id) == 0) {
        $sql = "INSERT INTO `ingredients` (`NOM`) VALUES ('" . addslashes($tab[$i]['text']) . "')";
        $request = $pdo->prepare($sql);
        $request->execute();


        $sql = "SELECT ID_INGREDIENT FROM `ingredients` WHERE NOM = '" . addslashes($tab[$i]['text']) . "'";
        $request = $pdo->prepare($sql);
        $request->execute();
        $tab_id = $request->fetchAll(PDO::FETCH_OBJ);
    }

    $id = $tab_id[0]->ID_INGREDIENT;

    //Insertion dans la table composition dans la BDD
    $sql = "INSERT INTO `composition` (`CODE`, `ID_INGREDIENT`, `POURCENTAGE`) 
    VALUES ('" . $code . "', '" . $id . "', '" . $tab[$i]['percent_estimate'] . "')";
    $request = $pdo->prepare($sql);
    $success = $request->execute();
}


//----------------------------------------------------------------------------------------------------


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

//----------------------------------------------------------------------------------------------------

//Permet de récupérer la table des nutriments
$sql = "SELECT * FROM nutriments";
$request = $pdo->prepare($sql);
$request->execute();
$tab_nutriments = $request->fetchAll(PDO::FETCH_OBJ);

//Table composition nutritive
$tab = $data['product']['nutriments'];
for ($i = 0; $i < count($tab_nutriments); $i++) {
    $id_nutriment = $tab_nutriments[$i]->ID_NUTRIMENT;
    $nom_en = $tab_nutriments[$i]->NOM_EN;
    if (isset($tab[$nom_en])) {
        $sql = "INSERT INTO `composition_nutritive` (`CODE`, `ID_NUTRIMENT`, 
        `VALEUR_100`, `VALEUR_PORTION`, `UNITE`) VALUES ('" . $code . "', '" . $id_nutriment . "',
         " . exist($nom_en, $tab) . ", " . exist($nom_en . '_serving', $tab) . ", " . exist($nom_en . '_unit', $tab) . ")";
        $request = $pdo->prepare($sql);
        $success = $request->execute();
    }
}


//----------------------------------------------------------------------------------------------------


//Table catégories
$tab = explode(',', $categories);

//Gestion si la catégorie existe déjà ou non
for ($i = 0; $i < count($tab); $i++) {
    $sql = "SELECT ID_CATEGORIES FROM `categories` WHERE NOM = '" . addslashes($tab[$i]) . "'";
    $request = $pdo->prepare($sql);
    $request->execute();
    $tab_id = $request->fetchAll(PDO::FETCH_OBJ);

    //Problème : j'utilise le nom pour le trouver, 
    //et ce n'est pas unique (si il y a plusieurs fois le même nom, alors je sélectionne le premier)
    if (count($tab_id) == 0) {
        $sql = "INSERT INTO `categories` (`NOM`) VALUES ('" . addslashes($tab[$i]) . "')";
        $request = $pdo->prepare($sql);
        $request->execute();
        print_r($sql);


        $sql = "SELECT ID_CATEGORIES FROM `categories` WHERE NOM = '" . addslashes($tab[$i]) . "'";
        $request = $pdo->prepare($sql);
        $request->execute();
        $tab_id = $request->fetchAll(PDO::FETCH_OBJ);
    }

    $id = $tab_id[0]->ID_CATEGORIES;

    //Insertion dans la table labels dans la BDD
    $sql = "INSERT INTO `labels` (`CODE`, `ID_CATEGORIES`) 
    VALUES ('" . $code . "', '" . $id . "')";
    $request = $pdo->prepare($sql);
    $success = $request->execute();
}


//Fermeture de la connexion
$pdo = null;

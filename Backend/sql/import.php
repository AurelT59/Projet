<?php
/* Cette page n'est pas utilisée dans l'application.
Elle nous a uniquement servie à importer les données de openfoodfacts dans 
notre base de données.
*/


require_once('../init_pdo.php');

//Permet de vérifier si la valeur existe dans le json transmis par OpenFoodFacts
function exist($key, $val)
{
    if (array_key_exists($key, $val)) {
        return "'" . addslashes($val[$key]) . "'";
    } else {
        return "NULL";
    }
}

//Tableau de codes à insérer dans la bdd
$codes_barre =  [
    "3329770075405", "3033490005221", "3023290797365", "3322680010818", "3017760756198", "3083681095319", "3329770063624"
];


for ($k = 0; $k < count($codes_barre); $k++) {
    try {
        $code_barre = $codes_barre[$k];

        // URL du JSON
        $url = 'https://world.openfoodfacts.org/api/v2/product/' . $code_barre . '.json';


        $json_data = file_get_contents($url);

        if ($json_data === false) {
            die('Échec de la récupération du JSON');
        }

        $data = json_decode($json_data, true);
        if ($data === null) {
            die('Échec du décodage du JSON');
        }

        //----------------------------------------------------------------------------------------------------

        //Table aliments
        $code = $data['code'];
        $nom_produit = exist('product_name', $data['product']);
        $quantite = exist('product_quantity', $data['product']);
        $portion = exist('serving_quantity', $data['product']);
        $marque = exist('brands', $data['product']);
        $nutriscore = exist('grade', end($data['product']['nutriscore']));
        $categories = $data['product']['categories'];

        //Insertion de l'aliment dans la BDD
        $sql = "INSERT INTO `aliments` (`CODE`, `PRODUIT`, 
`QUANTITE`, `PORTION`, `MARQUE`, `NUTRISCORE_GRADE`) VALUES ('" . $code . "'," .
            $nom_produit . "," . $quantite . "," . $portion . "," . $marque . "," . $nutriscore . ")";
        $request = $pdo->prepare($sql);
        $success = $request->execute();


        //----------------------------------------------------------------------------------------------------

        //Table composition
        if (array_key_exists('ingredients', $data['product'])) {
            $tab = $data['product']['ingredients'];

            //Gestion si l'ingrédient existe déjà ou non
            for ($i = 0; $i < count($tab); $i++) {
                $sql = "SELECT ID_INGREDIENT FROM `ingredients` WHERE NOM = '" . addslashes($tab[$i]['text']) . "'";
                $request = $pdo->prepare($sql);
                $request->execute();
                $tab_id = $request->fetchAll(PDO::FETCH_OBJ);


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
        }

        //----------------------------------------------------------------------------------------------------


        //Table nutriments

        //A été utilisé pour insérer les nutriments dans la BDD
        /*
$tab_nutriments = [
    ['Calcium', 'calcium'], ['Glucides', 'carbohydrates'],
    ['Cholestérol', 'cholesterol'], ['Matières grasses', 'fat'], ['Fibres', 'fiber'],
    ['Fer', 'iron'], ['Protéines', 'proteins'], ['Sel', 'salt'],['Energie', 'energy']
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
    } catch (Exception $e) {
        // En cas d'erreur, affiche l'erreur
        echo "Erreur SQL : " . $e->getMessage() . PHP_EOL;
        continue;
    }
}

//Fermeture de la connexion
$pdo = null;

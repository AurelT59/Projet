<?php

// JOIN composition ON aliments.code = composition.code
// JOIN ingredients ON composition.id_ingredient = ingredients.id_ingredient
// JOIN labels ON aliments.code = labels.code
// JOIN categories ON labels.id_categories = categories.id_categories
// JOIN composition_nutritive ON aliments.code = composition_nutritive.code
// JOIN nutriments ON composition_nutritive.id_nutriment = nutriments.id_nutriment

header("Content-Type: application/json");
header("Access-Control-Allow-Origin: *");

require_once('init_pdo.php');

switch ($_SERVER['REQUEST_METHOD']) {
    case 'GET':

        if (isset($_GET['code'])) {
            //FAIRE UN GET POUR UN CODE
        } else {
            $data = "";

            $request = $pdo->prepare("SELECT * FROM aliments");
            $request->execute();
            $result = $request->fetchAll(PDO::FETCH_OBJ);

            checkAndResponse($request, $result, $data);
            break;
        }

    case 'POST':

        $data = json_decode(file_get_contents("php://input"), true);

        $data_composition = $data['composition'];
        $data_labels = $data['labels'];
        $data_composition_nutritive = $data['composition_nutritive'];
        // $data_ingredients = $data['ingredients'];
        // $data_categoriess = $data['categories'];

        $request_1 = $pdo->exec("INSERT INTO `aliments` (`code`, `produit`, `quantite`, `portion`, `marque`, `nutriscore_grade`)
                              VALUES ('" . $data['code'] . "','" . $data['produit'] . "','" . $data['quantite'] . "','" . $data['portion'] . "','" . $data['marque'] . "','" . $data['nutriscore_grade'] . "')");

        foreach ($data_composition as $composition) {
            $request_2 = $pdo->exec("INSERT INTO `composition` (`code`, `id_ingredient`, `pourcentage`)
                                  VALUES ('" . $data['code'] . "','" . $composition['id_ingredient'] . "','" . $composition['pourcentage'] . "')");
        }

        foreach ($data_labels as $label) {
            $request_3 = $pdo->exec("INSERT INTO `labels` (`code`, `id_categories`)
                                  VALUES ('" . $data['code'] . "','" . $label['id_categories'] . "')");
        }

        foreach ($data_composition_nutritive as $composition_nutritive) {
            $request_4 = $pdo->exec("INSERT INTO `composition_nutritive` (`code`, `id_nutriment`, `valeur_100`, `valeur_portion`, `unite`)
                                 VALUES ('" . $data['code'] . "','" . $composition_nutritive['id_nutriment'] . "','" . $composition_nutritive['valeur_100'] . "','" . $composition_nutritive['valeur_portion'] . "','" . $composition_nutritive['unite'] . "')");
        }

        // foreach ($data_ingredient as $ingredient) {

        //     $check_request_1 = $pdo->prepare("SELECT * FROM aliments WHERE 'nom' = " . $ingredient['nom']);
        //     $check_request_1->execute();
        //     $check_result_1 = $check_request_1->fetchAll(PDO::FETCH_OBJ);

        //     if $result

        //     $request_5 = $pdo->exec("INSERT INTO `ingredient` (`nom`)
        //                          VALUES ('" . $data['code'] . "','" . $ingredient['id_nutriment'] . "','" . $nutriment['valeur_100'] . "','" . $nutriment['valeur_portion'] . "','" . $nutriment['unite'] . "')");
        // }


        $total_request = true;
        if ($request_1 == false || $request_2 == false || $request_3 == false || $request_4 == false) {
            $total_request = false;
        }

        $result = "";

        checkAndResponse($total_request, $result, $data);
        break;

    case 'PUT':

        $data = json_decode(file_get_contents("php://input"), true);

        // $request = $pdo->prepare("UPDATE users SET name = '" . $data['name'] . "', email = '" . $data['mail'] . "' WHERE id = " . $data['id']);
        // $request->execute();

        $request_1 = $pdo->exec("UPDATE aliments SET produit = '" . $data['produit'] . "', quantite = '" . $data['quantite'] . "', portion = '" . $data['portion'] . "', marque = '" . $data['marque'] . "', nutriscore_grade = '" . $data['nutriscore_grade'] . "' WHERE code = " . $data['code']);

        foreach ($data_composition as $composition) {
            $request_2 = $pdo->exec("UPDATE composition SET pourcentage = '" . $composition['pourcentage'] . "' WHERE code = '" . $data['code'] . "' AND id_ingredient = '" . $composition['id_ingredient']);
        }

        foreach ($data_labels as $label) {
            $request_3 = $pdo->exec("UPDATE labels SET code = '" . $data['code'] . "', id_categories = '" . $labels['id_categories'] . "'");
        }

        foreach ($data_composition_nutritive as $composition_nutritive) {
            $request_4 = $pdo->exec("UPDATE composition_nutritive SET code = '" . $data['code'] . "', id_nutriment = '" . $composition_nutritive['id_nutriment'] . "', valeur_100 = '" . $composition_nutritive['valeur_100'] . "', valeur_portion = '" . $composition_nutritive['valeur_portion'] . "', unite = '" . $composition_nutritive['unite'] . "'");
        }

        $result = "";

        checkAndResponse($request, $result, $data);
        break;

    case 'DELETE':
        $data = json_decode(file_get_contents("php://input"), true);

        $request = $pdo->prepare("DELETE FROM `aliments` WHERE `code` = " . $data['code']);
        $request->execute();
        $result = $request->fetchAll(PDO::FETCH_OBJ);

        checkAndResponse($request, $result, $data);
        break;

    default:
        http_response_code(405);
        echo json_encode(array('message' => 'Méthode non autorisée'));
        break;
}


// gestion de la réponse à la requête
function checkAndResponse($request, $result, $data)
{

    if (($result == null && $_SERVER['REQUEST_METHOD'] == 'GET') | ($request == false && $_SERVER['REQUEST_METHOD'] != 'POST')) {
        // Aucune donnée trouvée, renvoyer un statut 404 - Not Found
        http_response_code(404);
        echo json_encode(array('message' => "Aucun aliment trouvé."));
    } else if ($request == true || $request != 0) {
        // Les données ont été récupérées avec succès, renvoyer un statut 200 - OK
        http_response_code(200);
        if ($_SERVER['REQUEST_METHOD'] == 'GET') {
            echo json_encode($result);
        } else {
            echo json_encode(array('code' => $data['code']));
        }
    } else {
        // Erreur de la requête SQL, renvoyer un statut 500 - Internal Server Error
        http_response_code(500);
        echo json_encode(array('message' => "Erreur interne du serveur."));
    }
}

// function existsIngredient($data_composition)
// {
    
// }

// function existsCategories($data_labels)
// {
// }

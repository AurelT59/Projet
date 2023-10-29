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

        $data = "";

        $request = $pdo->prepare("SELECT * FROM aliments");
        $request->execute();
        $result = $request->fetchAll(PDO::FETCH_OBJ);

        checkAndResponse($request, $result, $data);
        break;

    case 'POST':

        $data = json_decode(file_get_contents("php://input"), true);

        $data_composition = $data['composition'];
        $data_labels = $data['labels'];
        $data_composition_nutritive = $data['composition_nutritive'];

        $request_1 = $pdo->exec("INSERT INTO `aliments` (`code`, `produit`, `quantite`, `portion`, `marque`, `energy`, `energy_unit`, `nutriscore_grade`)
                              VALUES ('" . $data['code'] . "','" . $data['produit'] . "','" . $data['quantite'] . "','" . $data['portion'] . "','" . $data['marque'] . "','" . $data['energy'] . "','" . $data['energy_unit'] . "','" . $data['nutriscore_grade'] . "')");

        foreach ($data_composition as $ingredient) {
            $request_2 = $pdo->exec("INSERT INTO `composition` (`code`, `id_ingredient`, `pourcentage`)
                                  VALUES ('" . $data['code'] . "','" . $ingredient['id_ingredient'] . "','" . $ingredient['pourcentage'] . "')");
        }

        foreach ($data_labels as $categorie) {
            $request_3 = $pdo->exec("INSERT INTO `labels` (`code`, `id_categories`)
                                  VALUES ('" . $data['code'] . "','" . $categorie['id_categories'] . "')");
        }

        foreach ($data_composition_nutritive as $nutriment) {
            $request_4 = $pdo->exec("INSERT INTO `composition_nutritive` (`code`, `id_nutriment`, `valeur_100`, `valeur_portion`, `unite`)
                                 VALUES ('" . $data['code'] . "','" . $nutriment['id_nutriment'] . "','" . $nutriment['valeur_100'] . "','" . $nutriment['valeur_portion'] . "','" . $nutriment['unite'] . "')");
        }

        $request = true;
        if ($request_1 == false || $request_2 == false || $request_3 == false || $request_4 == false) {
            $request = false;
        }

        $result = "";

        checkAndResponse($request, $result, $data);
        break;

    case 'PUT':

        $data = json_decode(file_get_contents("php://input"), true);

        // $request = $pdo->prepare("UPDATE users SET name = '" . $data['name'] . "', email = '" . $data['mail'] . "' WHERE id = " . $data['id']);
        // $request->execute();
        $result = $request->fetchAll(PDO::FETCH_OBJ);

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

    if (empty($result) & $_SERVER['REQUEST_METHOD'] != 'POST') {
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

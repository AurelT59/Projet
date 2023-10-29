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

        $data_aliments = $data[0];
        $data_composition = $data[1];
        $data_labels = $data[2];
        $data_composition_nutritive = $data[3];

        $result = $pdo->exec("INSERT INTO `aliments` (`code`, `produit`, `quantite`, `portion`, `marque`, `energy`, `energy_unit`, `nutriscore_grade`)
                              VALUES ('" . $data_aliments['code'] . "','" . $data_aliments['produit'] . "','" . $data_aliments['quantite'] . "','" . $data_aliments['portion'] . "','" . $data_aliments['marque'] . "','" . $data_aliments['energy'] . "','" . $data_aliments['energy_unit'] . "','" . $data_aliments['nutriscore_grade'] . "')");

        foreach ($data_composition as $ingredient) {
            $result = $pdo->exec("INSERT INTO `composition` (`code`, `id_ingredient`, `pourcentage`)
                                  VALUES ('" . $data_aliments['code'] . "','" . $ingredient['id_ingredient'] . "','" . $ingredient['pourcentage'] . "')");
        }

        foreach ($data_labels as $categorie) {
            $result = $pdo->exec("INSERT INTO `labels` (`code`, `id_categories`)
                                  VALUES ('" . $data_aliments['code'] . "','" . $categorie['id_categories'] . "')");
        }

        foreach ($data_composition_nutritive as $nutriment) {
            $result = $pdo->exec("INSERT INTO `composition_nutritive` (`code`, `id_nutriments`, `valeur_100`, `valeur_portion`, `unite`)
                                 VALUES ('" . $data_aliments['code'] . "','" . $nutriment['id_nutriments'] . "','" . $nutriment['valeur_100'] . "','" . $nutriment['valeur_portion'] . "','" . $nutriment['unite'] . "')");
        }

        // $request = $pdo->prepare("
        //     INSERT INTO `aliments` (`code`, `produit`, `quantite`, `portion`, `marque`, `energy`, `energy_unit`, `nutriscore_grade`)
        //     VALUES ('" . $data['code'] . "','" . $data['produit'] . "','" . $data['quantite'] . "','" . $data['portion'] . "','" . $data['marque'] . "','" . $data['energy'] . "','" . $data['energy_unit'] . "','" . $data['nutriscore_grade'] . "');
        //     INSERT INTO `composition` (`code`, `id_ingredient`, `pourcentage`)
        //     VALUES ('" . $data['code'] . "','" . $data['id_ingredient'] . "','" . $data['pourcentage'] . "');
        //     INSERT INTO `labels` (`code`, `id_categories`)
        //     VALUES ('" . $data['code'] . "','" . $data['id_categories'] . "');
        //     INSERT INTO `composition_nutritive` (`code`, `id_nutriments`, `valeur_100`, `valeur_portion`, `unite`)
        //     VALUES ('" . $data['code'] . "','" . $data['id_nutriments'] . "','" . $data['valeur_100'] . "','" . $data['valeur_portion'] . "','" . $data['unite'] . "');
        // ");
        // $request->execute();

        $result = $request->fetchAll(PDO::FETCH_OBJ);

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
    } else if ($request) {
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

<?php

header("Content-Type: application/json");
header("Access-Control-Allow-Origin: *");

require_once('init_pdo.php');

switch ($_SERVER['REQUEST_METHOD']) {
    case 'GET':

        $data = "";

        $request_ingredients = $pdo->prepare("SELECT * FROM ingredients WHERE 'code' = " . $data['code']);
        $request_ingredients->execute();
        $result_ingredients = $request->fetchAll(PDO::FETCH_OBJ);

        $request_categories = $pdo->prepare("SELECT * FROM categories WHERE 'code' = " . $data['code']);
        $request_categories->execute();
        $result_categories = $request->fetchAll(PDO::FETCH_OBJ);

        $request_nutriments = $pdo->prepare("SELECT * FROM nutriments WHERE 'code' = " . $data['code']);
        $request_nutriments->execute();
        $result_nutriments = $request->fetchAll(PDO::FETCH_OBJ);

        $result_nomenclature = $result_ingredients + $result_categories + $result_nutriments;

        checkAndResponse($request, $result_nomenclature, $data);
        break;
    default:
        http_response_code(405);
        echo json_encode(array('message' => 'Méthode non autorisée'));
        break;
}


// gestion de la réponse à la requête
function checkAndResponse($request, $result, $data)
{

    if (($result == null & $_SERVER['REQUEST_METHOD'] = 'GET') | ($request == false & $_SERVER['REQUEST_METHOD'] != 'POST')) {
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

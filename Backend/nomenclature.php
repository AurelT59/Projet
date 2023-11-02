<?php

header("Content-Type: application/json");
header("Access-Control-Allow-Origin: *");

require_once('init_pdo.php');

switch ($_SERVER['REQUEST_METHOD']) {
    case 'GET':

        $data = json_decode(file_get_contents("php://input"), true);

        $request_ingredients = $pdo->prepare("SELECT * 
                                              FROM ingredients 
                                              JOIN composition ON ingredients.id_ingredient = composition.id_ingredient 
                                              WHERE composition.code = " . $data['code']);
        $request_ingredients->execute();
        $result_ingredients = $request_ingredients->fetchAll(PDO::FETCH_OBJ);

        $request_categories = $pdo->prepare("SELECT * 
                                             FROM categories 
                                             JOIN labels ON categories.id_categories = labels.id_categories
                                             WHERE labels.code = " . $data['code']);
        $request_categories->execute();
        $result_categories = $request_categories->fetchAll(PDO::FETCH_OBJ);

        $request_nutriments = $pdo->prepare("SELECT * 
                                             FROM nutriments 
                                             JOIN composition_nutritive ON nutriments.id_nutriment = composition_nutritive.id_nutriment
                                             WHERE composition_nutritive.code = " . $data['code']);
        $request_nutriments->execute();
        $result_nutriments = $request_nutriments->fetchAll(PDO::FETCH_OBJ);

        $total_request = true;
        if ($request_ingredients == false || $request_categories == false || $request_nutriments == false) {
            $total_request = false;
        }

        $result_nomenclature = [
            'ingredients' => $result_ingredients,
            'categories' => $result_categories,
            'nutriments' => $result_nutriments
        ];

        http_response_code(200);
        echo json_encode($result_nomenclature);

        // checkAndResponse($total_request, $result_nomenclature, $data);
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

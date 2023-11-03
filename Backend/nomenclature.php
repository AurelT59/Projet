<?php

header("Content-Type: application/json");
header("Access-Control-Allow-Origin: *");

require_once('init_pdo.php');

switch ($_SERVER['REQUEST_METHOD']) {
    case 'GET':

        $request_ingredients = $pdo->prepare("SELECT * 
                                              FROM ingredients");
        $request_ingredients->execute();


        $request_categories = $pdo->prepare("SELECT * 
                                             FROM categories");
        $request_categories->execute();

        $request_nutriments = $pdo->prepare("SELECT * 
                                             FROM nutriments");
        $request_nutriments->execute();

        if ($request_ingredients == false || $request_categories == false || $request_nutriments == false) {

            // Erreur de la requête SQL, renvoyer un statut 500 - Internal Server Error
            http_response_code(500);
            echo json_encode(array('message' => "Echec de la requête SQL : Erreur interne au serveur."));
        } else {

            $result_ingredients = $request_ingredients->fetchAll(PDO::FETCH_OBJ);
            $result_categories = $request_categories->fetchAll(PDO::FETCH_OBJ);
            $result_nutriments = $request_nutriments->fetchAll(PDO::FETCH_OBJ);

            if (empty($result_ingredients) & empty($result_categories) & empty($result_nutriments)) {

                // Aucune donnée trouvée, renvoyer un statut 404 - Not Found
                http_response_code(404);
                echo json_encode(array('message' => "Impossible d'afficher la liste, aucun aliment trouvé."));
            } else {

                $result_nomenclature = [
                    'ingredients' => $result_ingredients,
                    'categories' => $result_categories,
                    'nutriments' => $result_nutriments
                ];

                // Les données ont été récupérées avec succès, renvoyer un statut 200 - OK
                http_response_code(200);
                echo json_encode($result_nomenclature);
            }
        }
        break;
    default:
        http_response_code(405);
        echo json_encode(array('message' => 'Méthode non autorisée'));
        break;
}

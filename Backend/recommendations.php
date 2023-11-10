<?php

header("Content-Type: application/json");
header("Access-Control-Allow-Origin: *");

require_once('init_pdo.php');

switch ($_SERVER['REQUEST_METHOD']) {
    case 'GET':

        $data = "";

        try {
            $request = $pdo->prepare("SELECT recommendations.*, nutriments.nom FROM recommendations JOIN nutriments ON nutriments.ID_NUTRIMENT=recommendations.ID_NUTRIMENT WHERE IDENTIFIANT = '" . $_GET['identifiant'] . "'");
            $request->execute();
        } catch (PDOException $e) {
            http_response_code(500);
            echo json_encode(array('message' => "Une erreur est survenue dans la base de données."));
        }

        checkAndResponse($request, $data);
        break;
}


// gestion de la réponse à la requête
function checkAndResponse($request, $data)
{
    if (is_bool($request)) {

        // Erreur de la requête SQL, renvoyer un statut 500 - Internal Server Error
        http_response_code(500);
        echo json_encode(array('message' => "Echec de la requête SQL : Erreur interne au serveur."));
    } else {

        if ($_SERVER['REQUEST_METHOD'] == 'GET') {
            $result = $request->fetchAll(PDO::FETCH_OBJ);
        }

        if ((empty($result) && $_SERVER['REQUEST_METHOD'] == 'GET') || ($request == 0)) {

            // Aucune donnée trouvée, renvoyer un statut 404 - Not Found
            http_response_code(404);
            echo json_encode(array('message' => "Aucun utilisateur trouvé."));
        } else {

            // Les données ont été récupérées avec succès, renvoyer un statut 200 - OK
            http_response_code(200);

            if ($_SERVER['REQUEST_METHOD'] == 'GET') {
                echo json_encode($result);
            } else {
                echo json_encode(array('id_journal' => $data['id_journal']));
            }
        }
    }
}

<?php

header("Content-Type: application/json");
header("Access-Control-Allow-Origin: *");

require_once('init_pdo.php');

switch ($_SERVER['REQUEST_METHOD']) {
    case 'GET':

        try {
            $request_sexe = $pdo->prepare("SELECT * 
                                              FROM sexe");
            $request_sexe->execute();


            $request_sport = $pdo->prepare("SELECT * 
                                             FROM pratique_sportive");
            $request_sport->execute();
        } catch (PDOException $e) {
            http_response_code(500);
            echo json_encode(array('message' => "Une erreur est survenue dans la base de données."));
        }


        if ($request_sexe == false || $request_sport == false) {

            // Erreur de la requête SQL, renvoyer un statut 500 - Internal Server Error
            http_response_code(500);
            echo json_encode(array('message' => "Echec de la requête SQL : Erreur interne au serveur."));
        } else {

            $result_sexe = $request_sexe->fetchAll(PDO::FETCH_OBJ);
            $result_sport = $request_sport->fetchAll(PDO::FETCH_OBJ);

            if (empty($result_sexe) && empty($result_sport)) {

                // Aucune donnée trouvée, renvoyer un statut 404 - Not Found
                http_response_code(404);
                echo json_encode(array('message' => "Impossible d'afficher la liste, aucune nomenclature trouvée."));
            } else {

                $result_nomenclature = [
                    'sexes' => $result_sexe,
                    'sports' => $result_sport,
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

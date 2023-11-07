<?php

header("Content-Type: application/json");
header("Access-Control-Allow-Origin: *");

require_once('init_pdo.php');

switch ($_SERVER['REQUEST_METHOD']) {
    case 'GET':

        if (isset($_GET['date1']) && isset($_GET['date2']) && (isset($_GET['identifiant']))) {
            $data = "";

            $request = $pdo->prepare("SELECT journal.*, aliments.produit FROM journal 
            JOIN aliments ON aliments.CODE=journal.code 
            WHERE journal.IDENTIFIANT = '" . $_GET['identifiant'] . "' 
            AND journal.DATE >= '" . $_GET['date1'] . "' 
            AND journal.DATE <= '" . $_GET['date2'] . "'");
            $request->execute();
            $tab_journal = $request->fetchAll(PDO::FETCH_OBJ);

            $result = array();

            for ($i = 0; $i < count($tab_journal); $i++) {
                $code = $tab_journal[$i]->CODE;
                $request_bis = $pdo->prepare("SELECT composition_nutritive.*,nutriments.NOM FROM composition_nutritive 
            JOIN nutriments ON nutriments.ID_NUTRIMENT=composition_nutritive.ID_NUTRIMENT 
            WHERE CODE = '" . $code . "'");
                $request_bis->execute();
                $elem = $request_bis->fetchAll(PDO::FETCH_OBJ);
                array_push($result, [
                    'journal' => $tab_journal[$i],
                    'nutriments' => $elem
                ]);
            }

            //print_r($result);

            checkAndResponse($request, $data, $result);
            break;
        } else if (isset($_GET['identifiant'])) {
            $data = "";

            $request = $pdo->prepare("SELECT journal.*, aliments.produit FROM journal 
            JOIN aliments ON aliments.CODE=journal.code 
            WHERE IDENTIFIANT = '" . $_GET['identifiant'] . "'");
            $request->execute();
            $result = $request->fetchAll(PDO::FETCH_OBJ);

            checkAndResponse($request, $data, $result);
            break;
        } else if (isset($_GET['id_journal'])) {
            $data = "";

            $request = $pdo->prepare("SELECT journal.*, aliments.produit FROM journal JOIN aliments ON aliments.CODE=journal.code WHERE ID_JOURNAL = '" . $_GET['id_journal'] . "'");
            $request->execute();
            $result = $request->fetchAll(PDO::FETCH_OBJ);

            checkAndResponse($request, $data, $result);
            break;
        }

    case 'POST':

        $data = json_decode(file_get_contents("php://input"), true);

        $request = $pdo->exec(
            "INSERT INTO `journal` (`code`, `identifiant`, `quantite`, `date`)
            VALUES ('" . $data['code'] . "','" . $data['identifiant'] . "','" . $data['quantite'] . "','" . $data['date'] . "')"
        );



        checkAndResponse($request, $data);
        break;

    case 'PUT':

        $data = json_decode(file_get_contents("php://input"), true);
        $request = $pdo->exec("UPDATE journal SET code = '" . $data['code'] . "', quantite = " . $data['quantite'] . ", date = '" . $data['date'] . "' WHERE id_journal = '" . $data['id_journal'] . "'");
        checkAndResponse($request, $data);
        break;

    case 'DELETE':
        $data = json_decode(file_get_contents("php://input"), true);

        $request = $pdo->exec("DELETE FROM `journal` WHERE `id_journal` = '" . $data['id_journal'] . "'");

        checkAndResponse($request, $data);
        break;

    default:
        http_response_code(405);
        echo json_encode(array('message' => 'Méthode non autorisée'));
        break;
}


// gestion de la réponse à la requête
function checkAndResponse($request, $data, $result = array())
{
    if (is_bool($request)) {

        // Erreur de la requête SQL, renvoyer un statut 500 - Internal Server Error
        http_response_code(500);
        echo json_encode(array('message' => "Echec de la requête SQL : Erreur interne au serveur."));
    } else {
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

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
            $data = "";
            try {
                $request_1 = $pdo->prepare("SELECT * FROM aliments WHERE code ='" . $_GET['code'] . "'");
                $request_1->execute();
                $result_1 = $request_1->fetchAll(PDO::FETCH_OBJ);

                $request_2 = $pdo->prepare("SELECT * FROM composition WHERE code ='" . $_GET['code'] . "'");
                $request_2->execute();
                $result_2 = $request_2->fetchAll(PDO::FETCH_OBJ);

                $request_3 = $pdo->prepare("SELECT * FROM composition_nutritive WHERE code ='" . $_GET['code'] . "'");
                $request_3->execute();
                $result_3 = $request_3->fetchAll(PDO::FETCH_OBJ);

                $request_4 = $pdo->prepare("SELECT * FROM labels WHERE code ='" . $_GET['code'] . "'");
                $request_4->execute();
                $result_4 = $request_4->fetchAll(PDO::FETCH_OBJ);
            } catch (PDOException $e) {
                http_response_code(500);
                echo json_encode(array('message' => "Une erreur est survenue dans la base de données."));
            }



            if ($request_1 == false || $request_2 == false || $request_3 == false || $request_4 == false) {
                $total_request = false;
            } else {
                $total_request = 1;
            }

            $result = [
                'aliment' => $result_1,
                'ingredients' => $result_2,
                'categories' => $result_4,
                'nutriments' => $result_3
            ];

            checkAndResponse($total_request, $result, $data);
            break;
        } else {
            $data = "";

            try {
                $request = $pdo->prepare("SELECT * FROM aliments ORDER BY produit ASC");
                $request->execute();
                $result = $request->fetchAll(PDO::FETCH_OBJ);
            } catch (PDOException $e) {
                http_response_code(500);
                echo json_encode(array('message' => "Une erreur est survenue dans la base de données."));
            }

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

        try {
            $request_1 = $pdo->exec("INSERT INTO `aliments` (`code`, `produit`, `quantite`, `portion`, `marque`, `nutriscore_grade`)
                              VALUES ('" . $data['code'] . "','" . addslashes($data['produit']) . "','" . $data['quantite'] . "','" . $data['portion'] . "','" . addslashes($data['marque']) . "','" . $data['nutriscore_grade'] . "')");

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
                                 VALUES ('" . $data['code'] . "','" . $composition_nutritive['id_nutriment'] . "','" . $composition_nutritive['valeur_100'] . "','" . $composition_nutritive['valeur_portion'] . "','" . addslashes($composition_nutritive['unite']) . "')");
            }
        } catch (PDOException $e) {
            if ($e->getCode() == 23000) {
                // L'identifiant existe déjà, renvoyer un statut 501 - Not Implemented
                http_response_code(501);
            } else {
                http_response_code(500);
                echo json_encode(array('message' => "Une erreur est survenue dans la base de données."));
            }
        }



        if ($request_1 == false || $request_2 == false || $request_3 == false || $request_4 == false) {
            $total_request = false;
        } else {
            $total_request = 1;
        }

        $result = "";

        checkAndResponse($total_request, $result, $data);
        break;

    case 'PUT':

        $data = json_decode(file_get_contents("php://input"), true);

        $data_composition = $data['composition'];
        $data_labels = $data['labels'];
        $data_composition_nutritive = $data['composition_nutritive'];

        // $request = $pdo->prepare("UPDATE users SET name = '" . $data['name'] . "', email = '" . $data['mail'] . "' WHERE id = " . $data['id']);
        // $request->execute();
        try {
            $request_1 = $pdo->exec("UPDATE aliments SET produit = '" . addslashes($data['produit']) . "', quantite = '" . $data['quantite'] . "', portion = '" . $data['portion'] . "', marque = '" . addslashes($data['marque']) . "', nutriscore_grade = '" . $data['nutriscore_grade'] . "' WHERE code = " . $data['code']);

            $pdo->exec("DELETE FROM `composition` WHERE `code` = " . $data['code']);
            foreach ($data_composition as $composition) {
                $request_2 = $pdo->exec("INSERT INTO `composition` (`code`, `id_ingredient`, `pourcentage`)
                                  VALUES ('" . $data['code'] . "','" . $composition['id_ingredient'] . "','" . $composition['pourcentage'] . "')");
            }


            $pdo->exec("DELETE FROM `labels` WHERE `code` = " . $data['code']);
            foreach ($data_labels as $label) {
                $request_3 = $pdo->exec("INSERT INTO `labels` (`code`, `id_categories`)
                                  VALUES ('" . $data['code'] . "','" . $label['id_categories'] . "')");
            }


            $pdo->exec("DELETE FROM `composition_nutritive` WHERE `code` = " . $data['code']);
            foreach ($data_composition_nutritive as $composition_nutritive) {
                $request_4 = $pdo->exec("INSERT INTO `composition_nutritive` (`code`, `id_nutriment`, `valeur_100`, `valeur_portion`, `unite`)
                                 VALUES ('" . $data['code'] . "','" . $composition_nutritive['id_nutriment'] . "','" . $composition_nutritive['valeur_100'] . "','" . $composition_nutritive['valeur_portion'] . "','" . addslashes($composition_nutritive['unite']) . "')");
            }
        } catch (PDOException $e) {
            if ($e->getCode() == 23000) {
                // L'identifiant existe déjà, renvoyer un statut 501 - Not Implemented
                http_response_code(501);
            } else {
                http_response_code(500);
                echo json_encode(array('message' => "Une erreur est survenue dans la base de données." . $e->getMessage()));
            }
        }


        if ($request_2 == false || $request_3 == false || $request_4 == false) {
            $total_request = false;
        } else {
            $total_request = 1;
        }

        $result = "";

        checkAndResponse($total_request, $result, $data);
        break;

    case 'DELETE':
        $data = json_decode(file_get_contents("php://input"), true);

        try {
            $request = $pdo->prepare("DELETE FROM `aliments` WHERE `code` = " . $data['code']);
            $request->execute();
            $result = "";
        } catch (PDOException $e) {
            http_response_code(500);
            echo json_encode(array('message' => "Une erreur est survenue dans la base de données."));
        }

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
    if (is_bool($request)) {

        // Erreur de la requête SQL, renvoyer un statut 500 - Internal Server Error
        http_response_code(500);
        echo json_encode(array('message' => "Echec de la requête SQL : Erreur interne au serveur."));
    } else {
        /*
        if ($_SERVER['REQUEST_METHOD'] == 'GET') {
            $result = $request->fetchAll(PDO::FETCH_OBJ);
        }*/

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
                if ($_SERVER['REQUEST_METHOD'] == 'PUT') {
                    echo json_encode(array('code' => $data['code']));
                } else {
                    echo json_encode(array('code' => $data['code']));
                }
            }
        }
    }
}

// function existsIngredient($data_composition)
// {
    
// }

// function existsCategories($data_labels)
// {
// }

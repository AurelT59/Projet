<?php
require_once('init_pdo.php');

$sql = file_get_contents("sql/database.sql");


function extractAndRemoveTriggers(&$text)
{
    $triggerArray = array();
    $startPos = strpos($text, "DELIMITER $$");
    while ($startPos !== false) {
        $endPos = strpos($text, "DELIMITER ;", $startPos);
        if ($endPos === false) {
            break;
        }
        $trigger = substr($text, $startPos + strlen("DELIMITER $$"), $endPos - $startPos - strlen("DELIMITER $$"));
        $triggerArray[] = $trigger;
        $text = substr_replace($text, '', $startPos, $endPos - $startPos + strlen("DELIMITER ;"));
        $startPos = strpos($text, "DELIMITER $$");
    }
    return $triggerArray;
}

$extractedTriggers = extractAndRemoveTriggers($sql);
$request = $pdo->prepare($sql);
$request->execute();

for ($i = 0; $i < count($extractedTriggers); $i++) {
    $trigger = substr($extractedTriggers[$i], 0, -3);
    $request = $pdo->prepare($trigger);
    $request->execute();
}



/*** close the database connection ***/
$pdo = null;

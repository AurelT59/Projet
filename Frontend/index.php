<!DOCTYPE html>

<html>

<head>
    <meta charset="UTF-8">
    <title>Index</title>
    <link href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link href="css/style.css" rel="stylesheet">
</head>

<body>

    <?php

    // EN-TÊTE (DONT MENU)

    require_once('header.php');

    $currentPageId = 'journal';
    if (isset($_GET['page'])) {
        $currentPageId = $_GET['page'];
    }

    renderMenuToHTML($currentPageId);

    // CONTENU PROPRE À LA PAGE

    $pageToInclude = $currentPageId . ".php";
    if (is_readable($pageToInclude))
        require_once($pageToInclude);
    else
        require_once("error.php");

    ?>

    <!-- PIED DE PAGE -->
    <?php require_once('footer.php') ?>

</body>

</html>
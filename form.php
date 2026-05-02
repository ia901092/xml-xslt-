<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Form</title>
</head>
<body>

<form action="responseXSLT.php" method="get">
    <select name="paper">
<?php
$xml = simplexml_load_file("https://wwwlab.webug.se/examples/XML/articleservice/papers/");

foreach ($xml->NEWSPAPER as $paper) {
    echo "        <option value=\"" . $paper['TYPE'] . "\">" . $paper['NAME'] . "</option>\n";
}
?>
    </select>
    <input type="submit" value="Visa">
</form>

</body>
</html scs ds
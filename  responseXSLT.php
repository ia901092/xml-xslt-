<?php
if (isset($_GET['paper']) && $_GET['paper'] !== "") {
    $paper = $_GET['paper'];
} else {
    $paper = "Morning_Edition";
}

$xml = new DOMDocument();
$xml->load("https://wwwlab.webug.se/examples/XML/articleservice/articles/?paper=" . $paper);

$xsl = new DOMDocument();
$xsl->load(dirname(__FILE__) . "/articles.xsl");

$proc = new XSLTProcessor();
$proc->importStylesheet($xsl);
echo $proc->transformToXML($xml);
?>
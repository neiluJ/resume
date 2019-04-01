<?php

/**
 * neiluJ Resume Site
 */

define("RESUME_THEME", "bulma");

require_once __DIR__ . '/vendor/autoload.php';

$loader = new \Twig\Loader\FilesystemLoader(__DIR__ .'/themes/'. RESUME_THEME);
$twig = new \Twig\Environment($loader, [
    'cache' => false,
]);

$twig->addExtension(new \Neiluj\Resume\TwigResumeExtension());

$data = (new \Neiluj\Resume\XmlResume(__DIR__. '/resume.xml'))->toArray();

// var_dump($data);

echo $twig->render('resume.html.twig', $data);
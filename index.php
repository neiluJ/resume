<?php

/**
 * This file is part of neiluJ's Resume Site
 *
 * @author Julien Ballestracci
 * @copyright Julien Ballestracci <julien@nitronet.org> (c) 2011-2019
 * @license GPL v3
 */
require_once __DIR__ . '/vendor/autoload.php';

// Theme Configuration (REQUIRED)
define("RESUME_THEME", "bulma");


// SCRIPT
$loader = new \Twig\Loader\FilesystemLoader(__DIR__ .'/themes/'. RESUME_THEME);
$twig = new \Twig\Environment($loader, [
    'debug' => false,
    'cache' => false // we don't need twig cache as we generate the resume page
]);

// add custom resume extension
$twig->addExtension(new \Neiluj\Resume\TwigResumeExtension());

// load data from resume.xml
$data = (new \Neiluj\Resume\XmlResume(__DIR__. '/resume.xml'))->toArray();

// uncomment this to debug/create XML map
// var_dump($data);

// render resume
echo $twig->render('resume.html.twig', $data);
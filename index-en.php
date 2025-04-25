<?php
/**
 * This file is part of neiluJ's Resume Site
 *
 * @author Julien Ballestracci
 * @copyright Julien Ballestracci <julien@nitronet.org> (c) 2011-2025
 * @license GPL v3
 */
namespace Resume;

error_reporting(E_ALL ^ E_DEPRECATED);

use Neiluj\Resume\TwigResumeExtension;
use Neiluj\Resume\XmlResume;
use Twig\Environment;
use Twig\Loader\FilesystemLoader;

// generate this file with composer install
require_once __DIR__ . '/vendor/autoload.php';

// Theme Configuration (REQUIRED)
define("RESUME_THEME", "bulma");

// SCRIPT
$twig = new Environment(new FilesystemLoader(
    TwigResumeExtension::RESUME_THEMES_DIR
    . DIRECTORY_SEPARATOR
    . RESUME_THEME
), [
    'debug' => false, // only enable debug when working on resume
    'cache' => false // we don't need twig cache as we generate the resume page
]);
$twig->addExtension(new TwigResumeExtension());

// load data from resume.xml
$data = (new XmlResume('resume-en.xml'))->toArray();

// uncomment this to debug/create XML map
// var_dump($data);

// render resume
echo $twig->render('resume.html.twig', $data);
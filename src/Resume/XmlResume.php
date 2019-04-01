<?php

/**
 * This file is part of neiluJ's Resume Site
 *
 * @author Julien Ballestracci
 * @copyright Julien Ballestracci <julien@nitronet.org> (c) 2011-2019
 * @license GPL v3
 */
namespace Neiluj\Resume;


use Fwk\Xml\Map;
use Fwk\Xml\XmlFile;

/**
 * Class XmlResume
 *
 * @package Neiluj\Resume
 */
class XmlResume
{
    // a theme always comes with its own 'Xml Map'
    const RESUME_MAP_FILENAME = 'XmlResumeMap.php';

    /**
     * @var array
     */
    protected $data = array();

    /**
     * @var string
     */
    protected $file;

    /**
     * @var bool
     */
    protected $loaded = false;

    /**
     * XmlResume constructor.
     * @param string $file
     */
    public function __construct(string $file)
    {
        $this->file = $file;
    }

    /**
     * Extracts and returns data from XML file according to the theme's XmlResumeMap
     *
     * @return array
     * @throws ResumeException
     */
    public function toArray(): array
    {
        if (!$this->loaded) {
            $map = $this->xmlMapFactory();
            $this->data = $map->execute(new XmlFile($this->file));
            $this->loaded = true;
        }

        return $this->data;
    }

    /**
     * Instantiates the XmlResumeMap of the theme
     *
     * @throws ResumeException
     */
    protected function xmlMapFactory(): Map
    {
        $mapFile = TwigResumeExtension::RESUME_THEMES_DIR
            . DIRECTORY_SEPARATOR
            . RESUME_THEME
            . DIRECTORY_SEPARATOR
            . self::RESUME_MAP_FILENAME
        ;

        if (!is_file($mapFile)) {
            throw new ResumeException(sprintf('XML Map file not found: %s', $mapFile));
        } else if (!is_readable($mapFile)) {
            throw new ResumeException(sprintf('XML Map file not readable: %s', $mapFile));
        }

        include_once $mapFile;

        if (!class_exists('\XmlResumeMap')) {
            throw new ResumeException(sprintf('Class "XmlResumeMap" does not exists in map file: %s', $mapFile));
        }

        return new \XmlResumeMap();
    }
}
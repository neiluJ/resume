<?php

/**
 * This file is part of neiluJ's Resume Site
 *
 * @author Julien Ballestracci
 * @copyright Julien Ballestracci <julien@nitronet.org> (c) 2011-2019
 * @license GPL v3
 */
namespace Neiluj\Resume;


use Twig\Extension\AbstractExtension;
use Twig\Extension\ExtensionInterface;
use Twig\TwigFunction;

/**
 * Class TwigResumeExtension
 *
 * @package Neiluj\Resume
 */
class TwigResumeExtension extends AbstractExtension implements ExtensionInterface
{
    // themes directory
    const RESUME_THEMES_DIR = 'themes';

    // assets directory
    const RESUME_ASSETS_DIR = 'assets';

    /**
     * @return array|TwigFunction[]
     */
    public function getFunctions(): array
    {
        return array(
            new TwigFunction('resume_theme_dir', [$this, 'resumeThemeDir']),
            new TwigFunction('resume_theme_asset', [$this, 'resumeThemeAssetsDir']),
        );
    }

    /**
     * Returns the relative themes directory
     *
     * @param string|null $path
     * @return string
     */
    public function resumeThemeDir(?string $path = null): string
    {
        return self::RESUME_THEMES_DIR
            . DIRECTORY_SEPARATOR
            . RESUME_THEME
            . (!empty($path) ? DIRECTORY_SEPARATOR
                . ltrim($path, DIRECTORY_SEPARATOR)
                : ''
            )
        ;
    }

    /**
     * Returns the relative theme assets directory
     *
     * @param string|null $path
     * @return string
     */
    public function resumeThemeAssetsDir(?string $path = null): string
    {
        return $this->resumeThemeDir(
            self::RESUME_ASSETS_DIR
            . (!empty($path) ? DIRECTORY_SEPARATOR
                . ltrim($path, DIRECTORY_SEPARATOR)
                : ''
            )
        );
    }
}
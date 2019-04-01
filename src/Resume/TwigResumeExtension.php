<?php

namespace Neiluj\Resume;




use Twig\Extension\AbstractExtension;
use Twig\Extension\ExtensionInterface;
use Twig\TwigFunction;

class TwigResumeExtension extends AbstractExtension implements ExtensionInterface
{
    const RESUME_THEMES_DIR = 'themes';
    const RESUME_ASSETS_DIR = 'assets';

    public function getFunctions()
    {
        return array(
            new TwigFunction('resume_theme_dir', [$this, 'resumeThemeDir']),
            new TwigFunction('resume_theme_asset', [$this, 'resumeThemeAssetsDir']),
        );
    }

    /**
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
     * @param string|null $path
     * @return string
     */
    public function resumeThemeAssetsDir(?string $path = null): string
    {
        return self::RESUME_THEMES_DIR
            . DIRECTORY_SEPARATOR
            . RESUME_THEME
            . DIRECTORY_SEPARATOR
            . self::RESUME_ASSETS_DIR
            . (!empty($path) ? DIRECTORY_SEPARATOR
                . ltrim($path, DIRECTORY_SEPARATOR)
                : ''
            )
        ;
    }
}
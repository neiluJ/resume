<?php
/**
 * Resume site
 * Copyright (C) 2011-2019  Julien Ballestracci <julien@nitronet.org>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <https://www.gnu.org/licenses/>.
 */
namespace Resume;

if (!class_exists('\XSLTProcessor')) {
    throw new XmlResumeException('XSLT is not available on this environment');
}

ob_start('ob_gzhandler');

/**
 * Class XmlResumeException
 *
 * @package Resume
 */
class XmlResumeException extends \Exception { }

/**
 * Class XmlResumeXPaths
 *
 * @package Resume
 */
class XmlResumeXPaths {
    const CONFIG    = '/resume/config/property[@name="%s"]/text()';
}

/**
 * Class XmlResume
 *
 * @package Resume
 */
class XmlResume
{
    /**
     * @var \SimpleXMLElement
     */
    protected $xml;

    /**
     * @var string
     */
    protected $xmlPath;

    /**
     * @var string
     */
    protected $theme;

    /**
     * XmlResume constructor.
     *
     * @param string $xml path to resume.xml
     * @throws XmlResumeException
     */
    public function __construct($xml)
    {
        if (!is_file($xml)) {
            throw new XmlResumeException(sprintf('Unable to find xml file "%s"', $xml));
        }
        
        if (!is_readable($xml)) {
            throw new XmlResumeException(sprintf('XML file not readable (%s)', $xml));
        }
        
        
        $handle = @simplexml_load_file($xml);
        if (!$handle) {
            throw new XmlResumeException(sprintf(
                'Unable to open XML file "%s": %s',
                $xml,
                libxml_get_last_error()->message)
            );
        }
        
        $this->xml = $handle;
    }
    
    /**
     * Returns a configuration parameter
     *
     * @param string $paramName
     * @param mixed $default 
     * 
     * @return string
     */
    public function getConfig($paramName, $default = null)
    {
        $value = $this->xml->xpath(sprintf(XmlResumeXPaths::CONFIG, $paramName));

        if (!is_array($value) || !count($value)) {
            return $default;
        }
        
        return (string)$value[0];
    }

    /**
     * @param string $template path to layout.xsl file of the theme
     *
     * @return \SimpleXMLElement|string
     * @throws XmlResumeException
     */
    public function getThemeLayout($template)
    {
        if (!isset($this->theme)) {
            $themeName  = $this->getConfig('theme', 'default');
            $themesDir  = $this->getConfig('themesDir', __DIR__ .'/themes');
            $path       = realpath(__DIR__ .
                            DIRECTORY_SEPARATOR . 
                            trim($themesDir, DIRECTORY_SEPARATOR) . 
                            DIRECTORY_SEPARATOR . 
                            $themeName . DIRECTORY_SEPARATOR);

            if (!is_dir($path)) {
                throw new XmlResumeException(sprintf('Theme directory not found (%s)', $path));
            }

            $file   = $path . DIRECTORY_SEPARATOR . $template;
            if (!is_file($file)) {
                throw new XmlResumeException(sprintf('Theme template %s file not found in %s', $template, $path));
            }

            $handle = @simplexml_load_file($file);
            if (!$handle) {
                throw new XmlResumeException(sprintf('Unable to open XSL file "%s": %s', $file, libxml_get_last_error()->message));
            }

            $this->theme    = $handle;
        }
        
        return $this->theme;
    }

    /**
     * Renders the resume
     *
     * @param string $template
     *
     * @return string
     * @throws XmlResumeException
     */
    public function render($template = 'layout.xsl')
    {
        $xslt = new \XSLTProcessor();
        $xslt->registerPHPFunctions();
        
        $layout = $this->getThemeLayout($template);
        $xslt->importStylesheet($layout);
        
        return $xslt->transformToXml($this->xml);
    }
}

// GO !
$resume = new XmlResume('resume.xml');
echo $resume->render();

ob_end_flush();
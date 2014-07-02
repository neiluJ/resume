<?php
namespace Resume;

ob_start('ob_gzhandler');
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
class XmlResumeException extends \Exception { }

class XmlResumeXPaths {
    const CONFIG    = '/resume/config/property[@name="%s"]/text()';
}

class XmlResume {
    
    protected $xml;
    
    protected $xmlPath;
    
    protected $theme;
    
    public function __construct($xml) {
        if(!is_file($xml))
            throw new XmlResumeException(sprintf('Unable to find xml file "%s"', $xml));
        
        if(!is_readable($xml))
            throw new XmlResumeException(sprintf('XML file not readable (%s)', $xml));
        
        
        $handle = @simplexml_load_file($xml);
        if(!$handle)
            throw new XmlResumeException(sprintf('Unable to open XML file "%s": %s', $xml, libxml_get_last_error()->message));
    
        
        $this->xml = $handle;
    }
    
    /**
     *
     * @param string $paramName
     * @param mixed $default 
     * 
     * @return string
     */
    public function getConfig($paramName, $default = null) {
        $value = $this->xml->xpath(sprintf(XmlResumeXPaths::CONFIG, $paramName));
        
        if(!is_array($value) || !count($value))
            return $default;
        
        return (string)$value[0];
    }
    
    public function getThemeLayout($template) {
        if(!isset($this->theme)) {
            $themeName  = $this->getConfig('theme', 'default');
            $themesDir  = $this->getConfig('themesDir', __DIR__ .'/themes');

            $path       = realpath(__DIR__ . 
                            DIRECTORY_SEPARATOR . 
                            trim($themesDir, DIRECTORY_SEPARATOR) . 
                            DIRECTORY_SEPARATOR . 
                            $themeName . DIRECTORY_SEPARATOR);

            if(!is_dir($path))
                throw new XmlResumeException(sprintf('Theme directory not found (%s)', $path));

            $file   = $path . DIRECTORY_SEPARATOR . $template;
            if(!is_file($file))
                throw new XmlResumeException(sprintf('Theme template %s file not found in %s', $template, $path));

            $handle = @simplexml_load_file($file);
            if(!$handle) {
                throw new XmlResumeException(sprintf('Unable to open XSL file "%s": %s', $file, libxml_get_last_error()->message));
            }

            $this->theme    = $handle;
        }
        
        return $this->theme;
    }
    
    public function render($template = 'layout.xsl') {
        if(!class_exists('\XSLTProcessor'))
            throw new XmlResumeException('XSLT is not available on this environment');
    
        $xslt = new \XSLTProcessor(); 
        $xslt->registerPHPFunctions();
        
        $layout = $this->getThemeLayout($template);
        $xslt->importStylesheet($layout);
        
        return $xslt->transformToXml($this->xml);
    }
}

$resume = new XmlResume('resume.xml');

echo $resume->render();

ob_end_flush();
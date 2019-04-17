<?php

use Fwk\Xml\Map;
use Fwk\Xml\Path;

/**
 * Class XmlResumeMap
 */
class XmlResumeMap extends Map
{
    /**
     * Constructor
     *
     * @return void
     */
    public function __construct()
    {
        $this->add(
            Path::factory('head', 'head')
                ->addChildren(Path::factory('name', 'name'))
                ->addChildren(Path::factory('description', 'description'))
                ->addChildren(Path::factory('copyright', 'copyright'))
                ->addChildren(Path::factory('keywords', 'keywords'))
                ->addChildren(Path::factory('location', 'location'))
                ->addChildren(Path::factory('url', 'url'))
                ->addChildren(Path::factory('email', 'email'))
                ->addChildren(Path::factory('position', 'position'))
                ->addChildren(Path::factory('picture', 'picture'))
                ->addChildren(
                    Path::factory('networks/network', 'networks')
                        ->loop(true, '@name')
                        ->attribute('icon', 'icon')
                        ->attribute('title', 'title')
                        ->value('value')
                )
                ->addChildren(Path::factory('footer_text', 'footer_text'))
                ->addChildren(Path::factory('ga_tracking_id', 'ga_tracking_id'))
        );

        $this->add(
            Path::factory('experiences/experience', 'experiences')
                ->loop(true)
                ->attribute('type', 'type')
                ->addChildren(
                    Path::factory('employer', 'employer')
                    ->value('name')
                    ->attribute('image', 'image')
                    ->attribute('url', 'url')
                )
                ->addChildren(Path::factory('from', 'from'))
                ->addChildren(Path::factory('to', 'to'))
                ->addChildren(Path::factory('position', 'position'))
                ->addChildren(Path::factory('location', 'location'))
                ->addChildren(
                    Path::factory('details/info', 'infos')
                        ->loop(true)
                        ->attribute('text', 'text')
                        ->addChildren(
                            Path::factory('techno', 'technos')
                                ->loop(true)
                                ->attribute('image', 'image')
                                ->value('title')
                        )
                )
        );

        $this->add(
            Path::factory('clients/client', 'clients')
                ->loop(true)
                ->attribute('image', 'image')
                ->value('name')
        );

        $this->add(
            Path::factory('skills/skill', 'skills')
                ->loop(true, '@name')
                ->value('level')
        );
    }
}
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output 
        method="xml"
        indent="yes"
        encoding="utf-8"
        doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
        doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
    />

    <xsl:include href="incl-header.xsl" />
    <xsl:include href="incl-experiences.xsl" />
    <xsl:include href="incl-skills.xsl" />
    <xsl:include href="incl-education.xsl" />
    <xsl:include href="incl-interests.xsl" />
    
    <xsl:template match="/">
        <html xml:lang="en" lang="en">
            <head>
                <xsl:call-template name="header" />
                <!-- css -->
                <xsl:element name="link">
                    <xsl:attribute name="rel">stylesheet</xsl:attribute>
                    <xsl:attribute name="type">text/css</xsl:attribute>
                    <xsl:attribute name="media">screen, print</xsl:attribute>
                    <xsl:attribute name="href">
                        <xsl:value-of select="/resume/config/property[@name='themesDir']/text()" />
                        <xsl:text>/</xsl:text>
                        <xsl:value-of select="/resume/config/property[@name='theme']/text()" />
                        <xsl:text>/css/style-v3.css</xsl:text>
                    </xsl:attribute>
                </xsl:element>
            </head>
            <body>
                <div id="wrap">
                    <p class="contact">
                        <span class="web" style="float:right;">
                            <xsl:value-of select="/resume/head/url" />
                        </span> 
                        <span class="email"><xsl:value-of select="/resume/head/email" /></span>
                    </p>
                    <div id="head">
                        <img src="themes/v3/images/tof.jpg" title="Julien Ballestracci" alt="photo" width="100" height="150" />
                        <p>
                            <strong class="name"><xsl:value-of select="/resume/head/name" /></strong>
                            <br />
                            <xsl:value-of select="/resume/head/localisation" />
                            <br />
                            <i><xsl:value-of select="/resume/head/age" /> ans, Permis B (+ véhicule)</i>.
                        </p>
                        <h1><xsl:value-of select="/resume/head/position" /></h1>
                    </div>
	
                    <div class="container">
                        <div id="left">
                            <div id="intro">
                                <p><xsl:value-of select="/resume/head/headline" /></p>
                            </div>
                            
                            <xsl:call-template name="experiences" />
                        </div>
                        <div id="right">
                            <xsl:call-template name="skills" />
                            <xsl:call-template name="education" />
                            <xsl:call-template name="interests" />
                        </div>
                    </div>
                </div>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>

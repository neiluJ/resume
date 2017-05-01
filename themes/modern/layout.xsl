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
                        <xsl:text>/css/style.css</xsl:text>
                    </xsl:attribute>
                </xsl:element>
                <xsl:element name="link">
                    <xsl:attribute name="rel">stylesheet</xsl:attribute>
                    <xsl:attribute name="type">text/css</xsl:attribute>
                    <xsl:attribute name="media">print</xsl:attribute>
                    <xsl:attribute name="href">
                        <xsl:value-of select="/resume/config/property[@name='themesDir']/text()" />
                        <xsl:text>/</xsl:text>
                        <xsl:value-of select="/resume/config/property[@name='theme']/text()" />
                        <xsl:text>/css/print.css</xsl:text>
                    </xsl:attribute>
                </xsl:element>
            </head>
            <body>
                <div id="wrap">
                    <div class="container" id="head">
                        <div id="intro">
                            <img src="themes/v3/images/tof.jpg" title="Julien Ballestracci" alt="photo" width="100" height="150" />
                            <h1>
                                <xsl:value-of select="/resume/head/name" />
                            </h1>
                            <p>
                                <xsl:value-of select="/resume/head/position" /><br />
                                <a title="Zend Certified Engineer" href="http://www.zend.com/en/store/education/certification/authenticate.php/ClientCandidateID/ZEND012502/RegistrationID/232966213" id="zce">Ingénieur Certifié Zend</a>
                            </p>
                        </div>
                        
                        <div id="contact">
                            <ul>
                                <li>
                                    <xsl:element name="a">
                                        <xsl:attribute name="href">mailto:<xsl:value-of select="/resume/head/email" /></xsl:attribute>
                                        <xsl:value-of select="/resume/head/email" />
                                    </xsl:element>
                                </li>
                                <li>
                                    <xsl:element name="a">
                                        <xsl:attribute name="href"><xsl:value-of select="/resume/head/url" /></xsl:attribute>
                                        <xsl:value-of select="/resume/head/url" />
                                    </xsl:element>
                                </li>
                                <li class="infos"><xsl:value-of select="/resume/head/age" /> ans</li>
                                <li class="links">
                                    <xsl:element name="a">
                                        <xsl:attribute name="id">viadeo</xsl:attribute>
                                        <xsl:attribute name="title">Profil Viadeo</xsl:attribute>
                                        <xsl:attribute name="href"><xsl:value-of select="/resume/head/networks/viadeo" /></xsl:attribute>
                                        Profil Viadéo
                                    </xsl:element>
                                    <xsl:element name="a">
                                        <xsl:attribute name="id">linkedin</xsl:attribute>
                                        <xsl:attribute name="title">Profil LinkedIn</xsl:attribute>
                                        <xsl:attribute name="href"><xsl:value-of select="/resume/head/networks/linkedin" /></xsl:attribute>
                                        Profil LinkedIn
                                    </xsl:element>
                                </li>
                           </ul>
                        </div>
                        <div style="clear:both;"></div>
                    </div>
                    <div class="container">
                        <h2>Profil</h2>
                        <div class="contents">
                            <blockquote><p><xsl:value-of select="/resume/head/headline" /></p></blockquote>
                            <p><xsl:value-of select="/resume/head/intro" disable-output-escaping="yes" /></p>
                        </div>
                        <div style="clear:both;"></div>
                    </div>
                    <div class="container cut-here">
                        <h2>Parcours</h2>
                        <div class="contents">
                            <xsl:call-template name="experiences" />
                        </div>
                        <div style="clear:both;"></div>
                    </div>
                    <div class="container">
                        <h2>Compétences</h2>
                        <div class="contents">
                            <xsl:call-template name="skills" />
                        </div>
                        <div style="clear:both;"></div>
                    </div>
                    <div class="container">
                        <h2>Centres d'Interêts</h2>
                        <div class="contents">
                            <xsl:call-template name="interests" />
                        </div>
                        <div style="clear:both;"></div>
                    </div>
                </div>
                <div id="bottomline" class="hidden">
                <p>
                    <a href="./jballestracci-dev-web.pdf" title="Version PDF">Télécharger au format PDF</a> -  
                    <a href="http://validator.w3.org/check?uri=referer"><img
                      src="themes/modern/images/xhtml-valid.png" alt="Valid XHTML 1.0 Strict" height="12" width="39" /></a>/<a href="http://jigsaw.w3.org/css-validator/check/referer">
                        <img style="border:0;width:28px;height:12px"
                            src="themes/modern/images/css-valid.png"
                            alt="Valid CSS!" />
                    </a>
                  </p>
               </div>
                <script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-10798483-1', 'auto');
  ga('send', 'pageview');

</script>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>

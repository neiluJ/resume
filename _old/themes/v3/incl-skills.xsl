<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="xml"/>

    <xsl:template name="skills">
        <div class="box">
            <h3>Compétences</h3>
            <ul>
                <li>
                    <strong>Programmation</strong>
                    <xsl:for-each select="/resume/skills/skill[@category='Programmation']">
                        <xsl:call-template name="skill">
                            <xsl:with-param name="skill" select="."/>
                        </xsl:call-template>
                    </xsl:for-each>
                </li>
            
                <li>
                    <strong>Design &amp; UI</strong>
                    <xsl:for-each select="/resume/skills/skill[@category='Design &amp; UI']">
                        <xsl:call-template name="skill">
                            <xsl:with-param name="skill" select="."/>
                        </xsl:call-template>
                    </xsl:for-each>
                </li>
            
                <li>
                    <strong>Langues</strong>
                    <xsl:for-each select="/resume/skills/skill[@category='Langues']">
                        <xsl:call-template name="skill">
                            <xsl:with-param name="skill" select="."/>
                        </xsl:call-template>
                    </xsl:for-each>
                </li>
            
                <li>
                    <strong>Systèmes</strong>
                    <xsl:for-each select="/resume/skills/skill[@category='Systèmes']">
                        <xsl:call-template name="skill">
                            <xsl:with-param name="skill" select="."/>
                        </xsl:call-template>
                    </xsl:for-each>
                </li>
            </ul>
        </div>
    </xsl:template>
    
    <xsl:template name="skill">
        <xsl:value-of select="name" />
        <br />
    </xsl:template>
    
</xsl:stylesheet>

<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="xml"/>

    <xsl:template name="skill">
        <li>
            <xsl:call-template name="skill-level" />
            <p class="name">
                <xsl:value-of select="name" />
            </p>
        </li>
    </xsl:template>
    
    <xsl:template name="skill-level">
        <xsl:variable name="f1" select="((level * 100) div 5)" />
        <p class="level">
            <xsl:element name="span">
                <xsl:attribute name="style">
                    <xsl:text>width:</xsl:text>
                    <xsl:value-of select="$f1" />
                    <xsl:text>%</xsl:text>
                </xsl:attribute>
                <xsl:attribute name="title">
                    <xsl:value-of select="$f1" />
                    <xsl:text>%</xsl:text>
                </xsl:attribute>
                <xsl:value-of select="name" />
            </xsl:element>
        </p>
    </xsl:template>
    
    <xsl:template name="skills">
        <ul id="skills">
            <li>
                <h3>Programmation</h3>
                <ul>
                    <xsl:for-each select="/resume/skills/skill[@category='Programmation']">
                        <xsl:sort select="level"
                          data-type="number"
                          order="descending"/>
                          
                        <xsl:call-template name="skill">
                            <xsl:with-param name="skill" select="."/>
                        </xsl:call-template>
                    </xsl:for-each>
                </ul>
            </li>
            <li>
                <h3>Design &amp; UI</h3>
                <ul>
                    <xsl:for-each select="/resume/skills/skill[@category='Design &amp; UI']">
                        <xsl:sort select="level"
                          data-type="number"
                          order="descending"/>
                          
                        <xsl:call-template name="skill">
                            <xsl:with-param name="skill" select="."/>
                        </xsl:call-template>
                    </xsl:for-each>
                </ul>
            </li>
            <li>
                <h3>Systèmes</h3>
                <ul>
                    <xsl:for-each select="/resume/skills/skill[@category='Systèmes']">
                        <xsl:sort select="level"
                          data-type="number"
                          order="descending"/>
                          
                        <xsl:call-template name="skill">
                            <xsl:with-param name="skill" select="."/>
                        </xsl:call-template>
                    </xsl:for-each>
                </ul>
            </li>
            <li>
                <h3>Langues</h3>
                <ul class="short">
                    <xsl:for-each select="/resume/skills/skill[@category='Langues']">
                        <xsl:sort select="level"
                          data-type="number"
                          order="descending"/>
                          
                        <xsl:call-template name="skill">
                            <xsl:with-param name="skill" select="."/>
                        </xsl:call-template>
                    </xsl:for-each>
                </ul>
            </li>
            <!--
            <li class="double">
                <h3>Veille</h3>
                <ul>
                    <xsl:for-each select="/resume/skills/skill[@category='Veille']/item">
                      <li>
                          <xsl:element name="a">
                            <xsl:attribute name="id"><xsl:value-of select="@id" /></xsl:attribute>
                            <xsl:attribute name="href"><xsl:value-of select="url" /></xsl:attribute>
                            <xsl:value-of select="name" />
                          </xsl:element>
                      </li>
                    </xsl:for-each>
                </ul>
            </li> -->
        </ul>
    </xsl:template>
</xsl:stylesheet>

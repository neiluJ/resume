<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="xml"/>

    <xsl:template name="interests">
        <div class="box">
            <h3>Centres d'Interêts</h3>
            <ul class="smaller">
                <li>
                    <strong>Musique</strong>
                    <xsl:for-each select="/resume/interests/interest[@category='Musique']">
                        <xsl:call-template name="interest">
                            <xsl:with-param name="interest" select="."/>
                        </xsl:call-template>
                    </xsl:for-each>
                </li>
            
                <li>
                    <strong>Arts</strong>
                    <xsl:for-each select="/resume/interests/interest[@category='Arts']">
                        <xsl:call-template name="interest">
                            <xsl:with-param name="interest" select="."/>
                        </xsl:call-template>
                    </xsl:for-each>
                </li>
            
                <li>
                    <strong>Sports</strong>
                    <xsl:for-each select="/resume/interests/interest[@category='Sports']">
                        <xsl:call-template name="interest"><xsl:with-param name="interest" select="."/></xsl:call-template>
                    </xsl:for-each>
                </li>
            </ul>
        </div>
    </xsl:template>
    
    <xsl:template name="interest"><xsl:value-of select="name" />, </xsl:template>
</xsl:stylesheet>

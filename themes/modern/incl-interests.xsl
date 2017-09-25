<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="xml"/>

    <xsl:template name="interest">
        <li><p class="name"><xsl:value-of select="name" /></p></li>
    </xsl:template>

    <xsl:template name="interests">
        <ul id="interests">
            <li>
                <h3>Musique</h3>
                <ul>
                <xsl:for-each select="/resume/interests/interest[@category='Musique']"><xsl:call-template name="interest" /></xsl:for-each>
                </ul>
            </li>
            <li>
                <h3>Arts</h3>
                <ul>
                <xsl:for-each select="/resume/interests/interest[@category='Arts']"><xsl:call-template name="interest" /></xsl:for-each>
                </ul>
            </li>
            <li>
                <h3>Sports</h3>
                <ul>
                <xsl:for-each select="/resume/interests/interest[@category='Sports']"><xsl:call-template name="interest" /></xsl:for-each>
                </ul>
            </li>
        </ul>
    </xsl:template>
</xsl:stylesheet>

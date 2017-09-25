<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="xml"/>

    <xsl:template name="education">
        <div class="box">
            <h3>Formation</h3>
            <ul>
                <xsl:for-each select="/resume/education">
                <li>
                    <strong><xsl:value-of select="name" /> (<xsl:value-of select="localisation" />)</strong>
                    <span><xsl:value-of select="from" /> ~ <xsl:value-of select="to" /></span>
                    <xsl:value-of select="details" />
                </li>
                </xsl:for-each>
            </ul>
        </div>
    </xsl:template>
    
</xsl:stylesheet>

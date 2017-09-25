<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="xml"/>

    <xsl:template name="experience">
        <div class="experience">
            <h2>
                <xsl:value-of select="position" />
            </h2>
            <p class="infos">
                <strong>
                    <xsl:value-of select="employer" />
                </strong>
                <br />
                <xsl:value-of select="from" /> à 
                <xsl:call-template name="toDate">
                    <xsl:with-param name="experience" select="to"/>
                </xsl:call-template>
            </p>
            <ul>
                <xsl:for-each select="details/info">
                    <li>
                        <xsl:value-of select="." />
                    </li>
                </xsl:for-each>
            </ul>
        </div>
    </xsl:template>

    <xsl:template name="experiences">
        <xsl:for-each select="/resume/experiences/experience">
            <xsl:call-template name="experience">
                <xsl:with-param name="experience" select="."/>
            </xsl:call-template>
        </xsl:for-each>
    </xsl:template>
   
    <xsl:template name="toDate">
        <xsl:param name="to" select="to" />
        <xsl:choose>
            <xsl:when test="normalize-space($to) != ''">
                <xsl:value-of select="$to" />
            </xsl:when>
            <xsl:otherwise>
               Aujourd'hui
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>

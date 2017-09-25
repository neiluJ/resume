<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="xml"/>

    <xsl:template name="experience">
        <xsl:element name="li">
            <xsl:attribute name="class">
                <xsl:choose>
                    <xsl:when test="@visible = 'true'">
                        <xsl:text>visible</xsl:text>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:text>hidden</xsl:text>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:attribute>
            
            <p class="date">
                <xsl:value-of select="from" /> à 
                <xsl:call-template name="toDate">
                    <xsl:with-param name="experience" select="to"/>
                </xsl:call-template>
            </p>
            <h3>
                <xsl:value-of select="position" />
            </h3>
            <p class="employer">
                <xsl:value-of select="employer" />
            </p>
            <ul>
                <xsl:for-each select="details/info">
                    <li>
                        <xsl:value-of select="." />
                    </li>
                </xsl:for-each>
            </ul>
        </xsl:element>
    </xsl:template>

    <xsl:template name="experiences">
        <ul id="work">
            <xsl:for-each select="/resume/experiences/experience">
                <xsl:call-template name="experience">
                    <xsl:with-param name="experience" select="."/>
                </xsl:call-template>
            </xsl:for-each>
        </ul>
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

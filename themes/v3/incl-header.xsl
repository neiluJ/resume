<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : incl-header.xsl
    Created on : 6 décembre 2011, 11:31
    Author     : neiluj
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:template name="header">
<xsl:comment>
         Welcome to my resume :)
            _ _        _                   
 _ __   ___(_) |_   _ (_)  _ __  _ __ ___  
| '_ \ / _ \ | | | | || | | '_ \| '__/ _ \ 
| | | |  __/ | | |_| || |_| |_) | | | (_) |
|_| |_|\___|_|_|\__,_|/ (_) .__/|_|  \___/ 
                    |__/  |_|              
</xsl:comment>
            <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
            <xsl:element name="meta">
                <xsl:attribute name="name">Author</xsl:attribute>
                <xsl:attribute name="content">
                    <xsl:value-of select="/resume/head/name" />
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="meta">
                <xsl:attribute name="name">Description</xsl:attribute>
                <xsl:attribute name="content">
                    <xsl:value-of select="/resume/head/description" />
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="meta">
                <xsl:attribute name="name">Copyright</xsl:attribute>
                <xsl:attribute name="content">
                    <xsl:value-of select="/resume/head/copyright" />
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="meta">
                <xsl:attribute name="name">Keywords</xsl:attribute>
                <xsl:attribute name="content">
                    <xsl:value-of select="/resume/head/keywords" />
                </xsl:attribute>
            </xsl:element>
            <meta name="Generator" content="moi meme :)" />
            <xsl:element name="title">
                  <xsl:value-of select="/resume/head/description" />
            </xsl:element>
    </xsl:template>

</xsl:stylesheet>

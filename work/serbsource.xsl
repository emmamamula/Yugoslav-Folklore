<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="3.0"
    xmlns="http://www.w3.org/1999/xhtml">
    <xsl:output method="xml" indent="yes" doctype-system="about:legacy-compat"/>

    <xsl:template match="/">
        <html>
            <head>
                <title>Analysis of Serbian Songs</title>
            </head>
            <body>
                <h1> Српске народне женске песме</h1>
                <hr/>
                <h2>Table of Contents</h2>
                <ul>
                    <xsl:apply-templates select="//TOC"/>
                </ul>
                <hr/>
                <h2>Songs</h2>
                <xsl:apply-templates select="//song"/>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="songnm">
        <xsl:variable name="position" as="xs:integer" select="count(preceding-sibling::songnm) + 1"/>
        <li>
            <a href="#song{$position}">
                <xsl:apply-templates/>
            </a>
        </li>
    </xsl:template>
    <xsl:template match="song">
        <xsl:variable name="position" as="xs:integer" select="count(preceding-sibling::song) + 1"/>
        <h3 id="song{$position}">
            <xsl:apply-templates select="name"/>
        </h3>
        <p>
            <xsl:apply-templates select="l"/>
        </p>
    </xsl:template>
    <xsl:template match="l">
        <xsl:apply-templates/>
        <xsl:if test="following-sibling::l">
            <br/>
        </xsl:if>
    </xsl:template>



</xsl:stylesheet>

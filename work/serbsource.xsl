<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="3.0" 
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
                <xsl:apply-templates/>
                <hr/>
                <xsl:apply-templates/>
            </body>
        </html>
</xsl:template>
    <xsl:template match="song/name">
        <li>
            <a>
            <xsl:apply-templates select="name"/>
            </a>
        </li>
    </xsl:template>
    <hr/>
 
    
    
    
</xsl:stylesheet>
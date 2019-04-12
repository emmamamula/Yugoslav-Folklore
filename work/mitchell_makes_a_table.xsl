<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns="http://www.w3.org/1999/xhtml" version="3.0">
    <xsl:output method="xml" indent="yes" doctype-system="about:legacy-compat"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>Adj</title>
                <style>
                    table { border-collapse: collapse; }
                    table, th, td { border: 1px solid black; }
                </style>
            </head>
            <body>
                <h1>Serb Songs</h1>
                <h2>I spent five hours on xquery last night</h2>
                <table>
                    <tr>
                        <th>Gender</th>
                        <th>Positive/Negative</th>
                    </tr>
                    <xsl:apply-templates select="//anthology"/>
                </table>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="anthology">
        <tr>
            <td>
                <xsl:apply-templates select="count(descendant::adj[@gender='female', @posneg='positive'])"/>
            </td>
            <td>
                <xsl:apply-templates select="count(@gender='male')"/>
            </td>
        </tr>
        <tr>
            <td>
                <xsl:apply-templates select="count(@gender='female')"/>
            </td>
            <td>
                <xsl:apply-templates select="count(@gender='male')"/>
            </td>
        </tr>
    </xsl:template>
</xsl:stylesheet>
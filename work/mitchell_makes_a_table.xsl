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
                <h1>Adjectives by Gender and Connotation</h1>
                <table>
                    <tr>
                        <th></th>
                        <th>Female</th>
                        <th>Male</th>
                    </tr>
                    <xsl:apply-templates select="//anthology"/>
                </table>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="anthology">
        <tr>
            <td>Positive</td>
            <td>
                <xsl:apply-templates select="count(descendant::adj[@gender='female' and @posneg='positive'])"/>
            </td>
            <td>
                <xsl:apply-templates select="count(descendant::adj[@gender='male' and @posneg='positive'])"/>
            </td>
        </tr>
        <tr>
            <td>Negative</td>
            <td>
                <xsl:apply-templates select="count(descendant::adj[@gender='female' and @posneg='negative'])"/>
            </td>
            <td>
                <xsl:apply-templates select="count(descendant::adj[@gender='male' and @posneg='negative'])"/>
            </td>
        </tr>
    </xsl:template>
</xsl:stylesheet>
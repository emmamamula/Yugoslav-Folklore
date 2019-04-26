<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns="http://www.w3.org/1999/xhtml" version="3.0">
    <xsl:output method="xml" indent="yes" doctype-system="about:legacy-compat"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>Analysis of Serbian Songs</title>
            </head>
            <body>
                <h1 id="Home">Serbian Songs</h1>
                <hr/>
                <h2>Table of Contents</h2>
                <xsl:apply-templates mode="toc"/>
                <hr/>
                <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template>
        <xsl:template match="song" mode="toc">
        <li><a>
            <xsl:attribute name="href">
                <xsl:text>#Song</xsl:text>
                <xsl:value-of select="./number"/>
            </xsl:attribute>
            <xsl:value-of select="./number"/>
            <xsl:text> – </xsl:text>
            <xsl:value-of select="./name"/>
        </a></li>
    </xsl:template>
    <xsl:template match="song">
        <br/><br/>
        <a>
            <xsl:attribute name="href">
                <xsl:text>#Home</xsl:text>
            </xsl:attribute>
            <xsl:text>(Go back to top)</xsl:text>
        </a>
        <br/>
        <p><h2>
            <xsl:attribute name="id">
                <xsl:text>Song</xsl:text>
                <xsl:value-of select="./number"/>
            </xsl:attribute>
            <xsl:value-of select="./number"/>
            <xsl:text> – </xsl:text>
            <xsl:value-of select="./name"/>
        </h2></p>
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="number"/>
    <xsl:template match="name"/>
    <xsl:template match="song/l">
        <xsl:apply-templates/>
        <br/>
    </xsl:template>
    <!--NOUNS-->
    <xsl:template match="noun[@gender='female']">
        <span class="NounFem">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="noun[@gender='male']">
        <span class="NounMale">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="noun[@gender ne 'male' and @gender ne 'female']">
        <span class="Noun">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <!--ADJECTIVES-->
    <xsl:template match="adj[@gender='female' and @posneg='positive']">
        <span class="AdjFemPos">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="adj[@gender='female' and @posneg='negative']">
        <span class="AdjFemNeg">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="adj[@gender='female' and (@posneg ne 'positive' and @posneg ne 'negative')]">
        <span class="AdjFem">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="adj[@gender='male' and @posneg='positive']">
        <span class="AdjMalePos">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="adj[@gender='male' and @posneg='negative']">
        <span class="AdjMaleNeg">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="adj[@gender='male' and (@posneg ne 'positive' and @posneg ne 'negative')]">
        <span class="AdjMale">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="adj[@posneg='positive' and (@gender ne 'male' and @gender ne 'female')]">
        <span class="AdjPos">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="adj[@posneg='negative' and (@gender ne 'male' and @gender ne 'female')]">
        <span class="AdjNeg">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="adj[@posneg ne 'positive' and @posneg ne 'negative' and @gender ne 'male' and @gender ne 'female']">
        <span class="AdjNeg">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
</xsl:stylesheet>
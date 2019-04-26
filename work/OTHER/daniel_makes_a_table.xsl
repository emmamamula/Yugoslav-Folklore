<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="3.0"
    xmlns="http://www.w3.org/2000/svg" >
    <xsl:output method="xml" indent="yes"/>
    <xsl:variable name="xscale" as="xs:integer" select="10"/>
    <xsl:variable name="yscale" as="xs:integer" select="20"/>
    <xsl:variable name="adjs-total" as="xs:double" select="count(//adj[(@gender='female' or @gender='male') and (@posneg='positive' or @posneg='negative')])"/>
    <xsl:template match="/">
        <svg >
            <!--DRAWING THE GRID-->
            <g transform="translate(50,350)">
                <!--DRAWING THE TABLE-->
                <rect x="100" y="-300" height="50" width="100" fill-opacity="0" stroke="black" stroke-opacity="100" stroke-width="3"></rect>
                <rect x="200" y="-300" height="50" width="100" fill-opacity="0" stroke="black" stroke-opacity="100" stroke-width="3"></rect>
                <rect x="100" y="-250" height="50" width="100" fill-opacity="0" stroke="black" stroke-opacity="100" stroke-width="3"></rect>
                <rect x="200" y="-250" height="50" width="100" fill-opacity="0" stroke="black" stroke-opacity="100" stroke-width="3"></rect>
                <text x="150" y="-310" text-anchor="middle"><value-of select="$adjs-total"/>FEMALE</text>
                <text x="250" y="-310" text-anchor="middle">MALE</text>
                <text x="80" y="-270" text-anchor="end">POSITIVE</text>
                <text x="80" y="-220" text-anchor="end">NEGATIVE</text>
                <xsl:apply-templates select="//anthology"/>
            </g>
        </svg>
    </xsl:template>
    
    <xsl:template match="//anthology">
        <xsl:variable name="fem-pos" as="xs:double" select="count(//adj[@gender='female' and @posneg='positive'])"/>
        <xsl:variable name="fem-neg" as="xs:double" select="count(//adj[@gender='female' and @posneg='negative'])"/>
        <xsl:variable name="male-pos" as="xs:double" select="count(//adj[@gender='male' and @posneg='positive'])"/>
        <xsl:variable name="male-neg" as="xs:double" select="count(//adj[@gender='male' and @posneg='negative'])"/>
        <xsl:variable name="fem-pos-pct" as="xs:double" select="$fem-pos * 100 div $adjs-total"/>
        <xsl:variable name="fem-neg-pct" as="xs:double" select="$fem-neg * 100 div $adjs-total"/>
        <xsl:variable name="male-pos-pct" as="xs:double" select="$male-pos * 100 div $adjs-total"/>
        <xsl:variable name="male-neg-pct" as="xs:double" select="$male-neg * 100 div $adjs-total"/>
        <!--ENTERING THE NUMBERS IN THE CELLS-->
        <text x="150" y="-280" text-anchor="middle"><xsl:value-of select="$fem-pos"/></text>
        <text x="150" y="-230" text-anchor="middle"><xsl:value-of select="$fem-neg"/></text>
        <text x="250" y="-280" text-anchor="middle"><xsl:value-of select="$male-pos"/></text>
        <text x="250" y="-230" text-anchor="middle"><xsl:value-of select="$male-neg"/></text>
        <!--ENTERING THE PERCENTAGES-->
        <text x="150" y="-260" text-anchor="middle">(<xsl:value-of select="format-number($fem-pos-pct,'#.0')"/>%)</text>
        <text x="150" y="-210" text-anchor="middle">(<xsl:value-of select="format-number($fem-neg-pct,'#.0')"/>%)</text>
        <text x="250" y="-260" text-anchor="middle">(<xsl:value-of select="format-number($male-pos-pct,'#.0')"/>%)</text>
        <text x="250" y="-210" text-anchor="middle">(<xsl:value-of select="format-number($male-neg-pct,'#.0')"/>%)</text>
    </xsl:template>
</xsl:stylesheet>
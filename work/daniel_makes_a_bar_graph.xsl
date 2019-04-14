<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="3.0"
    xmlns="http://www.w3.org/2000/svg" >
    <xsl:output method="xml" indent="yes"/>
    <xsl:variable name="bar-width" as="xs:integer" select="25"/>
    <xsl:variable name="bar-interval" as="xs:integer" select="100"/>
    <xsl:variable name="xlength" as="xs:integer" select="count(//pasta)*($bar-interval+$bar-width)"/>
    <xsl:variable name="ylength" as="xs:integer" select="600"/>
    <xsl:variable name="yscale" as="xs:double" select="$ylength div $max-pasta"/>
    <xsl:variable name="total" as="xs:double" select="sum(//pasta)"/>
    <xsl:variable name="max-pasta" as="xs:double" select="max(descendant::pasta) * 100 div $total"/>
    
    <xsl:template match="/">
        <svg >
            <g transform="translate(80,650)">
                <line x1="0" y1="0" x2="{$xlength+50}" stroke="black" stroke-width="2" stroke-linecap="square" y2="0"/>
                <line x1="0" y1="0" x2="0" y2="-{$ylength}" stroke="black" stroke-width="2"/>
                <line x1="0" y1="-{$ylength div 4}" x2="{$xlength+50}" y2="-{$ylength div 4}" stroke="darkred" stroke-width="1" stroke-dasharray="5,5"/>
                <line x1="0" y1="-{$ylength div 2}" x2="{$xlength+50}" y2="-{$ylength div 2}" stroke="darkred" stroke-width="1" stroke-dasharray="5,5"/>
                <line x1="0" y1="-{$ylength div 4 * 3}" x2="{$xlength+50}" y2="-{$ylength div 4 * 3}" stroke="darkred" stroke-width="1" stroke-dasharray="5,5"/>
                <line x1="0" y1="-{$ylength}" x2="{$xlength+50}" y2="-{$ylength}" stroke="darkred" stroke-width="1" stroke-dasharray="5,5"/>
                <text x="-5" y="-{$ylength * 0.25}" font-size="22" text-anchor="end" fill="darkred"><xsl:value-of select="$max-pasta * 0.25"/>%</text>
                <text x="-5" y="-{$ylength * 0.50}" font-size="22" text-anchor="end" fill="darkred"><xsl:value-of select="$max-pasta * 0.50"/>%</text>
                <text x="-5" y="-{$ylength * 0.75}" font-size="22" text-anchor="end" fill="darkred"><xsl:value-of select="$max-pasta * 0.75"/>%</text>
                <text x="-5" y="-{$ylength * 1.00}" font-size="22" text-anchor="end" fill="darkred"><xsl:value-of select="$max-pasta * 1.00"/>%</text>
                <xsl:apply-templates select="//pasta"/>
            </g>
        </svg>
        
    </xsl:template>
    <xsl:template match="//pasta">
        <xsl:variable name="pasta_value" as="xs:double" select="."/>
        <xsl:variable name="pasta_height" as="xs:double" select="$pasta_value * 100 div $total"/>
        <xsl:variable name="preceding-pasta" as="xs:integer" select="count(preceding::pasta)"/>
        <rect x="{$bar-interval + ($bar-width+$bar-interval) * $preceding-pasta}" y="-{$pasta_height * $yscale}" 
            height="{$pasta_height * $yscale}" width="{$bar-width}" fill="rgb({$pasta_value}, 0, {255-$pasta_value})" stroke="black" stroke-width="2"/>
        <text x="{$bar-interval + ($bar-width+$bar-interval) * $preceding-pasta + ($bar-width div 2)}" y="30" font-size="30" text-anchor="start" transform="rotate(45 {$bar-interval + ($bar-width+$bar-interval) * $preceding-pasta + ($bar-width div 2)}, 0)">
            <xsl:value-of select="./@type"/>
        </text>
    </xsl:template>
</xsl:stylesheet>
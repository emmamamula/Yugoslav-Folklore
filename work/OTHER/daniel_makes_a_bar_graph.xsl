<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="3.0"
    xmlns="http://www.w3.org/2000/svg" >
    <xsl:output method="xml" indent="yes"/>
    <xsl:variable name="bar-width" as="xs:integer" select="25"/>
    <xsl:variable name="bar-interval" as="xs:integer" select="100"/>
    <xsl:variable name="ylength" as="xs:integer" select="600"/>
    <xsl:variable name="nouns-xlength" as="xs:integer" select="600"/>    
    <xsl:variable name="nouns-total" as="xs:double" select="count(//noun[@gender='female'] | //noun[@gender='male'])"/>
    <xsl:variable name="nouns-yscale" as="xs:double" select="$ylength div 100"/>
    <xsl:template match="/">
        <svg >
            <g transform="translate(80,650)">
                <line x1="0" y1="0" x2="{$nouns-xlength+50}" stroke="black" stroke-width="2" stroke-linecap="square" y2="0"/>
                <line x1="0" y1="0" x2="0" y2="-{$ylength}" stroke="black" stroke-width="2"/>
                <line x1="0" y1="-{$ylength div 4}" x2="{$nouns-xlength+50}" y2="-{$ylength div 4}" stroke="darkred" stroke-width="1" stroke-dasharray="5,5"/>
                <line x1="0" y1="-{$ylength div 2}" x2="{$nouns-xlength+50}" y2="-{$ylength div 2}" stroke="darkred" stroke-width="1" stroke-dasharray="5,5"/>
                <line x1="0" y1="-{$ylength div 4 * 3}" x2="{$nouns-xlength+50}" y2="-{$ylength div 4 * 3}" stroke="darkred" stroke-width="1" stroke-dasharray="5,5"/>
                <line x1="0" y1="-{$ylength}" x2="{$nouns-xlength+50}" y2="-{$ylength}" stroke="darkred" stroke-width="1" stroke-dasharray="5,5"/>
                <text x="-5" y="-{$ylength * 0.25}" font-size="22" text-anchor="end" fill="darkred">25%</text>
                <text x="-5" y="-{$ylength * 0.50}" font-size="22" text-anchor="end" fill="darkred">50%</text>
                <text x="-5" y="-{$ylength * 0.75}" font-size="22" text-anchor="end" fill="darkred">75%</text>
                <text x="-5" y="-{$ylength * 1.00}" font-size="22" text-anchor="end" fill="darkred">100%</text>
                <xsl:apply-templates select="//anthology"/>
            </g>
        </svg>
        
    </xsl:template>
    <xsl:template match="//anthology">
        <xsl:variable name="nouns_female_value" as="xs:double" select="count(//noun[@gender='female'])"/>
        <xsl:variable name="nouns_male_value" as="xs:double" select="count(//noun[@gender='male'])"/>
        <xsl:variable name="nouns_female_height" as="xs:double" select="$nouns_female_value * 100 div $nouns-total"/>
        <xsl:variable name="nouns_male_height" as="xs:double" select="$nouns_male_value * 100 div $nouns-total"/>
        <rect x="{$bar-interval*1.5}" y="-{$nouns_female_height * $nouns-yscale}" 
            height="{$nouns_female_height * $nouns-yscale}" width="{$bar-width}" fill="red" stroke="black" stroke-width="2"/>
        <rect x="{$bar-interval*1.5}" y="-{$ylength}" 
            height="{$nouns_male_height * $nouns-yscale}" width="{$bar-width}" fill="blue" stroke="black" stroke-width="2"/>
        <text x="{$bar-interval*1.8}" y="-{$nouns_female_height * $nouns-yscale * 0.5}">
            <xsl:value-of select="$nouns_female_value"/> female
        </text>
        <text x="{$bar-interval*1.8}" y="-{$ylength - ($nouns_male_height * $nouns-yscale * 0.5)}">
            <xsl:value-of select="$nouns_male_value"/> male
        </text>
        <text x="{$bar-interval*1.5 + $bar-width*0.5}" y="20" text-anchor="middle">VERBS</text>
    </xsl:template>
</xsl:stylesheet>
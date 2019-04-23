<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="3.0"
    xmlns="http://www.w3.org/2000/svg" >
    <xsl:output method="xml" indent="yes"/>
    <xsl:variable name="bar-width" as="xs:integer" select="25"/>
    <xsl:variable name="bar-interval" as="xs:integer" select="150"/>
    <xsl:variable name="ylength" as="xs:integer" select="600"/>
    <xsl:variable name="xlength" as="xs:integer" select="700"/>    
    <xsl:variable name="yscale" as="xs:double" select="$ylength div 100"/>
    <xsl:variable name="nouns-total" as="xs:double" select="count(//noun)"/>
    <xsl:variable name="adjs-total" as="xs:double" select="count(//adj)"/>
    <!--
    <xsl:variable name="nouns-total" as="xs:double" select="count(//noun[@gender='female'] | //noun[@gender='male'])"/>
    <xsl:variable name="adjs-total" as="xs:double" select="count(//adj[@gender='female'] | //adj[@gender='male'])"/>
    -->
    <xsl:template match="/">
        <svg >
            <!--DRAWING THE GRID-->
            <g transform="translate(80,650)">
                <line x1="0" y1="0" x2="{$xlength+50}" stroke="black" stroke-width="2" stroke-linecap="square" y2="0"/>
                <line x1="0" y1="0" x2="0" y2="-{$ylength}" stroke="black" stroke-width="2"/>
                <line x1="0" y1="-{$ylength div 4}" x2="{$xlength+50}" y2="-{$ylength div 4}" stroke="darkred" stroke-width="1" stroke-dasharray="5,5"/>
                <line x1="0" y1="-{$ylength div 2}" x2="{$xlength+50}" y2="-{$ylength div 2}" stroke="darkred" stroke-width="1" stroke-dasharray="5,5"/>
                <line x1="0" y1="-{$ylength div 4 * 3}" x2="{$xlength+50}" y2="-{$ylength div 4 * 3}" stroke="darkred" stroke-width="1" stroke-dasharray="5,5"/>
                <line x1="0" y1="-{$ylength}" x2="{$xlength+50}" y2="-{$ylength}" stroke="darkred" stroke-width="1" stroke-dasharray="5,5"/>
                <text x="-5" y="-{$ylength * 0.25}" font-size="22" text-anchor="end" fill="darkred">25%</text>
                <text x="-5" y="-{$ylength * 0.50}" font-size="22" text-anchor="end" fill="darkred">50%</text>
                <text x="-5" y="-{$ylength * 0.75}" font-size="22" text-anchor="end" fill="darkred">75%</text>
                <text x="-5" y="-{$ylength * 1.00}" font-size="22" text-anchor="end" fill="darkred">100%</text>
                <xsl:apply-templates select="//anthology"/>
            </g>
        </svg>
        
    </xsl:template>
    <xsl:template match="//anthology">
        <xsl:variable name="nouns-female-count" as="xs:double" select="count(//noun[@gender='female'])"/>
        <xsl:variable name="nouns-male-count" as="xs:double" select="count(//noun[@gender='male'])"/>
        <xsl:variable name="adjs-female-count" as="xs:double" select="count(//adj[@gender='female'])"/>
        <xsl:variable name="adjs-male-count" as="xs:double" select="count(//adj[@gender='male'])"/>
        <xsl:variable name="adjs-pos-count" as="xs:double" select="count(//adj[@posneg='positive'])"/>
        <xsl:variable name="adjs-neg-count" as="xs:double" select="count(//adj[@posneg='negative'])"/>
        <xsl:variable name="nouns-female-pct" as="xs:double" select="$nouns-female-count * 100 div $nouns-total"/>
        <xsl:variable name="nouns-male-pct" as="xs:double" select="$nouns-male-count * 100 div $nouns-total"/>
        <xsl:variable name="adjs-female-pct" as="xs:double" select="$adjs-female-count * 100 div $adjs-total"/>
        <xsl:variable name="adjs-male-pct" as="xs:double" select="$adjs-male-count * 100 div $adjs-total"/>
        <xsl:variable name="adjs-pos-pct" as="xs:double" select="$adjs-pos-count * 100 div $adjs-total"/>
        <xsl:variable name="adjs-neg-pct" as="xs:double" select="$adjs-neg-count * 100 div $adjs-total"/>
        <!--NOUNS (FEMALE/MALE)-->
        <rect x="{$bar-interval}" y="-{$nouns-female-pct * $yscale}" 
            height="{$nouns-female-pct * $yscale}" width="{$bar-width}" fill="red" stroke="black" stroke-width="2"/>
        <rect x="{$bar-interval}" y="-{($nouns-female-pct + $nouns-male-pct) * $yscale}" 
            height="{$nouns-male-pct * $yscale}" width="{$bar-width}" fill="blue" stroke="black" stroke-width="2"/>
        <text x="{$bar-interval*1.25}" y="-{$nouns-female-pct * $yscale * 0.5}">
            <xsl:value-of select="$nouns-female-count"/> female
        </text>
        <text x="{$bar-interval*1.25}" y="-{($nouns-female-pct + $nouns-male-pct*0.5) * $yscale}">
            <xsl:value-of select="$nouns-male-count"/> male
        </text>
        <text x="{$bar-interval + $bar-width*0.5}" y="20" text-anchor="middle" font-weight="bold">Nouns</text>
        <text x="{$bar-interval + $bar-width*0.5}" y="35" text-anchor="middle">Female/Male</text>
        <!--ADJECTIVES (FEMALE/MALE)-->
        <rect x="{$bar-interval*2.25}" y="-{$adjs-female-pct * $yscale}" 
            height="{$adjs-female-pct * $yscale}" width="{$bar-width}" fill="red" stroke="black" stroke-width="2"/>
        <rect x="{$bar-interval*2.25}" y="-{($adjs-female-pct + $adjs-male-pct) * $yscale}" 
            height="{$adjs-male-pct * $yscale}" width="{$bar-width}" fill="blue" stroke="black" stroke-width="2"/>
        <text x="{$bar-interval*2.5}" y="-{$adjs-female-pct * $yscale * 0.5}">
            <xsl:value-of select="$adjs-female-count"/> female
        </text>
        <text x="{$bar-interval*2.5}" y="-{($adjs-female-pct + $adjs-male-pct*0.5) * $yscale}">
            <xsl:value-of select="$adjs-male-count"/> male
        </text>
        <text x="{$bar-interval*2.25+ $bar-width*0.5}" y="20" text-anchor="middle" font-weight="bold">Adjectives</text>
        <text x="{$bar-interval*2.25 + $bar-width*0.5}" y="35" text-anchor="middle">Female/Male</text>
        <!--ADJECTIVES (POS/NEG)-->
        <rect x="{$bar-interval*4}" y="-{$adjs-pos-pct * $yscale}" 
            height="{$adjs-pos-pct * $yscale}" width="{$bar-width}" fill="orange" stroke="black" stroke-width="2"/>
        <rect x="{$bar-interval*4}" y="-{($adjs-pos-pct + $adjs-neg-pct) * $yscale}" 
            height="{$adjs-neg-pct * $yscale}" width="{$bar-width}" fill="darkgreen" stroke="black" stroke-width="2"/>
        <text x="{$bar-interval*4.25}" y="-{$adjs-pos-pct * $yscale * 0.5}">
            <xsl:value-of select="$adjs-pos-count"/> positive
        </text>
        <text x="{$bar-interval*4.25}" y="-{($adjs-pos-pct + $adjs-neg-pct*0.5) * $yscale}">
            <xsl:value-of select="$adjs-neg-count"/> negative
        </text>
        <text x="{$bar-interval*4 + $bar-width*0.5}" y="20" text-anchor="middle" font-weight="bold">Adjectives</text>
        <text x="{$bar-interval*4 + $bar-width*0.5}" y="35" text-anchor="middle">Positive/Negative</text>
    </xsl:template>
</xsl:stylesheet>
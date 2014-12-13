<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
    <xsl:output method="text"/>
    <xsl:template match="table">
        <xsl:apply-templates select="//tr[child::th]"/>
        <xsl:apply-templates select="//tr[child::td]"/>
    </xsl:template>
    <xsl:template match="tr[child::th]">
        <xsl:value-of select="concat(th[1], ',', th[2], ',' , th[3], '&#x0a;')"/>
    </xsl:template>
    <xsl:template match="tr[child::td]">
        <xsl:value-of select="concat(td[1], ',', td[2], ',' , td[3], '&#x0a;')"/>
    </xsl:template>
</xsl:stylesheet>
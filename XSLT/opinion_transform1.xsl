<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:template match="opinion">
        <xsl:result-document indent="yes" href="{concat('opinions_name/', @date_filed,'.xml')}">
        <opinion>
            <metadata>
                <case_name><xsl:apply-templates select="@case_name"></xsl:apply-templates></case_name>
                <id><xsl:apply-templates select="@id"/></id>
                <date_filed><xsl:apply-templates select="@date_filed"/></date_filed>
                <judges><xsl:apply-templates select="@judges"/></judges>
                <nature_of_suit><xsl:apply-templates select="@nature_of_suit"/></nature_of_suit>
                <citation>
                    <volume><xsl:value-of select="(//span [@class = 'volume'])[1]" /></volume>
                    <reporter><xsl:value-of select="(//span [@class = 'reporter'])[1]" /></reporter>
                    <page><xsl:value-of select="(//span[@class= 'page'])[1]"></xsl:value-of></page>
                    <lexis_cite><xsl:apply-templates select="@lexis_cite"/></lexis_cite>
                </citation>
                <federal_cite_one><xsl:apply-templates select="@federal_cite_one"/></federal_cite_one>
                <cited_by><xsl:apply-templates select="@cited_by"/></cited_by>
                <precedential_status><xsl:apply-templates select="@precedential_status"/></precedential_status>
                <download_url><xsl:apply-templates select="@download_url"/></download_url>
                <source><xsl:apply-templates select="@source"/></source>
            </metadata>
            <body>
                <xsl:apply-templates/>
                
            </body>
        </opinion>
        </xsl:result-document>
    </xsl:template>
    
    <!--  
        <xsl:template match="div">
        <p>
           <xsl:apply-templates/>
        </p>
   
    </xsl:template>
     -->
    <xsl:template match="p">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    <xsl:template match="span">
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="sup">
        <span class="sup">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match="@cited_by">
        
        <xsl:variable name="case" select="tokenize(.,',')"/>
        <xsl:for-each select="$case">
            <case>
                <xsl:value-of select="."/>
            </case>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="h2">
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="a">
        <xsl:copy-of select="."/>
    </xsl:template>
    
</xsl:stylesheet>
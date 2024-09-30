<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:import href="CSV-UTILS.xsl" />
	<xsl:import href="STDT-CSV-UTILS.xsl" />
	<xsl:import href="ADMI-UTILS.xsl" />
	<xsl:output method="text" /> 	
	<!-- Support QG Section for STDT CSV XSL Transformation Process -->
	<xsl:template match="/">
    	<xsl:apply-templates select="XML__ReportExtract" />
  	</xsl:template>	
  	<xsl:template match="XML__ReportExtract">
  	    <xsl:call-template name="mainHeader1"/>
	   	<xsl:for-each select="reportExtractSet/PFQG__MasterArea"> 
		   <xsl:call-template name="plqg"/>
		</xsl:for-each>
	</xsl:template>
    <xsl:template name="plqg">  
        <xsl:call-template name="header1"/>
		<xsl:text>Effective Date,</xsl:text>	
		<xsl:text>Upper Limit,</xsl:text>	
		<xsl:text>Base Withheld,</xsl:text>
		<xsl:text>Withhold Percent,</xsl:text>
		<xsl:text>Amount Over</xsl:text>
		<xsl:text>&#10;</xsl:text>  
		<xsl:apply-templates select="__PFQG__EntrySet" />   
    </xsl:template>		
	<xsl:template match="PFQG__Entry">
    	<xsl:text>"</xsl:text>
    	<xsl:if test="count(preceding-sibling::PFQG__Entry) = 0">
    		<xsl:variable name="eff_Month" select="substring(__EFFECTIVE__DATEX, 6, 2)"/>
			<xsl:variable name="eff_Day" select="substring(__EFFECTIVE__DATEX, 9)"/>
			<xsl:variable name="eff_Year" select="substring(__EFFECTIVE__DATEX, 1, 4)"/>
			<xsl:variable name="eff_Date" select="concat($eff_Month, '-', $eff_Day, '-', $eff_Year)" />
			<xsl:value-of select="$eff_Date" />
		</xsl:if>
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__UPPER__LIMIT__AMT" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__BASE__WITHHOLD__AMT" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__WITHHLD__PCT" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__AMOUNT__OVER__AMT" />
		<xsl:text>"</xsl:text>
		<xsl:text>&#10;</xsl:text>
	</xsl:template> 
</xsl:stylesheet>
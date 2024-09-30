<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:import href="CSV-UTILS.xsl" />
	<xsl:import href="STDT-CSV-UTILS.xsl" />
	<xsl:import href="ADMI-UTILS.xsl" />
	<xsl:output method="text" /> 	
	<!-- Support LM Section for STDT CSV XSL Transformation Process -->
	<xsl:template match="/">
    	<xsl:apply-templates select="XML__ReportExtract" />
  	</xsl:template>	
  	<xsl:template match="XML__ReportExtract">
  	    <xsl:call-template name="mainHeader1"/>
	   	<xsl:for-each select="reportExtractSet/PFLM__MasterArea"> 
		   <xsl:call-template name="pllm"/>
		</xsl:for-each>
	</xsl:template>
    <xsl:template name="pllm">  
        <xsl:call-template name="header1"/>
		<xsl:text>Table Type,</xsl:text>	
		<xsl:text>Subtype,</xsl:text>	
		<xsl:text>Key Rule,</xsl:text>	
		<xsl:text>Key,</xsl:text>	
		<xsl:text>Rule Code,</xsl:text>
		<xsl:text>Over Amount,</xsl:text>
		<xsl:text>Short Amount,</xsl:text>
		<xsl:text>Other Amount</xsl:text>
		<xsl:text>&#10;</xsl:text>  
		<xsl:apply-templates select="__PFLM__EntrySet" />   
    </xsl:template>		
	<xsl:template match="PFLM__Entry">
    	<xsl:text>"</xsl:text>
    	<xsl:if test="count(preceding-sibling::PFLM__Entry) = 0">
			<xsl:value-of select="../../__TABLE__TYPE" />
		</xsl:if>
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
    	<xsl:text>"</xsl:text>
    	<xsl:if test="count(preceding-sibling::PFLM__Entry) = 0">
			<xsl:value-of select="../../__TABLE__SUB__TYPE" />
		</xsl:if>
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
    	<xsl:text>"</xsl:text>
		<xsl:value-of select="__KEY__RULE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__KEY" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__RULE__CODE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__OVER__AMOUNT" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__SHORT__AMOUNT" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__OTHER__AMOUNT" />
		<xsl:text>"</xsl:text>
		<xsl:text>&#10;</xsl:text>
	</xsl:template> 
</xsl:stylesheet>
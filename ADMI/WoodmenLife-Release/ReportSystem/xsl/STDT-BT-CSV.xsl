<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:import href="CSV-UTILS.xsl" />
	<xsl:import href="STDT-CSV-UTILS.xsl" />
	<xsl:import href="ADMI-UTILS.xsl" />
	<xsl:output method="text" /> 	
	<!-- Support BT Section for STDT CSV XSL Transformation Process -->
	<xsl:template match="/">
    	<xsl:apply-templates select="XML__ReportExtract" />
  	</xsl:template>	
  	<xsl:template match="XML__ReportExtract">
  	    <xsl:call-template name="mainHeader1"/>
	   	<xsl:for-each select="reportExtractSet/PFBT__MasterArea"> 
		   <xsl:call-template name="plbt"/>
		</xsl:for-each>
	</xsl:template>
    <xsl:template name="plbt">  
        <xsl:call-template name="header1"/>
		<xsl:text>Low Value,</xsl:text>	
		<xsl:text>High Value,</xsl:text>	
		<xsl:text>Use,</xsl:text>
		<xsl:text>Band 1 Amount/Percent,</xsl:text>
		<xsl:text>Band 2 Amount/Percent,</xsl:text>
		<xsl:text>Band 3 Amount/Percent,</xsl:text>
		<xsl:text>Band 4 Amount/Percent,</xsl:text>
		<xsl:text>Band 5 Amount/Percent</xsl:text>
		<xsl:text>&#10;</xsl:text>  
		<xsl:apply-templates select="__PFBT__EntrySet" />   
    </xsl:template>		
	<xsl:template match="PFBT__Entry">
    	<xsl:text>"</xsl:text>
		<xsl:value-of select="__LOW__VALUE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__HI__VALUE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__USE__CODE" />
		<xsl:text>"</xsl:text>
		<xsl:for-each select="__AMOUNT__OR__PCT/big-decimal">
			<xsl:text>,</xsl:text>
			<xsl:text>"</xsl:text>
			<xsl:value-of select="." />
			<xsl:text>"</xsl:text>
		</xsl:for-each>
		<xsl:text>&#10;</xsl:text>  	
	</xsl:template> 
</xsl:stylesheet>
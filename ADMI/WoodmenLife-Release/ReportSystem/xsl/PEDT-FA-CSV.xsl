<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:import href="CSV-UTILS.xsl" />
	<xsl:import href="PEDT-CSV-UTILS.xsl" />	
	<xsl:import href="ADMI-UTILS.xsl" />
	<xsl:output method="text" />	
	<!-- Support FA Section for PEDT CSV XSL Transformation Process -->
	<xsl:template match="/">
    	<xsl:apply-templates select="XML__ReportExtract" />
  	</xsl:template>	
  	<xsl:template match="XML__ReportExtract">
  	    <xsl:call-template name="mainHeader1"/>
	   	<xsl:for-each select="reportExtractSet/PFFA__MasterArea"> 
		   <xsl:call-template name="plfa"/>
		</xsl:for-each>
	</xsl:template>
    <xsl:template name="plfa">  
        <xsl:call-template name="header1"/>
        <xsl:call-template name="header2"/>
		<xsl:text>Change Duration Use,</xsl:text>	
		<xsl:text>Change Duration Months,</xsl:text>	
		<xsl:text>Value Per Unit Code,</xsl:text>
		<xsl:text>Value Per Unit,</xsl:text>
		<xsl:text>Policy Exhibits,</xsl:text>
		<xsl:text>Production Credit Code,</xsl:text>
		<xsl:text>Production Credit Amount</xsl:text>
		<xsl:text>&#10;</xsl:text>  		
    	<xsl:text>"</xsl:text>
		<xsl:value-of select="__CH__DURA__USE__CODE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__CH__DURA__MONTHS" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__VALUE__PER__CODE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__VALUE__PER__UNIT" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__PE__LINE__CODE" />
		<xsl:value-of select="__PE__ACTION__CODE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__PRODUCTION__CREDIT" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__PROD__CREDIT__AMOUNT" />
		<xsl:text>"</xsl:text>
		<xsl:text>&#10;</xsl:text>  		
		<xsl:text>&#10;</xsl:text>  		
    </xsl:template>		
</xsl:stylesheet>
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:import href="CSV-UTILS.xsl" />
	<xsl:import href="STDT-CSV-UTILS.xsl" />
	<xsl:import href="ADMI-UTILS.xsl" />
	<xsl:output method="text" /> 	
	<!-- Support GR Section for STDT CSV XSL Transformation Process -->
	<xsl:template match="/">
    	<xsl:apply-templates select="XML__ReportExtract" />
  	</xsl:template>	
  	<xsl:template match="XML__ReportExtract">
  	    <xsl:call-template name="mainHeader1"/>
	   	<xsl:for-each select="reportExtractSet/PFGR__MasterArea"> 
		   <xsl:call-template name="plgr"/>
		</xsl:for-each>
	</xsl:template>
    <xsl:template name="plgr">  
        <xsl:call-template name="header1"/>
		<xsl:text>Report ID,</xsl:text>	
		<xsl:text>Report Type,</xsl:text>	
		<xsl:text>Program ID,</xsl:text>
		<xsl:text>User Code,</xsl:text>
		<xsl:text>Report Sequence</xsl:text>
		<xsl:text>&#10;</xsl:text>  
		<xsl:apply-templates select="__PFGR__EntrySet" />   
    </xsl:template>		
	<xsl:template match="PFGR__Entry">
    	<xsl:text>"</xsl:text>
		<xsl:value-of select="__REPORT__ID" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__REPORT__TYPE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__PROGRAM__ID" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__USER__CODE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__REPORT__KEY__SEQ" />
		<xsl:text>"</xsl:text>
		<xsl:text>&#10;</xsl:text>  	
	</xsl:template> 
</xsl:stylesheet>
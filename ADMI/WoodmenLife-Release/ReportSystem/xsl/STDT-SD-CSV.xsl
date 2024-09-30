<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:import href="CSV-UTILS.xsl" />
	<xsl:import href="STDT-CSV-UTILS.xsl" />
	<xsl:import href="ADMI-UTILS.xsl" />
	<xsl:output method="text" /> 	
	<!-- Support SD Section for STDT CSV XSL Transformation Process -->
	<xsl:template match="/">
    	<xsl:apply-templates select="XML__ReportExtract" />
  	</xsl:template>	
  	<xsl:template match="XML__ReportExtract">
  	    <xsl:call-template name="mainHeader1"/>
	   	<xsl:for-each select="reportExtractSet/PFSD__MasterArea"> 
		   <xsl:call-template name="plsd"/>
		</xsl:for-each>
	</xsl:template>
    <xsl:template name="plsd">  
        <xsl:call-template name="header1"/>
		<xsl:text>Module Name</xsl:text>
		<xsl:text>&#10;</xsl:text>  
		<xsl:apply-templates select="__PFSD__EntrySet" />   
    </xsl:template>		
	<xsl:template match="PFSD__Entry">
    	<xsl:text>"</xsl:text>
		<xsl:value-of select="__MODULE__NAME" />
		<xsl:text>"</xsl:text>
		<xsl:text>&#10;</xsl:text>  	
	</xsl:template> 
</xsl:stylesheet>
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:import href="CSV-UTILS.xsl" />
	<xsl:import href="STDT-CSV-UTILS.xsl" />
	<xsl:import href="ADMI-UTILS.xsl" />
	<xsl:output method="text" /> 	
	<!-- Support KM Section for STDT CSV XSL Transformation Process -->
	<xsl:template match="/">
    	<xsl:apply-templates select="XML__ReportExtract" />
  	</xsl:template>	
  	<xsl:template match="XML__ReportExtract">
  	    <xsl:call-template name="mainHeader1"/>
	   	<xsl:for-each select="reportExtractSet/PFKM__MasterArea"> 
		   <xsl:call-template name="plkm"/>
		</xsl:for-each>
	</xsl:template>
    <xsl:template name="plkm">  
        <xsl:call-template name="header1"/>
		<xsl:text>TRME Pattern Codes,</xsl:text>	
		<xsl:text>Translate To,</xsl:text>	
		<xsl:text>Description</xsl:text>
		<xsl:text>&#10;</xsl:text>  
		<xsl:apply-templates select="__PFKM__EntrySet" />   
    </xsl:template>		
	<xsl:template match="PFKM__Entry">
    	<xsl:text>"</xsl:text>
    	<xsl:for-each select="__TRME__PATTERN/string">
    		<xsl:if test="text()">
				<xsl:value-of select="." />
				<xsl:text> </xsl:text>
			</xsl:if>
		</xsl:for-each>
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__FIELD__TRANSLATE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__FIELD__DESCRIPT" />
		<xsl:text>"</xsl:text>
		<xsl:text>&#10;</xsl:text>  	
	</xsl:template> 
</xsl:stylesheet>
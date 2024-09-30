<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:import href="CSV-UTILS.xsl" />
	<xsl:import href="STDT-CSV-UTILS.xsl" />
	<xsl:import href="ADMI-UTILS.xsl" />
	<xsl:output method="text" />
	<!-- Support MX Section for STDT CSV XSL Transformation Process -->
	<xsl:template match="/">
   	<xsl:apply-templates select="XML__ReportExtract" />
   	</xsl:template>	
  	<xsl:template match="XML__ReportExtract">
  	   <xsl:call-template name="mainHeader1"/>
	   <xsl:for-each select="reportExtractSet/PFMX__MasterArea">		
          <xsl:call-template name="plmx" />
 	   </xsl:for-each>
	</xsl:template>		
	<xsl:template name="plmx">	 
	    <xsl:call-template name="header1"/>  
		<xsl:text>"Field Codes&#10;1 2 3 4",</xsl:text>
		<xsl:text>Substitute Character,</xsl:text>
		<xsl:text>Terminate Character,</xsl:text>
		<xsl:text>Text Save Character,</xsl:text>
		<xsl:text>Text Information</xsl:text>	
		<xsl:text>&#10;</xsl:text>
              	<xsl:text>"</xsl:text>
		      	<xsl:value-of select="concat(substring(__FIELD__CODE,1,1), ' ', 
		      								 substring(__FIELD__CODE,2,1), ' ', 
		      								 substring(__FIELD__CODE,3,1), ' ', 
		      								 substring(__FIELD__CODE,4,1))"/>
			  	<xsl:text>"</xsl:text>
			  	<xsl:text>,</xsl:text>
			  <xsl:text>"</xsl:text>
			  <xsl:value-of select="__SUBSTITUTE__CHAR" />
			  <xsl:text>"</xsl:text>
			  <xsl:text>,</xsl:text>
			  <xsl:text>"</xsl:text>
			  <xsl:value-of select="__TERMINATE__CHAR" />
			  <xsl:text>"</xsl:text>
			  <xsl:text>,</xsl:text>
			  <xsl:text>"</xsl:text>
			  <xsl:value-of select="__TEXT__SAVE__CHAR" />
			  <xsl:text>"</xsl:text> 
			  <xsl:text>,</xsl:text>
			  <xsl:text>"</xsl:text>
			  <xsl:value-of select="__TEXT" />
			  <xsl:text>"</xsl:text> 
			  <xsl:text>&#10;</xsl:text>                      
	</xsl:template>
</xsl:stylesheet>
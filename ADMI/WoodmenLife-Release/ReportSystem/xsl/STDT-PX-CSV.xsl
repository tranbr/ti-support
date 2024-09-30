<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:import href="CSV-UTILS.xsl" />
	<xsl:import href="STDT-CSV-UTILS.xsl" />
	<xsl:import href="ADMI-UTILS.xsl" />
	<xsl:output method="text" /> 	
	<!-- Support PX Section for STDT CSV XSL Transformation Process -->
	<xsl:template match="/">
    	<xsl:apply-templates select="XML__ReportExtract" />
  	</xsl:template>	
  	<xsl:template match="XML__ReportExtract">
  	    <xsl:call-template name="mainHeader1"/>
	   	<xsl:for-each select="reportExtractSet/PFPX__MasterArea"> 
		   <xsl:call-template name="plpx"/>
		</xsl:for-each>
	</xsl:template>
    <xsl:template name="plpx">  
        <xsl:call-template name="header1"/>
		<xsl:text>Requirement Code,</xsl:text>	
		<xsl:text>Requirement Type,</xsl:text>	
		<xsl:text>Follow Up Code,</xsl:text>
		<xsl:text>Immediate Resolve,</xsl:text>
		<xsl:text>Status Code,</xsl:text>
		<xsl:text>Notify Use,</xsl:text>
		<xsl:text>Notify Time,</xsl:text>
		<xsl:text>Person Code,</xsl:text>
		<xsl:text>Notify Reason,</xsl:text>
		<xsl:text>Notify Desk</xsl:text>
		<xsl:text>&#10;</xsl:text>  
		<xsl:apply-templates select="__PFPX__EntrySet" />   
    </xsl:template>		
	<xsl:template match="PFPX__Entry">
    	<xsl:text>"</xsl:text>
		<xsl:value-of select="__REQUIREMENT__CODE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__REQUIREMENT__TYPE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__FOLLOW__UP__CODE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__IMMED__RESOLVE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__STATUS__CODE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__NOTIFY__USE__CODE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__NOTIFY__TIME" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__PERSON__CODE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__NOTIFY__REASON__CODE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__NOTIFY__DESK" />
		<xsl:text>"</xsl:text>
		<xsl:text>&#10;</xsl:text>  	
	</xsl:template> 
</xsl:stylesheet>
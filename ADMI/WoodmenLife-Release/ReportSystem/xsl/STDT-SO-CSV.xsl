<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:import href="CSV-UTILS.xsl" />
	<xsl:import href="STDT-CSV-UTILS.xsl" />
	<xsl:import href="ADMI-UTILS.xsl" />
	<xsl:output method="text" /> 	
	<!-- Support SO Section for STDT CSV XSL Transformation Process -->
	<xsl:template match="/">
    	<xsl:apply-templates select="XML__ReportExtract" />
  	</xsl:template>	
  	<xsl:template match="XML__ReportExtract">
  	    <xsl:call-template name="mainHeader1"/>
	   	<xsl:for-each select="reportExtractSet/PFSO__MasterArea"> 
		   <xsl:call-template name="plso"/>
		</xsl:for-each>
	</xsl:template>
    <xsl:template name="plso">  
        <xsl:call-template name="header1"/>
		<xsl:text>Remote System ID,</xsl:text>	
		<xsl:text>Remote Tran ID,</xsl:text>	
		<xsl:text>Status,</xsl:text>
		<xsl:text>Wait Time,</xsl:text>
		<xsl:text>Rule Number,</xsl:text>
		<xsl:text>Allowable Companies,</xsl:text>
		<xsl:text>Max Abends</xsl:text>
		<xsl:text>&#10;</xsl:text>  
		<xsl:apply-templates select="__PFSO__EntrySet" />   
    </xsl:template>		
	<xsl:template match="PFSO__Entry">
    	<xsl:text>"</xsl:text>
		<xsl:value-of select="__RESOURCE__SYSID" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__LOC__RMT__TRANSID" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__RESOURCE__STATUS" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__ACCEPT__WAIT__TIME" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__RULE__NUMBER" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		
		<xsl:text>"</xsl:text>	
		<xsl:for-each select="__COMPANY__CODE/string">
			<xsl:if test="text()">
				<xsl:value-of select="." />
				<xsl:text> </xsl:text>
			</xsl:if>
		</xsl:for-each>
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__ABENDS__REMAINING" />
		<xsl:text>"</xsl:text>
		<xsl:text>&#10;</xsl:text>  	
	</xsl:template> 
</xsl:stylesheet>
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:import href="CSV-UTILS.xsl" />
	<xsl:import href="STDT-CSV-UTILS.xsl" />
	<xsl:import href="ADMI-UTILS.xsl" />
	<xsl:output method="text" /> 	
	<!-- Support GB Section for STDT CSV XSL Transformation Process -->
	<xsl:template match="/">
    	<xsl:apply-templates select="XML__ReportExtract" />
  	</xsl:template>	
  	<xsl:template match="XML__ReportExtract">
  	    <xsl:call-template name="mainHeader1"/>
	   	<xsl:for-each select="reportExtractSet/PFGB__MasterArea"> 
		   <xsl:call-template name="plgb"/>
		</xsl:for-each>
	</xsl:template>
    <xsl:template name="plgb">  
        <xsl:call-template name="header1"/>
		<xsl:text>Deduct Code,</xsl:text>	
		<xsl:text>Accumulator ID,</xsl:text>	
		<xsl:text>Description Use,</xsl:text>
		<xsl:text>Description Content,</xsl:text>
		<xsl:text>Account Use,</xsl:text>
		<xsl:text>Account Number,</xsl:text>
		<xsl:text>Tran-1,</xsl:text>
		<xsl:text>Tran-2,</xsl:text>
		<xsl:text>FICA Indicator,</xsl:text>
		<xsl:text>Tax Indicator,</xsl:text>
		<xsl:text>Schedule Type,</xsl:text>
		<xsl:text>Benefit Indicator,</xsl:text>
		<xsl:text>Policy Use,</xsl:text>
		<xsl:text>Situation Indicator,</xsl:text>
		<xsl:text>Interest Indicator</xsl:text>
		<xsl:text>&#10;</xsl:text>  
		<xsl:apply-templates select="__PFGB__EntrySet" />   
    </xsl:template>		
	<xsl:template match="PFGB__Entry">
    	<xsl:text>"</xsl:text>
		<xsl:value-of select="__DEDUCT__NUMBER" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__ACCUMULATOR__ID" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__DESCRIPTION__USE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__DESCRIPTION" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__ACCOUNT__NUM__USE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__ACCOUNT__NUMBER" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__TRANSACTION__CODE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__OFFSET__TRANSACTION" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__FICA__INDICATOR" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__TAX__INDICATOR" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__SCHEDULING__IND" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__BENEFIT__IND" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__POLICY__NUM__IND" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__DEFAULT__SITUATION" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__INTEREST__IND" />
		<xsl:text>"</xsl:text>
		<xsl:text>&#10;</xsl:text>  	
	</xsl:template> 
</xsl:stylesheet>
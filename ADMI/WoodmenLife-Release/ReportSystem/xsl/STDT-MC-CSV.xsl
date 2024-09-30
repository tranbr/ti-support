<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:import href="CSV-UTILS.xsl" />
	<xsl:import href="STDT-CSV-UTILS.xsl" />
	<xsl:import href="ADMI-UTILS.xsl" />
	<xsl:output method="text" /> 	
	<!-- Support MC Section for STDT CSV XSL Transformation Process -->
	<xsl:template match="/">
    	<xsl:apply-templates select="XML__ReportExtract" />
  	</xsl:template>	
  	<xsl:template match="XML__ReportExtract">
  	    <xsl:call-template name="mainHeader1"/>
	   	<xsl:for-each select="reportExtractSet/PFMC__MasterArea"> 
		   <xsl:call-template name="plmc"/>
		</xsl:for-each>
	</xsl:template>
    <xsl:template name="plmc">  
        <xsl:call-template name="header1"/>
		<xsl:text>Issue State,</xsl:text>	
		<xsl:text>Anniv/Trans Use,</xsl:text>	
		<xsl:text>Anniv/Trans Date,</xsl:text>
		<xsl:text>Key Use,</xsl:text>
		<xsl:text>Compare Key,</xsl:text>
		<xsl:text>Duration Use,</xsl:text>
		<xsl:text>Thru Duration,</xsl:text>
		<xsl:text>Operator Code,</xsl:text>
		<xsl:text>Pattern Codes,</xsl:text>
		<xsl:text>Class Code,</xsl:text>
		<xsl:text>M And E Rate</xsl:text>
		<xsl:text>&#10;</xsl:text>  
		<xsl:apply-templates select="__PFMC__EntrySet" />   
    </xsl:template>		
	<xsl:template match="PFMC__Entry">
    	<xsl:text>"</xsl:text>
		<xsl:value-of select="__ISSUE__STATE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__ANNIV__OR__TRANS__USE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:variable name="anni_Month" select="substring(__ANNIV__OR__TRAN__DATE, 6, 2)"/>
		<xsl:variable name="anni_Day" select="substring(__ANNIV__OR__TRAN__DATE, 9)"/>
		<xsl:variable name="anni_Year" select="substring(__ANNIV__OR__TRAN__DATE, 1, 4)"/>
		<xsl:variable name="anni_Date" select="concat($anni_Month, '-', $anni_Day, '-', $anni_Year)" />
		<xsl:value-of select="$anni_Date" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__KEY__USE__CODE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__COMPARE__KEY" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__DUR__USE__CODE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__THRU__DURATION" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__OPERATOR__CODE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		
		<xsl:text>"</xsl:text>
		<xsl:for-each select="__PATTERN__CODES/string">
			<xsl:if test="text()">
				<xsl:value-of select="." />
				<xsl:text> </xsl:text>
			</xsl:if>
		</xsl:for-each>
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__CLASS__CODE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__M__AND__E__RATE" />
		<xsl:text>"</xsl:text>
		<xsl:text>&#10;</xsl:text>  	
	</xsl:template> 
</xsl:stylesheet>
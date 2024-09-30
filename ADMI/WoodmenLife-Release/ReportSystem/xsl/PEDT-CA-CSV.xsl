<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:import href="CSV-UTILS.xsl" />
	<xsl:import href="PEDT-CSV-UTILS.xsl" />	
	<xsl:import href="ADMI-UTILS.xsl" />
	<xsl:output method="text" />	
	<!-- Support CA Section for PEDT CSV XSL Transformation Process -->
	<xsl:template match="/">
    	<xsl:apply-templates select="XML__ReportExtract" />
  	</xsl:template>	
  	<xsl:template match="XML__ReportExtract">
  	    <xsl:call-template name="mainHeader1"/>
	   	<xsl:for-each select="reportExtractSet/PFCA__MasterArea"> 
		   <xsl:call-template name="plca"/>
		</xsl:for-each>
	</xsl:template>
    <xsl:template name="plca">  
        <xsl:call-template name="header1"/>
        <xsl:call-template name="header2"/>
		<xsl:text>Issue State,</xsl:text>	
		<xsl:text>Date 1,</xsl:text>	
		<xsl:text>Date 2,</xsl:text>
		<xsl:text>Variable 2 Access,</xsl:text>
		<xsl:text>Variable 3 Access,</xsl:text>
		<xsl:text>Cash Value Use,</xsl:text>
		<xsl:text>Charge Code,</xsl:text>
		<xsl:text>Financial Recording Code,</xsl:text>
		<xsl:text>Cash Value Months Use Code,</xsl:text>
		<xsl:text>Cash Value Months,</xsl:text>
		<xsl:text>Cash Value Key,</xsl:text>
		<xsl:text>Cash Value Per Unit,</xsl:text>
		<xsl:text>Duration Use,</xsl:text>
		<xsl:text>Duration Months,</xsl:text>
		<xsl:text>Banding Use,</xsl:text>
		<xsl:text>Primary Distribution,</xsl:text>
		<xsl:text>Secondary Distribution,</xsl:text>
		<xsl:text>NFO Indicator,</xsl:text>
		<xsl:text>Interpolation Method,</xsl:text>
		<xsl:text>Endowment Use Code,</xsl:text>
		<xsl:text>Endowment Amount/Percent</xsl:text>
		<xsl:text>&#10;</xsl:text>  		
 		<xsl:apply-templates select="__PFCA__EntrySet" />
    </xsl:template>		
    <xsl:template match="PFCA__Entry">	
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__ISSUE__STATE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:variable name="date1Month" select="substring(__DATEX__1, 6, 2)"/>
		<xsl:variable name="date1Day" select="substring(__DATEX__1, 9)"/>
		<xsl:variable name="date1Year" select="substring(__DATEX__1, 1, 4)"/>
		<xsl:variable name="date1Date" select="concat($date1Month, '-', $date1Day, '-', $date1Year)" />
		<xsl:value-of select="$date1Date" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:variable name="date2Month" select="substring(__DATEX__2, 6, 2)"/>
		<xsl:variable name="date2Day" select="substring(__DATEX__2, 9)"/>
		<xsl:variable name="date2Year" select="substring(__DATEX__2, 1, 4)"/>
		<xsl:variable name="date2Date" select="concat($date2Month, '-', $date2Day, '-', $date2Year)" />
		<xsl:value-of select="$date2Date" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__VAR__2__ACCESS" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__VAR__3__ACCESS" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__CASH__VAL__USE__CODE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__CHARGE__CODE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__FINANCIAL__RCD__CODE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__CV__MONTHS__USE__CODE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__CASH__VALUE__MONTHS" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__CV__PROCESSING__KEY" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__CASH__VAL__PER__UNIT" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__CV__CHANGE__DURA__USE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__CV__CHG__DURA__MONTHS" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__CV__BANDING__USE__CD" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__ENDOW__PRIM__DIST" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__ENDOW__SECD__DIST" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__ENDOW__NFO__IND" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__ENDOW__INTER__METHOD" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__ENDOW__USE__CODE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__ENDOW__PERCENT" />
		<xsl:text>"</xsl:text>
		<xsl:text>&#10;</xsl:text> 
	</xsl:template>
</xsl:stylesheet>
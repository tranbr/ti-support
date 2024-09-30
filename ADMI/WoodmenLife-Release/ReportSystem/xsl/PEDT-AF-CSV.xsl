<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:import href="CSV-UTILS.xsl" />
	<xsl:import href="PEDT-CSV-UTILS.xsl" />	
	<xsl:import href="ADMI-UTILS.xsl" />
	<xsl:output method="text" />	
	<!-- Support AF Section for PEDT CSV XSL Transformation Process -->
	<xsl:template match="/">
    	<xsl:apply-templates select="XML__ReportExtract" />
  	</xsl:template>	
  	<xsl:template match="XML__ReportExtract">
  	    <xsl:call-template name="mainHeader1"/>
	   	<xsl:for-each select="reportExtractSet/PFAF__MasterArea"> 
		   <xsl:call-template name="plaf"/>
		</xsl:for-each>
	</xsl:template>
    <xsl:template name="plaf">  
        <xsl:call-template name="header1"/>
        <xsl:call-template name="header2"/>
		<xsl:text>Issue State,</xsl:text>	
		<xsl:text>Date 1,</xsl:text>	
		<xsl:text>Date 2,</xsl:text>
		<xsl:text>Date Use,</xsl:text>
		<xsl:text>Death Benefit Option,</xsl:text>
		<xsl:text>Prorate Fee,</xsl:text>
		<xsl:text>Waive Fee Ind,</xsl:text>
		<xsl:text>Units Fee Code,</xsl:text>
		<xsl:text>Units Fee Financial Recording,</xsl:text>
		<xsl:text>Units Fee Per Unit,</xsl:text>
		<xsl:text>Units Fee Minimum,</xsl:text>
		<xsl:text>Units Fee Maximum,</xsl:text>
		<xsl:text>Units Fee Break 1,</xsl:text>
		<xsl:text>Units Fee Per Unit Over 1,</xsl:text>
		<xsl:text>Units Fee Break 2,</xsl:text>
		<xsl:text>Units Fee Per Unit Over 2,</xsl:text>
		<xsl:text>Units Fee Break 3,</xsl:text>
		<xsl:text>Units Fee Per Unit Over 3,</xsl:text>
		<xsl:text>Units Fee Method,</xsl:text>
		<xsl:text>Units Fee Excess Interest Indicator,</xsl:text>
		<xsl:text>Net Amount At Risk Fee Code,</xsl:text>
		<xsl:text>Net Amount At Risk Financial Recording,</xsl:text>
		<xsl:text>Net Amount At Risk Fee Per Unit,</xsl:text>
		<xsl:text>Net Amount At Risk Minimum Fee,</xsl:text>
		<xsl:text>Net Amount At Risk Maximum Fee,</xsl:text>
		<xsl:text>Net Amount At Risk Break 1,</xsl:text>
		<xsl:text>Net Amount At Risk Fee Over 1,</xsl:text>
		<xsl:text>Net Amount At Risk Excess Interest Indicator,</xsl:text>
		<xsl:text>Fund Percent Fee Use Code,</xsl:text>
		<xsl:text>Fund Percent Fee Code,</xsl:text>
		<xsl:text>Fund Percent Financial Recording,</xsl:text>
		<xsl:text>Fund Percent Fee Per Unit,</xsl:text>
		<xsl:text>Fund Percent Minimum Fee,</xsl:text>
		<xsl:text>Fund Percent Maximum Fee,</xsl:text>
		<xsl:text>Fund Percent Fee Break 1,</xsl:text>
		<xsl:text>Fund Percent Fee Over 1,</xsl:text>
		<xsl:text>Fund Percent Excess Interest Indicator,</xsl:text>
		<xsl:text>Flat Fee Code,</xsl:text>
		<xsl:text>Flat Fee Financial Recording,</xsl:text>
		<xsl:text>Flat Fee Amount,</xsl:text>
		<xsl:text>Flat Fee Break 1,</xsl:text>
		<xsl:text>Flat Fee Over 1,</xsl:text>
		<xsl:text>Flat Fee Break 2,</xsl:text>
		<xsl:text>Flat Fee Over 2,</xsl:text>
		<xsl:text>Flat Fee Break 3,</xsl:text>
		<xsl:text>Flat Fee Over 3,</xsl:text>
		<xsl:text>Flat Fee Method,</xsl:text>
		<xsl:text>Flat Fee Excess Interest Indicator</xsl:text>
		<xsl:text>&#10;</xsl:text>  		
 		<xsl:apply-templates select="__PFAF__EntrySet" />
    </xsl:template>		
    <xsl:template match="PFAF__Entry">	
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
		<xsl:value-of select="__DATE__USE__CODE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__DEATH__BENEFIT__OPT" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__PRORATE__FEE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>		
		<xsl:value-of select="_WAIVE_FEE_IND" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>		
		<xsl:value-of select="__UNITS__FEE__CODE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__UNITS__FINANCE__REC" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__UNITS__FEE__PER__UNIT" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__UNITS__MINIMUM__FEE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__UNITS__MAXIMUM__FEE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__UNITS__BREAK__1" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__UNITS__FEE__OVER__1" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__UNITS__BREAK__2" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__UNITS__FEE__OVER__2" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__UNITS__BREAK__3" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__UNITS__FEE__OVER__3" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__UNITS__METHOD" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__UNITS__EXC__INT__IND" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__NAR__FEE__CODE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__NAR__FINANCE__RECORD" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__NAR__FEE__PER__UNIT" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__NAR__MINIMUM__FEE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__NAR__MAXIMUM__FEE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__NAR__BREAK__1" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__NAR__FEE__OVER__ONE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__NAR__EXC__INT__IND" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__PRCNT__FEE__USE__CD" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__PERCENT__FEE__CODE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__PRCNT__FINANCE__REC" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__PRCNT__FEE__PER__UNIT" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__PRCNT__MINIMUM__FEE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__PRCNT__MAXIMUM__FEE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__PERCENT__BREAK__1" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__PRCNT__FEE__OVER__ONE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__PRCNT__EXC__INT__IND" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__FLAT__FEE__CODE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__FLAT__FINANCE__REC" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__FLAT__FEE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__FLAT__BREAK__1" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__FLAT__FEE__OVER__1" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__FLAT__BREAK__2" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__FLAT__FEE__OVER__2" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__FLAT__BREAK__3" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__FLAT__FEE__OVER__3" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__FLAT__METHOD" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__FLAT__FEE__INT__IND" />
		<xsl:text>"</xsl:text>
		<xsl:text>&#10;</xsl:text> 
	</xsl:template>
</xsl:stylesheet>
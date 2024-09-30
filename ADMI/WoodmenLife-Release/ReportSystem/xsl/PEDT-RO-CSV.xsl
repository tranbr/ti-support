<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:import href="CSV-UTILS.xsl" />
	<xsl:import href="PEDT-CSV-UTILS.xsl" />	
	<xsl:import href="ADMI-UTILS.xsl" />
	<xsl:output method="text" />	
	<!-- Support RO Section for PEDT CSV XSL Transformation Process -->
	<xsl:template match="/">
    	<xsl:apply-templates select="XML__ReportExtract" />
  	</xsl:template>	
  	<xsl:template match="XML__ReportExtract">
  	    <xsl:call-template name="mainHeader1"/>
	   	<xsl:for-each select="reportExtractSet/PFRO__MasterArea"> 
		   <xsl:call-template name="plro"/>
		</xsl:for-each>
	</xsl:template>
    <xsl:template name="plro">  
        <xsl:call-template name="header1"/>
        <xsl:call-template name="header2"/>
		<xsl:text>Issue State,</xsl:text>	
		<xsl:text>Date 1,</xsl:text>	
		<xsl:text>Date 2,</xsl:text>
		<xsl:text>Variable 2 Access,</xsl:text>
		<xsl:text>Variable 3 Access,</xsl:text>
		<xsl:text>Accumulation Type,</xsl:text>
		<xsl:text>Charge Code,</xsl:text>
		<xsl:text>Financial Recording Code,</xsl:text>
		<xsl:text>Processing Key,</xsl:text>
		<xsl:text>Current Percent,</xsl:text>
		<xsl:text>Change Duration Code,</xsl:text>
		<xsl:text>Change Duration Months,</xsl:text>
		<xsl:text>Interest Table ID,</xsl:text>
		<xsl:text>Premium Accumulation Rule,</xsl:text>
		<xsl:text>Premium Accumulation Percent,</xsl:text>
		<xsl:text>First Premium Reduction,</xsl:text>
		<xsl:text>Partial Surrender Adjustment,</xsl:text>
		<xsl:text>Max Accumulated Premium Rule,</xsl:text>
		<xsl:text>Max Accumulated Premium Amount/Percent,</xsl:text>
		<xsl:text>Step-Up Benefit Rule,</xsl:text>
		<xsl:text>Step-Up Benefit Period,</xsl:text>
		<xsl:text>Step-Up Benefit Partial Surrender Adjustment,</xsl:text>
		<xsl:text>Death Benefit Calc Rule,</xsl:text>
		<xsl:text>Enhanced Death Benefit Calc Rule,</xsl:text>
		<xsl:text>Enhanced Death Benefit Percent 1,</xsl:text>
		<xsl:text>Enhanced Death Benefit Percent 2,</xsl:text>
		<xsl:text>Enhanced Death Benefit Cap Rule,</xsl:text>
		<xsl:text>Enhanced Death Benefit Cap Amount/Percent,</xsl:text>
		<xsl:text>Enhanced Death Benefit Cap Duration 1,</xsl:text>
		<xsl:text>Enhanced Death Benefit Cap Duration 2,</xsl:text>
		<xsl:text>Additional Adjustment Rule,</xsl:text>
		<xsl:text>Infusion Allocation Rule,</xsl:text>
		<xsl:text>Infusion Alternate Allocation ID,</xsl:text>
		<xsl:text>Cancellation Rule,</xsl:text>
		<xsl:text>LTC Reduction Rule</xsl:text>
		<xsl:text>&#10;</xsl:text>  		
 		<xsl:apply-templates select="__PFRO__EntrySet" />
    </xsl:template>		
    <xsl:template match="PFRO__Entry">	
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
		<xsl:value-of select="__ACCUM__TYPE" />
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
		<xsl:value-of select="__PROCESSING__KEY" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__CURRENT__PRCNT__RATE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__CHANGE__DURA__USE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__CHANGE__DURA__MONTHS" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__INTEREST__TABLE__ID" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__PREMIUM__ACCUM__RULE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__PREMIUM__ACCUM__PCT" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__FIRST__PREM__REDUCE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__PARTIAL__SURR__ADJ" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__MAX__ACCUM__PRM__RULE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__MAX__ACCUM__PCT__AMT" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__STEP__UP__BEN__RULE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__STEP__UP__PERIOD" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__STEP__UP__PTSR__RULE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__DB__CALC__RULE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__ENHANCED__DB__RULE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__ENHANCED__DB__PCT1" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__ENHANCED__DB__PCT2" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__CAP__RULE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__CAP__PCT__AMT" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__CAP__DURATION__1" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__CAP__DURATION__2" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__ADDITIONAL__ADJ__RUL" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__INFUSE__ALLO__RULES" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__INF__ALT__ALLO__ID" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__CANCELLATION__RULE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__LTC__REDUCTION__RULE" />
		<xsl:text>"</xsl:text>
		<xsl:text>&#10;</xsl:text> 
	</xsl:template>
</xsl:stylesheet>
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:import href="CSV-UTILS.xsl" />
	<xsl:import href="STDT-CSV-UTILS.xsl" />
	<xsl:import href="ADMI-UTILS.xsl" />
	<xsl:output method="text" /> 	
	<!-- Support QP Section for STDT CSV XSL Transformation Process -->
	<xsl:template match="/">
    	<xsl:apply-templates select="XML__ReportExtract" />
  	</xsl:template>	
  	<xsl:template match="XML__ReportExtract">
  	    <xsl:call-template name="mainHeader1"/>
	   	<xsl:for-each select="reportExtractSet/PFQP__MasterArea"> 
		   <xsl:call-template name="plqp"/>
		</xsl:for-each>
	</xsl:template>
    <xsl:template name="plqp">  
        <xsl:call-template name="header1"/>
		<xsl:text>Pension Indicator,</xsl:text>	
		<xsl:text>State,</xsl:text>	
		<xsl:text>Date 1,</xsl:text>
		<xsl:text>Date 2,</xsl:text>
		<xsl:text>Date Use,</xsl:text>
		<xsl:text>Tax Year Calc Rule,</xsl:text>
		<xsl:text>Max Annual Contribution Amount,</xsl:text>
		<xsl:text>Max Age Years,</xsl:text>
		<xsl:text>Max Age Months,</xsl:text>
		<xsl:text>Payments to Include/Exclude,</xsl:text>
		<xsl:text>All/Include/Exclude Rule,</xsl:text>
		<xsl:text>Transfer Notify Code,</xsl:text>
		<xsl:text>Excess Contribution Error Level,</xsl:text>
		<xsl:text>Excess Contribution Report ID,</xsl:text>
		<xsl:text>Excess Contribution Refund,</xsl:text>
		<xsl:text>Hardship Withdrawal Process Code,</xsl:text>
		<xsl:text>Hardship Withdrawal Process Code,</xsl:text>
		<xsl:text>RMD Rule,</xsl:text>	
		<xsl:text>RMD Contribution Source,</xsl:text>	
		<xsl:text>RMD Notify Rule,</xsl:text>	
		<xsl:text>RMD ID,</xsl:text>	
		<xsl:text>RMD Copies,</xsl:text>	
		<xsl:text>No RMD ID,</xsl:text>	
		<xsl:text>No RMD Copies,</xsl:text>	
		<xsl:text>No VBIL ID,</xsl:text>	
		<xsl:text>No VBIL Copies,</xsl:text>	
		<xsl:text>Owner ID,</xsl:text>	
		<xsl:text>Owner Copies,</xsl:text>	
		<xsl:text>Death ID,</xsl:text>	
		<xsl:text>Death Copies,</xsl:text>	
		<xsl:text>Catch-Up Contribution Amount,</xsl:text>	
		<xsl:text>Catch-Up Age,</xsl:text>	
		<xsl:text>Premium Restrict Months,</xsl:text>	
		<xsl:text>Premium Restrict Error Level,</xsl:text>	
		<xsl:text>5498 Indicator,</xsl:text>	
		<xsl:text>Current RMD Adjustment Error Level,</xsl:text>	
		<xsl:text>Previous RMD Adjustment Error Level,</xsl:text>	
		<xsl:text>RMD Method,</xsl:text>	
		<xsl:text>Sequence Number</xsl:text>	
		<xsl:text>&#10;</xsl:text>  
		<xsl:apply-templates select="__PFQP__EntrySet" />   
    </xsl:template>		
	<xsl:template match="PFQP__Entry">
    	<xsl:text>"</xsl:text>
		<xsl:value-of select="__PENSION__INDICATOR" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__STATE__CODE" />
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
		<xsl:value-of select="__DATE__USE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__TAX__YEAR__CALC__RULE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__MAX__ANN__CONTRIB__AM" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__MAX__AGE__YY" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__MAX__AGE__MM" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
	
		<xsl:text>"</xsl:text>	
		<xsl:for-each select="__PMTS__TO__INCLUDE/string">
			<xsl:if test="text()">
				<xsl:value-of select="." />
				<xsl:text> </xsl:text>
			</xsl:if>
		</xsl:for-each>
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__PMTS__TO__INCLUDE__RL" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__TRANSFER__NOTY__CODE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__EXCESS__ERROR__LEVEL" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__EXCESS__REPORT__ID" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__EXCESS__REFUND__CODE" />
		<xsl:text>"</xsl:text>	
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__HARDSHP__WD__PROC__CD" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__HARDSHP__WD__NOTY__CD" />
		<xsl:text>"</xsl:text>	
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__RMD__RULE" />
		<xsl:text>"</xsl:text>	
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__CONTRIB__SOURCE" />
		<xsl:text>"</xsl:text>	
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__LETTER__SUP__RULE" />
		<xsl:text>"</xsl:text>	
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__RMD__LETTER__ID" />
		<xsl:text>"</xsl:text>	
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__RMD__LETTER__CPS" />
		<xsl:text>"</xsl:text>	
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__NO__RMD__LETTER__ID" />
		<xsl:text>"</xsl:text>	
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__NO__RMD__LETTER__CPS" />
		<xsl:text>"</xsl:text>	
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__NO__VBIL__LETTER__ID" />
		<xsl:text>"</xsl:text>	
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__NO__VBIL__LETTER__CPS" />
		<xsl:text>"</xsl:text>	
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__OWNER__LETTER__ID" />
		<xsl:text>"</xsl:text>	
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__OWNER__LETTER__CPS" />
		<xsl:text>"</xsl:text>	
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__DEATH__LETTER__ID" />
		<xsl:text>"</xsl:text>	
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__DEATH__LETTER__CPS" />
		<xsl:text>"</xsl:text>	
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__MAX__ANN__CATCHUP__AM" />
		<xsl:text>"</xsl:text>	
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__CATCHUP__AGE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__PREM__RESTRICT__MO" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__RESTRICT__ERR__LVL" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__RMD__5498__IND" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__CUR__RMD__ADJ__ERR__LV" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__PRV__RMD__ADJ__ERR__LV" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__RMD__METHOD" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__TABLE__ENT__NUM" />
		<xsl:text>"</xsl:text>
		<xsl:text>&#10;</xsl:text>  	
	</xsl:template> 
</xsl:stylesheet>
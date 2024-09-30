<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:output method="text" />	
	<!-- Support RDJV CSV XSL Transformation Process --> 
 	<xsl:template match="/">
    	<xsl:apply-templates select="XML__ReportExtract" />
    	<xsl:apply-templates select="XML__ReportExtract/reportExtractSet" />
    	<xsl:apply-templates select="XML__ReportExtract/totals" />
  	</xsl:template>
	<xsl:template match="XML__ReportExtract">  
	    <xsl:text>"Company Code:" </xsl:text><xsl:value-of select="./companyCode" /><xsl:text>,</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>"Company Name:" </xsl:text><xsl:text>"</xsl:text><xsl:value-of select="./companyName" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>"Report Description: " </xsl:text><xsl:text>"</xsl:text><xsl:value-of select="./reportDescription" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>"Report ID:" </xsl:text><xsl:value-of select="./reportID" /><xsl:text>,</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:variable name="fromMonth" select="substring(./fromDate, 6, 2)"/>
		<xsl:variable name="fromDay" select="substring(./fromDate, 9)"/>
		<xsl:variable name="fromYear" select="substring(./fromDate, 1, 4)"/>
		<xsl:variable name="fromDate" select="concat($fromMonth, '-', $fromDay, '-', $fromYear)" />
		<xsl:text>"From Date:" </xsl:text><xsl:value-of select="$fromDate" /><xsl:text>,</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:variable name="thruMonth" select="substring(./thruDate, 6, 2)"/>
		<xsl:variable name="thruDay" select="substring(./thruDate, 9)"/>
		<xsl:variable name="thruYear" select="substring(./thruDate, 1, 4)"/>
		<xsl:variable name="thruDate" select="concat($thruMonth, '-', $thruDay, '-', $thruYear)" />
		<xsl:text>"Thru Date:" </xsl:text><xsl:value-of select="$thruDate" /><xsl:text>,</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:variable name="reportMonth" select="substring(./reportDate, 6, 2)"/>
		<xsl:variable name="reportDay" select="substring(./reportDate, 9)"/>
		<xsl:variable name="reportYear" select="substring(./reportDate, 1, 4)"/>
		<xsl:variable name="reportDate" select="concat($reportMonth, '-', $reportDay, '-', $reportYear)" />
		<xsl:text>"Report Date:" </xsl:text><xsl:value-of select="$reportDate" /><xsl:text>,</xsl:text>
		<xsl:text>&#10;</xsl:text>
	    <xsl:text>"Report Time:" </xsl:text><xsl:value-of select="./reportTime" /><xsl:text>,</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>"Printed By:" </xsl:text><xsl:value-of select="./printedBy" /><xsl:text>,</xsl:text>	
		<xsl:text>&#10;</xsl:text>		
		<xsl:text>&#10;</xsl:text>	
	</xsl:template>
	<xsl:template match="reportExtractSet">
		<xsl:text>"Company Code"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Policy/Reference Number"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Transaction Code"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Transaction Amount"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Transaction Units"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Class Code"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Backout/Reapply IND"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Effective Date"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Account Number"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Separate Account ID"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Department/Desk"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Batch Number"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Journal Date"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Plan/SubPlan Code"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Coverage/SubCoverage Number"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Due Or Tax Date"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Reporting State/Area"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Description"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:apply-templates select="CompDailyAcctJrnlVariable__ReportMaster" />
	</xsl:template>
	<xsl:template match="CompDailyAcctJrnlVariable__ReportMaster">
	    <xsl:if test="companyCodeChange !=''">
	    <xsl:text>&#10;</xsl:text>
	    <xsl:text>"COMPANY </xsl:text><xsl:value-of select="companyCodeChange" />
        <xsl:text> Totals:" </xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Records =" </xsl:text><xsl:value-of select="companyRecords" /><xsl:text>,</xsl:text>
		<xsl:text>"Debits =" </xsl:text><xsl:value-of select="companydebits" /><xsl:text>,</xsl:text>
		<xsl:text>"Credits =" </xsl:text><xsl:value-of select="companycredits" /><xsl:text>,</xsl:text>
		<xsl:text>"Net To Cash =" </xsl:text><xsl:value-of select="companyNetToCash" />
		<xsl:text>&#10;</xsl:text>
		<xsl:text>&#10;</xsl:text>
	    </xsl:if>
		<xsl:text>"</xsl:text><xsl:value-of select="companyCode" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="policy" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="transactionCode" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="transactionAmount" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="transactionUnits" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="classCode" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="backoutReapplyIND" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="effectiveDate" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="account" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="sprtOrSpclID" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="DPDESK" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="batchNumber" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="journalDate" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:value-of select="planCode" /><xsl:value-of select="subPlanCode" /><xsl:text>,</xsl:text>
		<xsl:value-of select="coverage" /><xsl:value-of select="subCoverage" /><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="dueOrTaxDate" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:value-of select="reportingState" /><xsl:value-of select="reportingArea" /><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="description" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
        <xsl:text>&#10;</xsl:text>
	</xsl:template>
  <xsl:template match="totals">
		<xsl:text>&#10;</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>"COMPANY </xsl:text><xsl:value-of select="companyCode" />
        <xsl:text> Totals:" </xsl:text>
		<xsl:text>"Records =" </xsl:text><xsl:value-of select="companyRecords" /><xsl:text>,</xsl:text>
		<xsl:text>"Debits =" </xsl:text><xsl:value-of select="companydebits" /><xsl:text>,</xsl:text>
		<xsl:text>"Credits =" </xsl:text><xsl:value-of select="companycredits" /><xsl:text>,</xsl:text>
		<xsl:text>"Net TO Cash =" </xsl:text><xsl:value-of select="companyNetToCash" /><xsl:text>,</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>&#10;</xsl:text>
        <xsl:text>"RDJV Reoprt Totals:" </xsl:text>
		<xsl:text>"Records =" </xsl:text><xsl:value-of select="reportRecords" /><xsl:text>,</xsl:text>
		<xsl:text>"Debits =" </xsl:text><xsl:value-of select="reportdebits" /><xsl:text>,</xsl:text>
		<xsl:text>"Credits =" </xsl:text><xsl:value-of select="reportcredits" /><xsl:text>,</xsl:text>
		<xsl:text>"Net TO Cash =" </xsl:text><xsl:value-of select="reportNetToCash" /><xsl:text>,</xsl:text>
	</xsl:template>
</xsl:stylesheet>
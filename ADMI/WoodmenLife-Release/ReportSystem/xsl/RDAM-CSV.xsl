<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:output method="text" />	
	<!-- Support RDAM CSV XSL Transformation Process --> 
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
		<xsl:text>"Transaction"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Account"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Transaction Amount"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Entry Date"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Entry Time"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Department/Desk"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Batch Number"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Create Date"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Deposit Number"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Cash AMount"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Number of Shares"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Coverage/SubCoverage Number"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"SubPlan Code"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Separate or Special Account ID"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>" Error Force Code"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>" Class Code"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Commission Group"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Override"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Agent Number"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Billing Mode"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Due or Tax Date"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Cost Center"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Budget Item"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Reporting State"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Reporting Area"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Description"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Item Number"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Save First Transaction Character"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Source Code"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Sequence Count"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Sequence Date"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Sequence Time"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Deletion Date"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Future Date"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Future Time"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:apply-templates select="DailyAccountingJournal__ReportMaster" />
	</xsl:template>
	<xsl:template match="DailyAccountingJournal__ReportMaster">
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
		<xsl:text>"</xsl:text><xsl:value-of select="account" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="transactionAmount" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="entryDate" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="entryTime" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="DPDESK" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="batchNumber" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="createDate" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="depositNumber" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="cashAmount" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="numberofShares" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:value-of select="coverage" /><xsl:value-of select="subCoverage" /><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="subPlanCode" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="sprtOrSpclID" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="errorForceCode" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="classCode" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="commisionGroup" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="override" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="agentNumber" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="billingMode" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="dueOrTaxDate" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="costCenter"/><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="budgetItem"/><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="reportingState" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="reportingArea" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="description" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="itemNumber" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="save1stTran" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="sourceCode" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="sequenceCount" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="sequenceDate" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="sequenceTime" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="deletionDate" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="futureDate" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="futureTime" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
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
        <xsl:text>"RDAM Reoprt Totals:" </xsl:text>
		<xsl:text>"Records =" </xsl:text><xsl:value-of select="reportRecords" /><xsl:text>,</xsl:text>
		<xsl:text>"Debits =" </xsl:text><xsl:value-of select="reportdebits" /><xsl:text>,</xsl:text>
		<xsl:text>"Credits =" </xsl:text><xsl:value-of select="reportcredits" /><xsl:text>,</xsl:text>
		<xsl:text>"Net TO Cash =" </xsl:text><xsl:value-of select="reportNetToCash" /><xsl:text>,</xsl:text>
	</xsl:template>
</xsl:stylesheet>
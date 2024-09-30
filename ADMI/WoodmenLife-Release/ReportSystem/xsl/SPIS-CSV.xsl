<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:output method="text" />	
	<!-- Support SPIS CSV XSL Transformation Process --> 
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
		<xsl:text>"Underwriting ID"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Company Code"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Policy Number"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Proposed Insured"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Plan Code"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Billing Form"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Billing Mode"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Mode Premium"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Agent Number"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Agent Commision %"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Agent Name"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Entry Status"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Entry Date"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Last Status"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Change Date"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Pending Days"</xsl:text><xsl:text>&#10;</xsl:text>
		<xsl:apply-templates select="CumSubmitPendIssue__ReportMaster" />
	</xsl:template>
	<xsl:template match="CumSubmitPendIssue__ReportMaster">
	
	    <xsl:if test= "companyVolume != 0 ">
	    <xsl:text>&#10;</xsl:text>
	    <xsl:text>&#10;</xsl:text>
	    <xsl:text>COMPANY HAS CHANGED:</xsl:text>
	    <xsl:text>COMPANY RECODRDS = </xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="companyRecords" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>COMPANY VOLUME = </xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="companyVolume" /><xsl:text>"</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>&#10;</xsl:text>
        </xsl:if>

		<xsl:text>"</xsl:text><xsl:value-of select="underWritingID" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="companyCode" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="policy" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="proposedInsured" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="planCode" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="billingForm" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="billingMode" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="modePremium" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="agentNumber" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="agentCommision" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="agentName" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="entryStatus" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="entryDate" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="lastStatus" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="changeDate" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="pendingDays" /><xsl:text>"</xsl:text>

		<xsl:text>&#10;</xsl:text>
	</xsl:template>
  <xsl:template match="totals">
       <xsl:if test="companyCode != 'QA1'">
        <xsl:text> COMPANY HAS CHANGED:</xsl:text>
        <xsl:text> COMPANY RECORD COUNT </xsl:text><xsl:text>"</xsl:text>
        <xsl:value-of select="companyRecords" /><xsl:text>,</xsl:text>
	    <xsl:text> "COMPANY VOLUME =" </xsl:text>
	    <xsl:value-of select="companyVolume" /><xsl:text>,</xsl:text>
	    </xsl:if>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>&#10;</xsl:text>
        <xsl:text>"TOTAL PENDING THIS REPORT" </xsl:text>
		<xsl:text>" RECORD COUNT = " </xsl:text>
		<xsl:value-of select="reportRecords" /><xsl:text>,</xsl:text>
		<xsl:text>" RECORD VOLUME = " </xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="reportVolume" /><xsl:text>"</xsl:text>
	</xsl:template>
</xsl:stylesheet>
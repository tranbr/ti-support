<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:output method="text" />	
	<!-- Support SPIF CSV XSL Transformation Process -->
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
		<xsl:text>"Volume"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Status Code"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"ReInsurance Code"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Requirements Description"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Originating Month-Day"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Originating Department Desk"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Resolving Month-Day"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Resolving Department Desk"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Next Month-Day"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Follow Up Code"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Days Pending"</xsl:text><xsl:text>,</xsl:text>
        <xsl:text>"Writing Agent"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:apply-templates select="REPT__SPIF__Master" />
	</xsl:template>
		<xsl:template match="REPT__SPIF__Master">
		<xsl:text>"</xsl:text><xsl:value-of select="underwritingId" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="companyCode" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="policyNumber" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="proposedInsured" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="planCode" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="volume" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="statusCode" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="reinsuranceCode" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="requirementsDescription" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:variable name="originatingMonth" select="substring(originatingMonthDay, 6, 2)"/>
		<xsl:variable name="originatingDay" select="substring(originatingMonthDay, 9)"/>
		<xsl:variable name="originatingMonthDay" select="concat($originatingMonth, '-', $originatingDay)" />
		<xsl:text>"</xsl:text><xsl:value-of select="$originatingMonthDay" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="originatingDepartmentDesk" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:variable name="resolvingMonth" select="substring(resolvingMonthDay, 6, 2)"/>
		<xsl:variable name="resolvingDay" select="substring(resolvingMonthDay, 9)"/>
		<xsl:variable name="resolvingMonthDay" select="concat($resolvingMonth, '-', $resolvingDay)" />
		<xsl:text>"</xsl:text><xsl:value-of select="$resolvingMonthDay" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="resolvingDepartmentDesk" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:variable name="nextMonth" select="substring(nextMonthDay, 6, 2)"/>
		<xsl:variable name="nextDay" select="substring(nextMonthDay, 9)"/>
		<xsl:variable name="nextMonthDay" select="concat($nextMonth, '-', $nextDay)" />
		<xsl:text>"</xsl:text><xsl:value-of select="$nextMonthDay" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="followUpCode" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="daysPending" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="writingAgent" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>&#10;</xsl:text>
	</xsl:template>	
	<xsl:template match="totals">
		<xsl:text>&#10;</xsl:text>
		<xsl:text>Summary:,</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>Days,</xsl:text>
		<xsl:for-each select="summaryDays/string">
			<xsl:if test="text()">
				<xsl:value-of select="."/><xsl:text>,</xsl:text>
			</xsl:if>
		</xsl:for-each>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>Cases,</xsl:text>
		<xsl:for-each select="summaryCases/int">
			<xsl:if test="text() &gt; 0">
				<xsl:value-of select="."/><xsl:text>,</xsl:text>
			</xsl:if>
		</xsl:for-each>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>Volume,</xsl:text>
		<xsl:for-each select="summaryVolume/int">
			<xsl:if test="text() &gt; 0">
				<xsl:value-of select="."/><xsl:text>,</xsl:text>
			</xsl:if>	
		</xsl:for-each>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>Totals:,</xsl:text><xsl:text>&#10;</xsl:text>
		<xsl:text>Cases,</xsl:text><xsl:value-of select="totalCases" /><xsl:text>&#10;</xsl:text>
		<xsl:text>Volume,</xsl:text><xsl:value-of select="totalVolume" />
		<xsl:text>&#10;</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>Average Days Pending:,</xsl:text><xsl:value-of select="averageDaysPending" />
		<xsl:text>&#10;</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>Report Totals:,</xsl:text><xsl:text>&#10;</xsl:text>
		<xsl:text>Cases,</xsl:text><xsl:value-of select="reportTotalCases" /><xsl:text>&#10;</xsl:text>
		<xsl:text>Volume,</xsl:text><xsl:value-of select="reportTotalVolume" />
	</xsl:template>
</xsl:stylesheet>
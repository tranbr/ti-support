<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:output method="text" />	
	<!-- Support GNLT CSV XSL Transformation Process --> 
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
		<xsl:text>"Report Description: "</xsl:text><xsl:value-of select="./reportDescription" /><xsl:text>,</xsl:text>
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
		<xsl:text>"Broker ID"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Company Code"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Policy Number"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Variable Owner Info"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Effective Date"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Effective Time"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Tran Code"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Gross Amount"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Expense Charage"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Account ID"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"CLS CD"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Amount Allocated"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Unit Value"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Units"</xsl:text><xsl:text>&#10;</xsl:text>
		<xsl:apply-templates select="GainOrLossByBroker__ReportMaster" />
	</xsl:template>
	<xsl:template match="GainOrLossByBroker__ReportMaster">
	   <xsl:choose>
	   <xsl:when test="brokerNum = '' ">
		<xsl:text>"</xsl:text><xsl:value-of select="company" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="brokerID" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="company2" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="policy" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="policyNumber" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="owner" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="effectiveDate" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="effectiveTime" /><xsl:text>"</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="tranCode" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="grossAmount" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="expenses" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="accountID" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="classCode" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="dollarAmount" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="unitValue" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="units" /><xsl:text>"</xsl:text>
	   </xsl:when>
	    <xsl:when test="companyXMLSW = 'true' ">
	    <xsl:text>COMPANY HAS CHANGED:</xsl:text>
	    <xsl:text>AMOUNT ALLOCATED = </xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="companysTotal" /><xsl:text>"</xsl:text>
		<xsl:text>&#10;</xsl:text>
        </xsl:when>
	   <xsl:otherwise> 
	   	   <xsl:text> SUB-TOTALS: BROKER# </xsl:text>
	   <xsl:text>"</xsl:text><xsl:value-of select="brokerNum" /><xsl:text>"</xsl:text>
	   <xsl:text>AMOUNT ALLOCATED = </xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="brokerTotal" /><xsl:text>"</xsl:text>
		<xsl:text>&#10;</xsl:text>
		</xsl:otherwise>
		</xsl:choose>
		<xsl:text>&#10;</xsl:text>
	</xsl:template>
  <xsl:template match="totals">
		<xsl:text>&#10;</xsl:text>
        <xsl:text>" REPORT-ID = GNLT " </xsl:text>
		<xsl:text>" THE TOTAL AMOUNT ALLOCATED = " </xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="reportTotal" /><xsl:text>"</xsl:text>
	</xsl:template>
</xsl:stylesheet>
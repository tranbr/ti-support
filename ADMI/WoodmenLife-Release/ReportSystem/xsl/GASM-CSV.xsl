<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:output method="text" />	
	<!-- Support GASM CSV XSL Transformation Process -->
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
		<xsl:text>"Agency Name"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Agency Number"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Agent Name"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Agent Number"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Policy Number"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Mode"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Original Advance"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Negative Balance"</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:apply-templates select="AgentAdvanceSummary__ReportMaster" />
	</xsl:template>
	<xsl:template match="AgentAdvanceSummary__ReportMaster">
	
		<xsl:if test="agentAdvTotal != 0 "><xsl:text>,</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>,</xsl:text><xsl:text>,</xsl:text><xsl:text>,</xsl:text><xsl:text>,</xsl:text><xsl:value-of select="agentAdvTotal" />
		<xsl:text>,</xsl:text><xsl:value-of select="agentBalTotal" />
		<xsl:text>&#10;</xsl:text>
		<xsl:text>&#10;</xsl:text>
		</xsl:if>
		<xsl:if test="advanceTotal != 0">
		<xsl:text>,</xsl:text><xsl:text>,</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>,</xsl:text><xsl:text>,</xsl:text><xsl:text>,</xsl:text><xsl:value-of select="advanceTotal" />
		<xsl:text>,</xsl:text><xsl:value-of select="balanceTotal" />
		<xsl:text>&#10;</xsl:text>
		<xsl:text>&#10;</xsl:text>
		</xsl:if>
		<xsl:text>"</xsl:text><xsl:value-of select="agencyName" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="agencyNumber" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="agentName" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="agentNumber" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="policyName" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="billingmode" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="originalAdvnace" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="negativeBalance" /><xsl:text>"</xsl:text>
		<xsl:text>&#10;</xsl:text>
	</xsl:template>
	<xsl:template match="totals">
  	    <xsl:text>,</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>,</xsl:text><xsl:text>,</xsl:text><xsl:text>,</xsl:text><xsl:text>,</xsl:text><xsl:value-of select="agentAdvTotal" />
		<xsl:text>,</xsl:text><xsl:value-of select="agentBalTotal" />
		<xsl:text>&#10;</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>,</xsl:text><xsl:text>,</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>,</xsl:text><xsl:text>,</xsl:text><xsl:text>,</xsl:text><xsl:value-of select="advanceTotal" />
		<xsl:text>,</xsl:text><xsl:value-of select="balanceTotal" />
	</xsl:template>
</xsl:stylesheet>
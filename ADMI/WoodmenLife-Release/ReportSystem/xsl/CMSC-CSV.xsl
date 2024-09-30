<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:output method="text" />	
	<!-- Support CMSC CSV XSL Transformation Process -->
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
		<xsl:text>"Company"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"System Source"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Agent"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"SIT"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Policy"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Tran Code"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Tran Date"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Premium"</xsl:text><xsl:text>&#10;</xsl:text>
		<xsl:apply-templates select="CommSuccAudit__ReportMaster" />
	</xsl:template>
	<xsl:template match="CommSuccAudit__ReportMaster">
		<xsl:if test=" agentChangeSW = 'true' "><xsl:text>"Total For Agent" </xsl:text>
		<xsl:value-of select="totalAgentNumber" /><xsl:text>,</xsl:text><xsl:text>,</xsl:text><xsl:text>,</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>,</xsl:text><xsl:text>,</xsl:text><xsl:value-of select="agentTotal" />
		<xsl:text>&#10;</xsl:text>
		</xsl:if>
		<xsl:text>"</xsl:text><xsl:value-of select="plcyCompanyCode" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="systemSource" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="agentNumber" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="agentSituation" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="policyNumber" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="transactionCode" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="transactionDate" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="premiumAmount" /><xsl:text>"</xsl:text>
		<xsl:text>&#10;</xsl:text>
	</xsl:template>
	<xsl:template match="totals">
        <xsl:text>"Total For Agent" </xsl:text>
		<xsl:value-of select="agentNumber" /><xsl:text>,</xsl:text><xsl:text>,</xsl:text><xsl:text>,</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>,</xsl:text><xsl:text>,</xsl:text><xsl:value-of select="agentTotal" />
		<xsl:text>&#10;</xsl:text>
	    <xsl:text>&#10;</xsl:text>
	    <xsl:for-each select="totalEntrySet/XML__CMSC__TotalEntry">
	    <xsl:text>"Total For System-Source:"</xsl:text>
		<xsl:text>,</xsl:text><xsl:value-of select="grandSystemSource" /><xsl:text>,</xsl:text><xsl:text>,</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>,</xsl:text><xsl:text>,</xsl:text><xsl:text>,</xsl:text><xsl:value-of select="total" />
		<xsl:text>&#10;</xsl:text>
		</xsl:for-each>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>"Grand Total:" </xsl:text><xsl:text>,</xsl:text><xsl:text>,</xsl:text><xsl:text>,</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>,</xsl:text><xsl:text>,</xsl:text><xsl:value-of select="grandTotal" />
		<xsl:text>&#10;</xsl:text>
		<xsl:text>"CMSC Report Total Records:" </xsl:text>
		<xsl:value-of select="reportCount" />
		<xsl:text>&#10;</xsl:text>
	</xsl:template>
</xsl:stylesheet>
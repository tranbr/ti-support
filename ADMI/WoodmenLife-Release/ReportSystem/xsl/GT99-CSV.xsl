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
		
	<input type="text" value="Ampersand: &amp;"/>
	
	<xsl:text>"UNIQUE-IDENTIFIER"</xsl:text><xsl:text>,</xsl:text>
	<xsl:text>"CNTL"</xsl:text><xsl:text>,</xsl:text>
	<xsl:text>"PAYEE-NAME-LINE-1"</xsl:text><xsl:text>,</xsl:text>
	<xsl:text>"PAYEE-ADDRESS"</xsl:text><xsl:text>,</xsl:text>
	<xsl:text>""</xsl:text><xsl:text>,</xsl:text>
	<xsl:text>""</xsl:text><xsl:text>,</xsl:text>
	<xsl:text>"NONEMP-COMP(AMT 7)"</xsl:text><xsl:text>,</xsl:text>
	<xsl:text>&#10;</xsl:text>
	<xsl:text>"TAXID &amp; TYPE"</xsl:text><xsl:text>,</xsl:text>
	<xsl:text>""</xsl:text><xsl:text>,</xsl:text>
	<xsl:text>"PAYEE-NAME-LINE-2"</xsl:text><xsl:text>,</xsl:text>
	<xsl:text>"PAYEE-CITY"</xsl:text><xsl:text>,</xsl:text>
	<xsl:text>"ST"</xsl:text><xsl:text>,</xsl:text>
	<xsl:text>"ZIP"</xsl:text><xsl:text>,</xsl:text>
	<xsl:text>"FEDRL-WTHLD(AMT 4)"</xsl:text><xsl:text>,</xsl:text>
	<xsl:text>&#10;</xsl:text>
	<xsl:text>&#10;</xsl:text>
	
	<xsl:apply-templates select="com.lidp.model.admin.persistence.Agent__1099__Report" />
	</xsl:template>
	<xsl:template match="com.lidp.model.admin.persistence.Agent__1099__Report">

	<xsl:text>"</xsl:text><xsl:value-of select="uniqueIdentifier" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
	<xsl:text>"</xsl:text><xsl:value-of select="nameControl" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
	<xsl:text>"</xsl:text><xsl:value-of select="payeeName1" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
	<xsl:text>"</xsl:text><xsl:value-of select="payeeAddress" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
	<xsl:text>""</xsl:text><xsl:text>,</xsl:text>
	<xsl:text>""</xsl:text><xsl:text>,</xsl:text>
	<xsl:text>"</xsl:text><xsl:value-of select="payAmount7" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
	<xsl:text>&#10;</xsl:text>
	
	<xsl:text>"</xsl:text><xsl:value-of select="concat(taxID,'  ', taxIDType)" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
	<xsl:text>""</xsl:text><xsl:text>,</xsl:text>
	<xsl:text>"</xsl:text><xsl:value-of select="payeeName2" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
	<xsl:text>"</xsl:text><xsl:value-of select="payeeCity" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
	<xsl:text>"</xsl:text><xsl:value-of select="payeeState" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
	<xsl:text>"</xsl:text><xsl:value-of select="payeeZipcode" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
	<xsl:text>"</xsl:text><xsl:value-of select="payAmount4" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
	<xsl:text>&#10;</xsl:text>
	<xsl:text>&#10;</xsl:text>

	</xsl:template>
	<xsl:template match="totals">
		<xsl:text>&#10;</xsl:text>
		<xsl:text>"TOTAL REPORTS"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="totalReportRecords" /><xsl:text>"</xsl:text>
	</xsl:template>
</xsl:stylesheet>
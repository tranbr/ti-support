<?xml version="1.0" encoding="UTF-8"?>
<?mso-application progid="Excel.Sheet"?>

<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:output method="text" />	
	<!-- Support ESTB CSV XSL Transformation Process -->
 	<xsl:template match="/">
    	<xsl:apply-templates select="XML__ReportExtract"/>
    	<xsl:apply-templates select="XML__ReportExtract/totals"/>
  	</xsl:template>		
	<xsl:template match="XML__ReportExtract">  
	    <xsl:text>"Company Code:" </xsl:text><xsl:value-of select="./companyCode" /><xsl:text>,</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>"Company Name:" </xsl:text><xsl:text>"</xsl:text><xsl:value-of select="./companyName" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>"Report Description: " </xsl:text><xsl:text>"</xsl:text><xsl:value-of select="./reportDescription" /><xsl:text>,</xsl:text><xsl:text>"</xsl:text>
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
			<xsl:template match="totals">
			<xsl:text>"Company Code"</xsl:text><xsl:text>,</xsl:text>
			<xsl:text>"Policy Number"</xsl:text><xsl:text>,</xsl:text>
			<xsl:text>"Plan"</xsl:text><xsl:text>,</xsl:text>
			<xsl:text>"Issue Date"</xsl:text><xsl:text>,</xsl:text>
			<xsl:text>"Request Date"</xsl:text><xsl:text>,</xsl:text>
			<xsl:text>"Request Time"</xsl:text><xsl:text>,</xsl:text>
			<xsl:text>"Effective Date"</xsl:text><xsl:text>,</xsl:text>
			<xsl:text>"Effective Time"</xsl:text><xsl:text>,</xsl:text>
			<xsl:text>"Last Saved Date"</xsl:text><xsl:text>,</xsl:text>
			<xsl:text>"Last Saved Time"</xsl:text><xsl:text>,</xsl:text>
			<xsl:text>"Status Timing Code"</xsl:text><xsl:text>,</xsl:text>
			<xsl:text>"Months Difference"</xsl:text><xsl:text>&#10;</xsl:text>
	    	
	    	<xsl:for-each select="totalEntrySet/XML__ESTB__TotalEntry">
				<xsl:variable name="issueMonth" select="substring(./issueDate, 6, 2)"/>
				<xsl:variable name="issueDay" select="substring(./issueDate, 9)"/>
				<xsl:variable name="issueYear" select="substring(./issueDate, 1, 4)"/>
				<xsl:variable name="issueDate" select="concat($issueMonth, '-', $issueDay, '-', $issueYear)" />
				<xsl:variable name="lastMonth" select="substring(./lastSavedDate, 6, 2)"/>
				<xsl:variable name="lastDay" select="substring(./lastSavedDate, 9)"/>
				<xsl:variable name="lastYear" select="substring(./lastSavedDate, 1, 4)"/>
				<xsl:variable name="lastSavedDate" select="concat($lastMonth, '-', $lastDay, '-', $lastYear)" />
				<xsl:variable name="requestMonth" select="substring(./requestDate, 6, 2)"/>
				<xsl:variable name="requestDay" select="substring(./requestDate, 9)"/>
				<xsl:variable name="requestYear" select="substring(./requestDate, 1, 4)"/>
				<xsl:variable name="requestDate" select="concat($requestMonth, '-', $requestDay, '-', $requestYear)" />
				<xsl:variable name="fromMonth" select="substring(./effectiveDate, 6, 2)"/>
				<xsl:variable name="fromDay" select="substring(./effectiveDate, 9)"/>
				<xsl:variable name="fromYear" select="substring(./effectiveDate, 1, 4)"/>
				<xsl:variable name="effectiveDate" select="concat($fromMonth, '-', $fromDay, '-', $fromYear)" />
				<xsl:value-of select="companyCode" /><xsl:text>,</xsl:text>
		    	<xsl:value-of select="policy" /><xsl:text>,</xsl:text>
		    	<xsl:value-of select="plan" /><xsl:text>,</xsl:text>
		    	<xsl:value-of select="$issueDate" /><xsl:text>,</xsl:text>
		    	<xsl:value-of select="$requestDate" /><xsl:text>,</xsl:text>
		    	<xsl:value-of select="requestTime" /><xsl:text>,</xsl:text>
		    	<xsl:value-of select="$effectiveDate" /><xsl:text>,</xsl:text>
		    	<xsl:value-of select="effectiveTime" /><xsl:text>,</xsl:text>
		    	<xsl:value-of select="$lastSavedDate" /><xsl:text>,</xsl:text>
		    	<xsl:value-of select="lastSavedTime" /><xsl:text>,</xsl:text>
		    	<xsl:value-of select="statusTimingCode" /><xsl:text>,</xsl:text>
		    	<xsl:value-of select="durationSinceLastSave" /><xsl:text>&#10;</xsl:text>    
	    	</xsl:for-each>
		</xsl:template>
</xsl:stylesheet>
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
		
		<xsl:apply-templates select="ACWK__DataEntry" />
	</xsl:template>
	<xsl:template match="ACWK__DataEntry">
		
        <xsl:if test= "position() = 1">
        <xsl:text>"AGENCY"</xsl:text><xsl:text>,</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="AGENCY__NUMBER" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>&#10;</xsl:text>	
		<xsl:text>"</xsl:text><xsl:value-of select="AGENCY__NAME" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="AGENCY__STREET" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="AGENCY__CITY" />
		<xsl:text> </xsl:text><xsl:value-of select=" AGENCY__STATE " />
		<xsl:text> </xsl:text><xsl:value-of select=" AGENCY__ZIPCODE" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>		
		<xsl:text>&#10;</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>"AGENT"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"AGENT"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"SUBMITTED-"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"PENDING"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"ISSUE-"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"ISSUED-"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"PENDING"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"DELIVERY-"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>"NUMBER"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"NAME"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"CASES"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"VOLUME"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"DAYS"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"CASES"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"VOLUME"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"DAYS"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>&#10;</xsl:text>
        </xsl:if>

	<xsl:if	test="not(following-sibling::ACWK__DataEntry/AGENT__NUMBER = AGENT__NUMBER)">
		<xsl:text>&#10;</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="AGENT__NUMBER" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="AGENT__NAME" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="SUBMITTED__CASES" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="PNDG__ISSUE__VOLUME" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="PNDG__ISSUE__DAYS" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="PNDG__ISSUE__CASES" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="PNDG__DELIVERY__VOLUME" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="PNDG__DELIVERY__DAYS" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>&#10;</xsl:text>
	</xsl:if>
	
	<xsl:if	test="not(following-sibling::ACWK__DataEntry/AGENCY__NUMBER = AGENCY__NUMBER) and position() != last()">
		<xsl:text>&#10;</xsl:text>
		<xsl:text>"TOTALS"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>""</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="TOTAL__CASES__IPD" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="TOTAL__VOLUME__SPI" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="TOTAL__DAYS__SPI" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="TOTAL__CASES__SPI" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="TOTAL__VOLUME__IPD" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="TOTAL__DAYS__IPD" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>"AGENCY"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of	select="following-sibling::ACWK__DataEntry/AGENCY__NUMBER" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of	select="following-sibling::ACWK__DataEntry/AGENCY__NAME" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>&#10;</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="following-sibling::ACWK__DataEntry/AGENCY__STREET" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of	select="following-sibling::ACWK__DataEntry/AGENCY__CITY" />
		<xsl:text> </xsl:text><xsl:value-of select="following-sibling::ACWK__DataEntry/AGENCY__STATE" />
		<xsl:text> </xsl:text><xsl:value-of select="following-sibling::ACWK__DataEntry/AGENCY__ZIPCODE" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>"AGENT"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"AGENT"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"SUBMITTED-"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"PENDING"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"ISSUE-"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"ISSUED-"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"PENDING"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"DELIVERY-"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>"NUMBER"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"NAME"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"CASES"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"VOLUME"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"DAYS"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"CASES"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"VOLUME"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"DAYS"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>&#10;</xsl:text>
	</xsl:if>
	

	
	</xsl:template>
	<xsl:template match="totals">
		<xsl:if	test="not(preceding-sibling::ACWK__DataEntry/AGENCY__NUMBER = AGENCY__NUMBER) ">
			<xsl:text>&#10;</xsl:text>
			<xsl:text>"TOTALS"</xsl:text><xsl:text>,</xsl:text>
			<xsl:text>""</xsl:text><xsl:text>,</xsl:text>
			<xsl:text>"</xsl:text><xsl:value-of select="TOTAL__CASES__IPD" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
			<xsl:text>"</xsl:text><xsl:value-of select="TOTAL__VOLUME__SPI" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
			<xsl:text>"</xsl:text><xsl:value-of select="TOTAL__DAYS__SPI" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
			<xsl:text>"</xsl:text><xsl:value-of select="TOTAL__CASES__SPI" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
			<xsl:text>"</xsl:text><xsl:value-of select="TOTAL__VOLUME__IPD" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
			<xsl:text>"</xsl:text><xsl:value-of select="TOTAL__DAYS__IPD" /><xsl:text>"</xsl:text>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
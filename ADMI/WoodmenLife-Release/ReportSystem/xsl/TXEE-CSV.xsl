<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<!-- Support TXRP CSV XSL Transformation Process -->
	<xsl:output method="text" />
	<xsl:variable name="comma" select="','"/>
	<xsl:variable name="PolicyInformation">
		<xsl:text>Policy Number</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Submission Type</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Tax ID Type</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Type Of Return</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Company Code</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Name Control</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Tax Year</xsl:text>
		<xsl:text>&#10;</xsl:text>
	</xsl:variable>

	<xsl:variable name="ErrorInformation">
		<xsl:text>Message Code</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Message Connect</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Message Connector Type</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Message Description</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Message Program ID</xsl:text>
		<xsl:text>&#10;</xsl:text>
	</xsl:variable>
 	<xsl:template match="/">
    	<xsl:apply-templates select="XML__ReportExtract" />
		<xsl:apply-templates select="XML__ReportExtract/reportExtractSet"/>
  	</xsl:template>
	<xsl:template match="XML__ReportExtract">
		<xsl:text>Company Code: </xsl:text>
		<xsl:value-of select="./companyCode"/>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>Company Name: </xsl:text>
		<xsl:value-of select="./companyName"/>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>Report Description: </xsl:text>
		<xsl:value-of select="./reportDescription"/>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>Report ID: </xsl:text>
		<xsl:value-of select="./reportID"/>
		<xsl:text>&#10;</xsl:text>
		<xsl:variable select="substring(./fromDate, 6, 2)" name="fromMonth"/>
		<xsl:variable select="substring(./fromDate, 9)" name="fromDay"/>
		<xsl:variable select="substring(./fromDate, 1, 4)" name="fromYear"/>
		<xsl:variable select="concat($fromMonth, '-', $fromDay, '-', $fromYear)" name="fromDate"/>
		<xsl:text>From Date: </xsl:text>
		<xsl:value-of select="$fromDate"/>
		<xsl:text>&#10;</xsl:text>
		<xsl:variable select="substring(./thruDate, 6, 2)" name="thruMonth"/>
		<xsl:variable select="substring(./thruDate, 9)" name="thruDay"/>
		<xsl:variable select="substring(./thruDate, 1, 4)" name="thruYear"/>
		<xsl:variable select="concat($thruMonth, '-', $thruDay, '-', $thruYear)" name="thruDate"/>
		<xsl:text>Thru Date: </xsl:text>
		<xsl:value-of select="$thruDate"/>
		<xsl:text>&#10;</xsl:text>
		<xsl:variable select="substring(./reportDate, 6, 2)" name="reportMonth"/>
		<xsl:variable select="substring(./reportDate, 9)" name="reportDay"/>
		<xsl:variable select="substring(./reportDate, 1, 4)" name="reportYear"/>
		<xsl:variable select="concat($reportMonth, '-', $reportDay, '-', $reportYear)" name="reportDate"/>
		<xsl:text>Report Date: </xsl:text>
		<xsl:value-of select="$reportDate"/>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>Report Time: </xsl:text>
		<xsl:value-of select="./reportTime"/>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>Printed By: </xsl:text>
		<xsl:value-of select="./printedBy"/>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>&#10;</xsl:text>
	</xsl:template>
	<xsl:template match="reportExtractSet">
		<xsl:apply-templates select="com.lidp.model.admin.persistence.REPT__TXEE__Extract"/>
	</xsl:template>
    <xsl:template match="com.lidp.model.admin.persistence.REPT__TXEE__Extract">
		<xsl:text>Number Of Errors:</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./numberOfErrors"/>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:apply-templates select="entryList"/>
	</xsl:template>
	<xsl:template match="entryList">
		<xsl:apply-templates select="com.lidp.model.admin.persistence.REPT__TXEE__Entry"/>
	</xsl:template>
	<xsl:template match="com.lidp.model.admin.persistence.REPT__TXEE__Entry">
		<xsl:value-of select="$PolicyInformation"/>
		<xsl:value-of select="./policyNumber"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./submissionType"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./taxIdType"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./typeOfReturn"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./companyCode"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./nameControl"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./taxYear"/>
		<xsl:text>&#10;</xsl:text>
		<xsl:apply-templates select="ERROR__LOG"/>
	</xsl:template>

	<xsl:template match="ERROR__LOG">
		<xsl:value-of select="$ErrorInformation"/>
		<xsl:apply-templates select="com.lidp.model.admin.persistence.REPT__TXEE__ErrorEntry"/>
	</xsl:template>

	<xsl:template match="com.lidp.model.admin.persistence.REPT__TXEE__ErrorEntry">
		<xsl:value-of select="./messageCode"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./messsageConnect"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./messageConnector__TYPE"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./messageDescription"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./messageProgramID"/>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>&#10;</xsl:text>
	</xsl:template>

</xsl:stylesheet>
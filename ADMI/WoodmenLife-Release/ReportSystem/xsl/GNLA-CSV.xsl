<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:output method="text" />	
	<!-- Support GNLA CSV XSL Transformation Process --> 
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
		<xsl:text>"Account ID"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Class Code"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Tran Code"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Amount Allocated"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>" Number of Units"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Brief Description of Transaction Code"</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:apply-templates select="GainOrLossAccounting__ReportMaster" />
	</xsl:template>
	<xsl:template match="GainOrLossAccounting__ReportMaster">
       
	   <xsl:text>"</xsl:text><xsl:value-of select="companyCode" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
	   <xsl:text>"</xsl:text><xsl:value-of select="account" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
	   <xsl:text>"</xsl:text><xsl:value-of select="classCode" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
	   <xsl:text>"</xsl:text><xsl:value-of select="tran" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
	   <xsl:text>"</xsl:text><xsl:value-of select="amountAllocated" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
	   <xsl:text>"</xsl:text><xsl:value-of select="units" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
	   <xsl:text>"</xsl:text><xsl:value-of select="desc" /><xsl:text>"</xsl:text>
	    <xsl:text>&#10;</xsl:text>
	   	<xsl:if test="totalSW = 'true' ">
       <xsl:text>,,,,</xsl:text><xsl:text>"--------------------------------" </xsl:text><xsl:text>"--------------------------------" </xsl:text><xsl:text>&#10;</xsl:text>
       <xsl:text>,,,,</xsl:text><xsl:value-of select="accountTotalAmount" /><xsl:text>,</xsl:text><xsl:value-of select="accountTotalUnits" />
       <xsl:text>&#10;</xsl:text>
       <xsl:text>&#10;</xsl:text>
       </xsl:if>
	   <xsl:if test="companySW = 'true' ">
       <xsl:text>"COMPANY </xsl:text><xsl:value-of select="companyCode" />
       <xsl:text> HAS CHANGED:" </xsl:text>
	   <xsl:text>"AMOUNT ALLOCATED =" </xsl:text><xsl:value-of select="companyTotalAmount" /><xsl:text>,</xsl:text><xsl:text>,</xsl:text>
	    <xsl:text>" UNITS = " </xsl:text><xsl:value-of select="companyTotalUnits" /><xsl:text>,</xsl:text>
	    <xsl:text>&#10;</xsl:text>
	    <xsl:text>&#10;</xsl:text>
       </xsl:if>
	</xsl:template>
  <xsl:template match="totals">
		<xsl:text>"</xsl:text><xsl:value-of select="companyCode" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
	   <xsl:text>"</xsl:text><xsl:value-of select="account" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
	   <xsl:text>"</xsl:text><xsl:value-of select="classCode" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
	   <xsl:text>"</xsl:text><xsl:value-of select="tran" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
	   <xsl:text>"</xsl:text><xsl:value-of select="amountAllocated" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
	   <xsl:text>"</xsl:text><xsl:value-of select="units" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
	   <xsl:text>"</xsl:text><xsl:value-of select="desc" /><xsl:text>"</xsl:text>
	    <xsl:text>&#10;</xsl:text>
	   	<xsl:if test="totalSW = 'true' ">
       <xsl:text>,,,,</xsl:text><xsl:text>"--------------------------------" </xsl:text><xsl:text>"--------------------------------" </xsl:text><xsl:text>&#10;</xsl:text>
       <xsl:text>,,,,</xsl:text><xsl:value-of select="accountTotalAmount" /><xsl:text>,</xsl:text><xsl:value-of select="accountTotalUnits" />
       <xsl:text>&#10;</xsl:text>
       <xsl:text>&#10;</xsl:text>
       </xsl:if>
	   <xsl:if test="companySW = 'true' ">
       <xsl:text>"COMPANY </xsl:text><xsl:value-of select="companyCode" />
       <xsl:text> HAS CHANGED:" </xsl:text>
	   <xsl:text>"AMOUNT ALLOCATED =" </xsl:text><xsl:value-of select="companyTotalAmount" /><xsl:text>,</xsl:text><xsl:text>,</xsl:text>
	    <xsl:text>" UNITS = " </xsl:text><xsl:value-of select="companyTotalUnits" /><xsl:text>,</xsl:text>
	    <xsl:text>&#10;</xsl:text>
	    <xsl:text>&#10;</xsl:text>
       </xsl:if>
       <xsl:text>&#10;</xsl:text>
		
  	<xsl:text>&#10;</xsl:text>
        <xsl:text>"</xsl:text><xsl:text> COMPANY </xsl:text><xsl:value-of select="companyCode2" />
        <xsl:text> TOTAL </xsl:text><xsl:text>"</xsl:text>
	    <xsl:text> "AMOUNT ALLOCATED =" </xsl:text><xsl:value-of select="companyTotalAmount" /><xsl:text>,</xsl:text>
	    <xsl:text> "Units =" </xsl:text><xsl:value-of select="companyTotalUnits" /><xsl:text>,</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>" REPORT-ID = GNLA " </xsl:text>
		<xsl:text>" THE TOTAL AMOUNT ALLOCATED = " </xsl:text>
		<xsl:value-of select="reportTotalAmount" /><xsl:text>,</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>" Units = " </xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="reportTotalUnits" /><xsl:text>"</xsl:text>
	</xsl:template>
</xsl:stylesheet>
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:output method="text" />	
	<!-- Support GNLS CSV XSL Transformation Process --> 
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
		<xsl:text>"Expense Charge"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Account ID"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"CLS CD"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Amount Allocated"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Unit Value"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Units"</xsl:text><xsl:text>&#10;</xsl:text>
		<xsl:apply-templates select="GainOrLossByDate__ReportMaster" />
	</xsl:template>
	<xsl:template match="GainOrLossByDate__ReportMaster">
	  <xsl:if test="companyCode != '' ">
       <xsl:text>"COMPANY </xsl:text><xsl:value-of select="companyCode" />
       <xsl:text> HAS CHANGED:" </xsl:text>
	   <xsl:text>"AMOUNT ALLOCATED =" </xsl:text><xsl:value-of select="companyAmount" /><xsl:text>,</xsl:text>
	    <xsl:text>" OV/SHRT = " </xsl:text><xsl:value-of select="companyOver" /><xsl:text>,</xsl:text>
	    <xsl:text>&#10;</xsl:text>
	    <xsl:text>&#10;</xsl:text>
       </xsl:if>
	   <xsl:text>"</xsl:text><xsl:value-of select="company" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
	   <xsl:text>"</xsl:text><xsl:value-of select="broker" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
	   <xsl:text>"</xsl:text><xsl:value-of select="policy" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
	   <xsl:text>"</xsl:text><xsl:value-of select="owner" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
	   <xsl:text>"</xsl:text><xsl:value-of select="date" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
	   <xsl:text>"</xsl:text><xsl:value-of select="owner" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
	   <xsl:text>"</xsl:text><xsl:value-of select="time" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
	   <xsl:text>"</xsl:text><xsl:value-of select="transaction" /><xsl:text>"</xsl:text>
	   <xsl:text>"</xsl:text><xsl:value-of select="grossAmount" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
	   <xsl:text>"</xsl:text><xsl:value-of select="expenseCharge" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
	   <xsl:text>"</xsl:text><xsl:value-of select="account" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
	   <xsl:text>"</xsl:text><xsl:value-of select="classCode" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
	   <xsl:text>"</xsl:text><xsl:value-of select="amountAllocated" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
	   <xsl:text>"</xsl:text><xsl:value-of select="unitsValue" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
	   <xsl:text>"</xsl:text><xsl:value-of select="unitsPlusMinus" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
       <xsl:text>&#10;</xsl:text>
       <xsl:if test="sub1Account != '' ">
       <xsl:text> "ACCOUNT = " </xsl:text><xsl:value-of select="sub1Account" /><xsl:text>,</xsl:text>
	   <xsl:text>" CLASS = " </xsl:text><xsl:value-of select="sub1ClassCode" /><xsl:text>,</xsl:text>
	   <xsl:text>" DATE = " </xsl:text><xsl:value-of select="sub1Date" /><xsl:text>,</xsl:text>
	   <xsl:text>" AMOUNT ALLOCATED = " </xsl:text><xsl:value-of select="sub1TotalAmount" /><xsl:text>,</xsl:text>
	   <xsl:text>" UNITS = " </xsl:text><xsl:value-of select="sub1TotalUnits" /><xsl:text>,</xsl:text>
	   <xsl:text>" VAL = " </xsl:text><xsl:value-of select="sub1Accountvalue" /><xsl:text>,</xsl:text>
	   <xsl:if test="sub1Over != 0 ">
	   <xsl:text>" OV/SHRT = " </xsl:text><xsl:value-of select="sub1Over" /><xsl:text>,</xsl:text>
	   </xsl:if>
	    <xsl:if test="subOverX = 'N/A' ">
	   <xsl:text>" OV/SHRT = " </xsl:text><xsl:value-of select="subOverX" /><xsl:text>,</xsl:text>
       </xsl:if>
        <xsl:text>&#10;</xsl:text>
       </xsl:if>
       <xsl:if test="sub2Account != '' ">
       <xsl:text> "ACCOUNT = " </xsl:text><xsl:value-of select="sub2Account" /><xsl:text>,</xsl:text>
	   <xsl:text>" CLASS = " </xsl:text><xsl:value-of select="sub2ClassCode" /><xsl:text>,</xsl:text>
	   <xsl:text>" DATE = " </xsl:text><xsl:value-of select="sub2Date" /><xsl:text>,</xsl:text>
	   <xsl:text>" AMOUNT ALLOCATED = " </xsl:text><xsl:value-of select="sub2TotalAmount" /><xsl:text>,</xsl:text>
	   <xsl:text>" UNITS = " </xsl:text><xsl:value-of select="sub2TotalUnits" /><xsl:text>,</xsl:text>
	   <xsl:text>" VAL = " </xsl:text><xsl:value-of select="sub2Accountvalue" /><xsl:text>,</xsl:text>
	   <xsl:if test="sub2Over != 0 ">
	   <xsl:text>" OV/SHRT = " </xsl:text>
	   <xsl:text>"</xsl:text><xsl:value-of select="sub2Over" /><xsl:text>,</xsl:text>
	   </xsl:if>
	    <xsl:if test="subOverX = 'N/A' ">
	   <xsl:text>" OV/SHRT = " </xsl:text><xsl:value-of select="subOverX" /><xsl:text>,</xsl:text>
       </xsl:if>
        <xsl:text>&#10;</xsl:text>
       </xsl:if>
       <xsl:text>&#10;</xsl:text>
	</xsl:template>
  <xsl:template match="totals">
  	<xsl:text>&#10;</xsl:text>
        <xsl:text>"</xsl:text><xsl:text> COMPANY </xsl:text><xsl:value-of select="companyCode" />
        <xsl:text> TOTAL </xsl:text><xsl:text>"</xsl:text>
	    <xsl:text> "AMOUNT ALLOCATED =" </xsl:text><xsl:value-of select="companyAmount" /><xsl:text>,</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>" REPORT-ID = GNLS " </xsl:text>
		<xsl:text>" THE TOTAL AMOUNT ALLOCATED = " </xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="reportTotal" /><xsl:text>"</xsl:text>
	</xsl:template>
</xsl:stylesheet>
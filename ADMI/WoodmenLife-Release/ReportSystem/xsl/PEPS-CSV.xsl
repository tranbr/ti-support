<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:output method="text" />
	
	<!-- Support PEPS CSV XSL Transformation Process -->
	
	<xsl:template match="/">
    	<xsl:apply-templates select="XML__ReportExtract" />
  	</xsl:template>	
  	
  	<xsl:template match="XML__ReportExtract">  
	    <xsl:text>Company Code:  </xsl:text><xsl:value-of select="companyCode" />
		<xsl:text>&#10;</xsl:text>
		<xsl:text>Company Name:  </xsl:text><xsl:value-of select="companyName" />
		<xsl:text>&#10;</xsl:text>
		<xsl:text>Report Description:  </xsl:text><xsl:value-of select="reportDescription" />
		<xsl:text>&#10;</xsl:text>
		<xsl:text>Report ID:  </xsl:text><xsl:value-of select="reportID" />
		<xsl:text>&#10;</xsl:text>
		<xsl:variable name="from_Month" select="substring(fromDate, 6, 2)"/>
		<xsl:variable name="from_Day" select="substring(fromDate, 9)"/>
		<xsl:variable name="from_Year" select="substring(fromDate, 1, 4)"/>
		<xsl:variable name="from_Date" select="concat($from_Month, '-', $from_Day, '-', $from_Year)" />
		<xsl:text>From Date:  </xsl:text><xsl:value-of select="$from_Date" />
		<xsl:text>&#10;</xsl:text>
		<xsl:variable name="thru_Month" select="substring(thruDate, 6, 2)"/>
		<xsl:variable name="thru_Day" select="substring(thruDate, 9)"/>
		<xsl:variable name="thru_Year" select="substring(thruDate, 1, 4)"/>
		<xsl:variable name="thru_Date" select="concat($thru_Month, '-', $thru_Day, '-', $thru_Year)" />
		<xsl:text>Thru Date:  </xsl:text><xsl:value-of select="$thru_Date" />
		<xsl:text>&#10;</xsl:text>
		<xsl:variable name="report_Month" select="substring(reportDate, 6, 2)"/>
		<xsl:variable name="report_Day" select="substring(reportDate, 9)"/>
		<xsl:variable name="report_Year" select="substring(reportDate, 1, 4)"/>
		<xsl:variable name="report_Date" select="concat($report_Month, '-', $report_Day, '-', $report_Year)" />
		<xsl:text>Report Date:  </xsl:text><xsl:value-of select="$report_Date" />
		<xsl:text>&#10;</xsl:text>
	    <xsl:text>Report Time:  </xsl:text><xsl:value-of select="reportTime" />
		<xsl:text>&#10;</xsl:text>
		<xsl:text>Printed By:  </xsl:text><xsl:value-of select="printedBy" />	
		<xsl:text>&#10;</xsl:text>		
		<xsl:text>&#10;</xsl:text>		
		<xsl:text>Reporting State,,,Count,Amount</xsl:text>
		<xsl:text>&#10;</xsl:text>	
		<xsl:apply-templates select="reportExtractSet/REPT__PEPS__InforceByState__Extract" />
		<xsl:text>&#10;</xsl:text>	
    	<xsl:apply-templates select="totals" />
	</xsl:template>
	
	<xsl:template match="REPT__PEPS__InforceByState__Extract">
		<xsl:text>&#10;</xsl:text>
		<xsl:apply-templates select="__REPT__PEPS__EntrySet/REPT__PEPS__Entry" />
	</xsl:template>
		
	<xsl:template match="REPT__PEPS__Entry">
		<xsl:text>"</xsl:text><xsl:value-of select="reportingState" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="stateName" /><xsl:text>"</xsl:text><xsl:text>&#10;</xsl:text>
		
		<xsl:text>,,Beginning Total:,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="begin" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="beginAmount" /><xsl:text>"</xsl:text><xsl:text>&#10;</xsl:text>
		
		<xsl:text>,,Issued During Period:,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="issued" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="issuedAmount" /><xsl:text>"</xsl:text><xsl:text>&#10;</xsl:text>
		
		<xsl:text>,,Increase In Period:,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="increase" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="increAmount" /><xsl:text>"</xsl:text><xsl:text>&#10;</xsl:text>
		
		<xsl:text>,,Ceased During Period:,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="ceased" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="ceasedAmount" /><xsl:text>"</xsl:text><xsl:text>&#10;</xsl:text>
		
		<xsl:text>,,Decrease In Period:,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="decrease" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="decreAmount" /><xsl:text>"</xsl:text><xsl:text>&#10;</xsl:text>
		
		<xsl:text>,,Line 20 PEIF Total In Force:,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="line22" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="line22Amount" /><xsl:text>"</xsl:text><xsl:text>&#10;</xsl:text>
		
		<xsl:text>,,Actual Total In Force:,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="line31d" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="line31dAmount" /><xsl:text>"</xsl:text><xsl:text>&#10;</xsl:text>
		<xsl:text>&#10;</xsl:text>
        
	</xsl:template>	
	
	<xsl:template match="totals">
		<xsl:text>,****-TOTAL-****</xsl:text>
		<xsl:text>&#10;</xsl:text>
		
		<xsl:text>,,Beginning Total:,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="begin" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="beginAmount" /><xsl:text>"</xsl:text><xsl:text>&#10;</xsl:text>
		
		<xsl:text>,,Issued During Period:,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="issued" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="issuedAmount" /><xsl:text>"</xsl:text><xsl:text>&#10;</xsl:text>
		
		<xsl:text>,,Increase In Period:,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="increase" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="increAmount" /><xsl:text>"</xsl:text><xsl:text>&#10;</xsl:text>
		
		<xsl:text>,,Ceased During Period:,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="ceased" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="ceasedAmount" /><xsl:text>"</xsl:text><xsl:text>&#10;</xsl:text>
		
		<xsl:text>,,Decrease In Period:,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="decrease" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="decreAmount" /><xsl:text>"</xsl:text><xsl:text>&#10;</xsl:text>
		
		<xsl:text>,,Line 20 PEIF Total In Force:,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="line22" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="line22Amount" /><xsl:text>"</xsl:text><xsl:text>&#10;</xsl:text>
		
		<xsl:text>,,Actual Total In Force:,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="line31d" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="line31dAmount" /><xsl:text>"</xsl:text><xsl:text>&#10;</xsl:text>
	</xsl:template>
</xsl:stylesheet>
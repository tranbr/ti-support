<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:output method="text" />
	
	<!-- Support PEDR CSV XSL Transformation Process -->
	
	<xsl:template match="/">
    	<xsl:apply-templates select="XML__ReportExtract" />
  	</xsl:template>	
  	
  	<xsl:template match="XML__ReportExtract">  		
		<xsl:apply-templates select="reportExtractSet/REPT__PEDR__Generate__Extract" />
	</xsl:template>
	
	<xsl:template match="REPT__PEDR__Generate__Extract">
		<xsl:text>Company Code:  </xsl:text><xsl:value-of select="companyCode" />
		<xsl:text>&#10;</xsl:text>
		<xsl:text>Company Name:  </xsl:text><xsl:value-of select="//companyName" />
		<xsl:text>&#10;</xsl:text>
		<xsl:text>Report Description:  </xsl:text><xsl:value-of select="//reportDescription" />
		<xsl:text>&#10;</xsl:text>
		<xsl:text>Report ID:  </xsl:text><xsl:value-of select="//reportID" />
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
		<xsl:variable name="report_Month" select="substring(//reportDate, 6, 2)"/>
		<xsl:variable name="report_Day" select="substring(//reportDate, 9)"/>
		<xsl:variable name="report_Year" select="substring(//reportDate, 1, 4)"/>
		<xsl:variable name="report_Date" select="concat($report_Month, '-', $report_Day, '-', $report_Year)" />
		<xsl:text>Report Date:  </xsl:text><xsl:value-of select="$report_Date" />
		<xsl:text>&#10;</xsl:text>
	    <xsl:text>Report Time:  </xsl:text><xsl:value-of select="//reportTime" />
		<xsl:text>&#10;</xsl:text>
		<xsl:text>Printed By:  </xsl:text><xsl:value-of select="//printedBy" />	
		<xsl:text>&#10;</xsl:text>		
		<xsl:text>&#10;</xsl:text>	
		
		<xsl:text>,Policy Number,Print Type,AH Status,Reporting State,Death Benefit Option,Coverage Number</xsl:text>
		<xsl:text>,Plan Code,Issue Age,Issue Date,Coverage Status,Face Amount,Cash Value/Net Premium,Corridor Amount</xsl:text>
		<xsl:text>&#10;</xsl:text>
		
		<xsl:apply-templates select="__REPT__PEDR__Generate__EntrySet/REPT__PEDR__Generate__Entry" />
		
		<xsl:text>&#10;</xsl:text>		
		<xsl:text>&#10;</xsl:text>
		
		<xsl:apply-templates select="__REPT__PEDR__Generate__TotalEntrySet/REPT__PEDR__Generate__TotalEntry" />
		
		<xsl:text>&#10;</xsl:text>
		<xsl:text>&#10;</xsl:text>
	</xsl:template>
		
	<xsl:template match="REPT__PEDR__Generate__Entry">
		<xsl:text>&#10;</xsl:text><xsl:text>,</xsl:text>
		<xsl:value-of select="policyNumber" /><xsl:text>,</xsl:text>
		<xsl:value-of select="type" /><xsl:text>,</xsl:text>
		<xsl:value-of select="ahStatus" /><xsl:text>,</xsl:text>
		<xsl:value-of select="state" /><xsl:text>,</xsl:text>
		<xsl:value-of select="deathBenefitOption" /><xsl:text>,</xsl:text>
		<xsl:value-of select="coverage" /><xsl:value-of select="subCoverage" /><xsl:text>,</xsl:text>
		<xsl:value-of select="planCode" /><xsl:text>,</xsl:text>
		<xsl:value-of select="issueAge" /><xsl:text>,</xsl:text>
		<xsl:variable name="issue_Month" select="substring(issueDate, 6, 2)"/>
		<xsl:variable name="issue_Day" select="substring(issueDate, 9)"/>
		<xsl:variable name="issue_Year" select="substring(issueDate, 1, 4)"/>
		<xsl:variable name="issue_Date" select="concat($issue_Month, '-', $issue_Day, '-', $issue_Year)" />
		<xsl:value-of select="$issue_Date" /><xsl:text>,</xsl:text>
		<xsl:value-of select="status" /><xsl:text>,</xsl:text>
		<xsl:value-of select="faceAmount" /><xsl:text>,</xsl:text>
		<xsl:value-of select="cashValue" /><xsl:text>,</xsl:text>
		<xsl:value-of select="corridor" /><xsl:text>,</xsl:text>
	</xsl:template>	
		
	<xsl:template match="REPT__PEDR__Generate__TotalEntry">
		<xsl:text>&#10;</xsl:text><xsl:text>,,</xsl:text>
		<xsl:value-of select="totalMessage" />
		<xsl:text>&#10;</xsl:text>
		<xsl:text>,,Face Amount:,</xsl:text><xsl:value-of select="faceAmountOut" />
		<xsl:text>&#10;</xsl:text>
		<xsl:text>,,Cash Value:,</xsl:text><xsl:value-of select="cashValueOut" />
		<xsl:text>&#10;</xsl:text>
		<xsl:text>,,Corridor:,</xsl:text><xsl:value-of select="corridorOut" />
	</xsl:template>	
</xsl:stylesheet>
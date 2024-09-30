<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:output method="text" />
	
	<!-- Support PEBE CSV XSL Transformation Process -->
	
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
		<xsl:variable name="fromMonth" select="substring(fromDate, 6, 2)"/>
		<xsl:variable name="fromDay" select="substring(fromDate, 9)"/>
		<xsl:variable name="fromYear" select="substring(fromDate, 1, 4)"/>
		<xsl:variable name="fromDate" select="concat($fromMonth, '-', $fromDay, '-', $fromYear)" />
		<xsl:text>From Date:  </xsl:text><xsl:value-of select="$fromDate" />
		<xsl:text>&#10;</xsl:text>
		<xsl:variable name="thruMonth" select="substring(thruDate, 6, 2)"/>
		<xsl:variable name="thruDay" select="substring(thruDate, 9)"/>
		<xsl:variable name="thruYear" select="substring(thruDate, 1, 4)"/>
		<xsl:variable name="thruDate" select="concat($thruMonth, '-', $thruDay, '-', $thruYear)" />
		<xsl:text>Thru Date:  </xsl:text><xsl:value-of select="$thruDate" />
		<xsl:text>&#10;</xsl:text>
		<xsl:variable name="reportMonth" select="substring(reportDate, 6, 2)"/>
		<xsl:variable name="reportDay" select="substring(reportDate, 9)"/>
		<xsl:variable name="reportYear" select="substring(reportDate, 1, 4)"/>
		<xsl:variable name="reportDate" select="concat($reportMonth, '-', $reportDay, '-', $reportYear)" />
		<xsl:text>Report Date:  </xsl:text><xsl:value-of select="$reportDate" />
		<xsl:text>&#10;</xsl:text>
	    <xsl:text>Report Time:  </xsl:text><xsl:value-of select="reportTime" />
		<xsl:text>&#10;</xsl:text>
		<xsl:text>Printed By:  </xsl:text><xsl:value-of select="printedBy" />	
		<xsl:text>&#10;</xsl:text>		
		<xsl:text>&#10;</xsl:text>		
		<xsl:text>,Policy Number,Source,AH Status,Death Benefit Option,Coverage/Sub Coverage</xsl:text>
		<xsl:text>,Plan Code,Record Type,Balance Record Type,Issue Age,Issue Date,Effective Date,Status</xsl:text>
		<xsl:text>,Count,Face Amount,Reason On,Reason Off,Tran ID Error</xsl:text>
		<xsl:text>&#10;</xsl:text>
		
		<xsl:apply-templates select="reportExtractSet/REPT__PEBE__Generate__Extract" />
	</xsl:template>
	
	<xsl:template match="REPT__PEBE__Generate__Extract">
		<xsl:apply-templates select="__REPT__PEBE__Generate__EntrySet/REPT__PEBE__Generate__Entry" />
		
		<xsl:text>&#10;</xsl:text>
		<xsl:text>,,</xsl:text><xsl:value-of select="sourceSumm" />
		<xsl:text>,,,,,,,,,,,</xsl:text><xsl:value-of select="countSummSign" /><xsl:text> </xsl:text><xsl:value-of select="countSumm" />
		<xsl:text>,</xsl:text><xsl:value-of select="faceAmountSumm" /><xsl:value-of select="faceAmountSummSign" />
		<xsl:text>,,,</xsl:text><xsl:value-of select="tranSumm" />
		
		<xsl:text>&#10;</xsl:text>
		<xsl:text>,,</xsl:text><xsl:value-of select="originalSourceSum" />
		<xsl:text>,,,,,,,,,,,</xsl:text><xsl:value-of select="originalCountSumSign" /><xsl:text> </xsl:text><xsl:value-of select="originalCountSum" />
		<xsl:text>,</xsl:text><xsl:value-of select="originalFaceAmountSum" /><xsl:value-of select="originalFaceAmountSumSign" />
		
		<xsl:text>&#10;</xsl:text>
		<xsl:text>&#10;</xsl:text>
	</xsl:template>
		
	<xsl:template match="REPT__PEBE__Generate__Entry">
		<xsl:text>&#10;</xsl:text><xsl:text>,</xsl:text>
		<xsl:value-of select="policyNumber" /><xsl:text>,</xsl:text>
		<xsl:value-of select="source" /><xsl:text>,</xsl:text>
		<xsl:value-of select="ahStatus" /><xsl:text>,</xsl:text>
		<xsl:value-of select="deathBenefitOption" /><xsl:text>,</xsl:text>
		<xsl:value-of select="coverage" /><xsl:value-of select="subCoverage" /><xsl:text>,</xsl:text>
		<xsl:value-of select="planCode" /><xsl:text>,</xsl:text>
		<xsl:value-of select="originalRecType" /><xsl:text>,</xsl:text>
		<xsl:value-of select="recordType" /><xsl:text>,</xsl:text>
		<xsl:value-of select="issueAge" /><xsl:text>,</xsl:text>
		<xsl:variable name="issueMonth" select="substring(issueDate, 6, 2)"/>
		<xsl:variable name="issueDay" select="substring(issueDate, 9)"/>
		<xsl:variable name="issueYear" select="substring(issueDate, 1, 4)"/>
		<xsl:variable name="issueDate" select="concat($issueMonth, '-', $issueDay, '-', $issueYear)" />
		<xsl:value-of select="$issueDate" /><xsl:text>,</xsl:text>
		<xsl:variable name="effMonth" select="substring(effectiveDate, 6, 2)"/>
		<xsl:variable name="effDay" select="substring(effectiveDate, 9)"/>
		<xsl:variable name="effYear" select="substring(effectiveDate, 1, 4)"/>
		<xsl:variable name="effDate" select="concat($effMonth, '-', $effDay, '-', $effYear)" />
		<xsl:value-of select="$effDate" /><xsl:text>,</xsl:text>
		<xsl:value-of select="status" /><xsl:text>,</xsl:text>
		<xsl:value-of select="sign" /><xsl:text> </xsl:text><xsl:value-of select="count" /><xsl:text>,</xsl:text>
		<xsl:value-of select="faceAmount" /><xsl:value-of select="faceSign" /><xsl:text>,</xsl:text>
		<xsl:value-of select="peOn" /><xsl:text>,</xsl:text>
		<xsl:value-of select="peOff" /><xsl:text>,</xsl:text>
		<xsl:value-of select="tranCode" />
	</xsl:template>	
</xsl:stylesheet>
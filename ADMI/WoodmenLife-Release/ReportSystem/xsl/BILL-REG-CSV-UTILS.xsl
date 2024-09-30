<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:output method="text" />	
	<!-- Support CSV XSL Transformation Process for Bill Registers -->
 	<xsl:template name="process">
    	<xsl:apply-templates select="XML__ReportExtract" />
    	<xsl:apply-templates select="XML__ReportExtract/reportExtractSet" />
    	<xsl:apply-templates select="XML__ReportExtract/totals" />
  	</xsl:template>		
	<xsl:template match="XML__ReportExtract">  
	    <xsl:text>Company Code:  </xsl:text><xsl:value-of select="./companyCode" />
		<xsl:text>&#10;</xsl:text>
		<xsl:text>Company Name:  </xsl:text><xsl:value-of select="./companyName" />
		<xsl:text>&#10;</xsl:text>
		<xsl:text>Report Description:  </xsl:text><xsl:value-of select="./reportDescription" />
		<xsl:text>&#10;</xsl:text>
		<xsl:text>Report ID:  </xsl:text><xsl:value-of select="./reportID" />
		<xsl:text>&#10;</xsl:text>
		<xsl:variable name="fromMonth" select="substring(./fromDate, 6, 2)"/>
		<xsl:variable name="fromDay" select="substring(./fromDate, 9)"/>
		<xsl:variable name="fromYear" select="substring(./fromDate, 1, 4)"/>
		<xsl:variable name="fromDate" select="concat($fromMonth, '-', $fromDay, '-', $fromYear)" />
		<xsl:text>From Date:  </xsl:text><xsl:value-of select="$fromDate" />
		<xsl:text>&#10;</xsl:text>
		<xsl:variable name="thruMonth" select="substring(./thruDate, 6, 2)"/>
		<xsl:variable name="thruDay" select="substring(./thruDate, 9)"/>
		<xsl:variable name="thruYear" select="substring(./thruDate, 1, 4)"/>
		<xsl:variable name="thruDate" select="concat($thruMonth, '-', $thruDay, '-', $thruYear)" />
		<xsl:text>Thru Date:  </xsl:text><xsl:value-of select="$thruDate" />
		<xsl:text>&#10;</xsl:text>
		<xsl:variable name="reportMonth" select="substring(./reportDate, 6, 2)"/>
		<xsl:variable name="reportDay" select="substring(./reportDate, 9)"/>
		<xsl:variable name="reportYear" select="substring(./reportDate, 1, 4)"/>
		<xsl:variable name="reportDate" select="concat($reportMonth, '-', $reportDay, '-', $reportYear)" />
		<xsl:text>Report Date:  </xsl:text><xsl:value-of select="$reportDate" />
		<xsl:text>&#10;</xsl:text>
	    <xsl:text>Report Time:  </xsl:text><xsl:value-of select="./reportTime" />
		<xsl:text>&#10;</xsl:text>
		<xsl:text>Printed By:  </xsl:text><xsl:value-of select="./printedBy" />	
		<xsl:text>&#10;</xsl:text>		
		<xsl:text>&#10;</xsl:text>		
	</xsl:template>
	<xsl:template match="reportExtractSet">
		<xsl:text>Certificate Number,</xsl:text>
		<xsl:text>Insured Name,</xsl:text>
		<xsl:text>Payor Name and Address,</xsl:text>
		<xsl:text>Billed From,</xsl:text>
		<xsl:text>Pay Mode,</xsl:text>
		<xsl:text>Billed To,</xsl:text>
		<xsl:text>FMO Number,</xsl:text>
		<xsl:text>Writing Agent Number,</xsl:text>
		<xsl:text>Billed Premium,</xsl:text>
		<xsl:text>Net Arrears,</xsl:text>
		<xsl:text>Billed Total,</xsl:text>
		<xsl:text>Billing Suppress Indicator</xsl:text><xsl:text>&#10;</xsl:text>
		<xsl:apply-templates select="BILL__Notice__ReportMaster" />
	</xsl:template>
	<xsl:template match="BILL__Notice__ReportMaster">
		<xsl:text>"</xsl:text><xsl:value-of select="policyNumber" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="insuredsName" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="payorName" /><xsl:text>&#10;</xsl:text>
							  <xsl:value-of select="payorStreet" /><xsl:text>&#10;</xsl:text>
							  <xsl:value-of select="payorCity" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:variable name="dueMonth" select="substring(dueDate, 6, 2)"/>
		<xsl:variable name="dueDay" select="substring(dueDate, 9)"/>
		<xsl:variable name="dueYear" select="substring(dueDate, 1, 4)"/>
		<xsl:variable name="dueDate" select="concat($dueMonth, '-', $dueDay, '-', $dueYear)" />
		<xsl:text>"</xsl:text><xsl:value-of select="$dueDate" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="billMode" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:variable name="billedToMonth" select="substring(billedToDate, 6, 2)"/>
		<xsl:variable name="billedToDay" select="substring(billedToDate, 9)"/>
		<xsl:variable name="billedToYear" select="substring(billedToDate, 1, 4)"/>
		<xsl:variable name="billedToDate" select="concat($billedToMonth, '-', $billedToDay, '-', $billedToYear)" />
		<xsl:text>"</xsl:text><xsl:value-of select="$billedToDate" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="fmoNumber" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="agentNumber" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="premiumDue" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="netArrears" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="grandTotal" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="billSuppress" /><xsl:text>"</xsl:text><xsl:text>&#10;</xsl:text>
	</xsl:template>	
	<xsl:template match="totals">
		<xsl:text>&#10;</xsl:text>
		<xsl:text>Total this report:</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>Record Count,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="totalRecords" /><xsl:text>"</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>Premium,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="totalVolume" /><xsl:text>"</xsl:text>
		<xsl:text>&#10;</xsl:text>
	</xsl:template>
</xsl:stylesheet>
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:output method="text" />	
	<!-- Support ISAC CSV XSL Transformation Process -->
 	<xsl:template match="/">
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
		<xsl:text>Company Code,</xsl:text>
		<xsl:text>Policy Number,</xsl:text>
		<xsl:text>Entry Date,</xsl:text>
		<xsl:text>CWAP Source,</xsl:text>
		<xsl:text>Batch Number,</xsl:text>
		<xsl:text>Department Desk,</xsl:text>
		<xsl:text>Transaction Amount,</xsl:text>
		<xsl:text>Transaction Code,</xsl:text>
		<xsl:text>Account Number,</xsl:text>
		<xsl:text>Insured Name,</xsl:text>
		<xsl:text>Billing Form,</xsl:text>
		<xsl:text>Billing Mode,</xsl:text>
		<xsl:text>Mode Premium,</xsl:text>
		<xsl:text>Billing Control Number,</xsl:text>
		<xsl:text>Agent Number,</xsl:text>
		<xsl:text>Commission Percent</xsl:text><xsl:text>&#10;</xsl:text>
		<xsl:apply-templates select="REPT__ISAC__Master" />
	</xsl:template>
	<xsl:template match="REPT__ISAC__Master">
		<xsl:text>"</xsl:text><xsl:value-of select="companyCode" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="policyNumber" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:variable name="entryMonth" select="substring(entryDate, 6, 2)"/>
		<xsl:variable name="entryDay" select="substring(entryDate, 9)"/>
		<xsl:variable name="entryYear" select="substring(entryDate, 1, 4)"/>
		<xsl:variable name="entryDate" select="concat($entryMonth, '-', $entryDay, '-', $entryYear)" />
		<xsl:text>"</xsl:text><xsl:value-of select="$entryDate" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="cwapSource" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="batchNumber" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="departmentDesk" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="transactionAmount" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="transactionCode" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="accountNumber" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="insuredName" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="billingForm" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="billingMode" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="modePremium" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="billingControlNumber" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:apply-templates select="trzyAgentDataSet/TRZY__AGENT__DATA" />
	</xsl:template>	
	<xsl:template match="TRZY__AGENT__DATA">
		<xsl:if test="count(preceding-sibling::TRZY__AGENT__DATA) > 0">
			<xsl:text>"","","","","","","","","","","","","",</xsl:text>
		</xsl:if>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__AGENT__NUMBER" />
		<xsl:text>","</xsl:text>
		<xsl:value-of select="__AGENT__COMMISSION" />
		<xsl:text>"</xsl:text>
		<xsl:text>&#10;</xsl:text>
	</xsl:template>	
	<xsl:template match="totals">
		<xsl:text>&#10;</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>Totals:,</xsl:text>
		<xsl:text>Account Name,</xsl:text>
		<xsl:text>Number,</xsl:text>
		<xsl:text>Debit,</xsl:text>
		<xsl:text>Credit,</xsl:text>
		<xsl:text>Net</xsl:text><xsl:text>&#10;</xsl:text>
		<xsl:apply-templates select="totalEntrySet/TotalEntry" />
		<xsl:text>&#10;</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>,</xsl:text><xsl:text>,</xsl:text><xsl:text>"Grand Totals",</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="totalDebits" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="totalCredit" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="totalNet" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
	</xsl:template>
	<xsl:template match="TotalEntry">
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="./accountName" />
		<xsl:text>","</xsl:text>
		<xsl:value-of select="./number" />
		<xsl:text>","</xsl:text>
		<xsl:value-of select="./debit" />
		<xsl:text>","</xsl:text>
		<xsl:value-of select="./credit" />
		<xsl:text>","</xsl:text>
		<xsl:value-of select="./net" />
		<xsl:text>"</xsl:text>
		<xsl:text>&#10;</xsl:text>
	</xsl:template>
</xsl:stylesheet>

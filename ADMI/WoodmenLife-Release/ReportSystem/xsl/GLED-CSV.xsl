<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:output method="text" />	
	<!-- Support GLED CSV XSL Transformation Process -->
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
		<xsl:text>CMP,</xsl:text>
		<xsl:text>Agent Number,</xsl:text>
		<xsl:text>Sit Code,</xsl:text>
		<xsl:text>Tran Code,</xsl:text>
		<xsl:text>Tran Amount,</xsl:text>
		<xsl:text>Policy Number,</xsl:text>
		<xsl:text>Policy Premium,</xsl:text>
		<xsl:text>EFT Date,</xsl:text>
		<xsl:text>Account Number,</xsl:text>
		<xsl:text>DP Desk,</xsl:text>
		<xsl:text>Batch Number,</xsl:text>
		<xsl:text>JRNL Date,</xsl:text>
		<xsl:text>Description,</xsl:text>
		<xsl:text>CLS</xsl:text><xsl:text>&#10;</xsl:text>
		<xsl:apply-templates select="GAAC__AccountingExtract" />
	</xsl:template>
	<xsl:template match="GAAC__AccountingExtract">
		<xsl:text>"</xsl:text><xsl:value-of select="__GAAC__ACCOUNTING__RECORD/__ACCT__COMPANY__CODE" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="__GAAC__ACCOUNTING__RECORD/__GAAC__ACCT__ALTERNATE__KEY1/__AGNT__OR__REFERENCE" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="__GAAC__ACCOUNTING__RECORD/__AMS__SITUATION" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="__GAAC__ACCOUNTING__RECORD/__GAAC__ACCT__ALTERNATE__KEY1/__TRANSACTION__CODE" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="__GAAC__ACCOUNTING__RECORD/__TRANS__AMOUNT" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="__GAAC__ACCOUNTING__RECORD/__POLICY__NUMBER" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="__GAAC__ACCOUNTING__RECORD/__CASH__AMOUNT" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:variable name="entryMonth" select="substring(__GAAC__ACCOUNTING__RECORD/__ENTRY__XDATE, 6, 2)"/>
		<xsl:variable name="entryDay" select="substring(__GAAC__ACCOUNTING__RECORD/__ENTRY__XDATE, 9)"/>
		<xsl:variable name="entryYear" select="substring(__GAAC__ACCOUNTING__RECORD/__ENTRY__XDATE, 1, 4)"/>
		<xsl:variable name="entryDate" select="concat($entryMonth, '-', $entryDay, '-', $entryYear)" />
		<xsl:text>"</xsl:text><xsl:value-of select="$entryDate" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="__GAAC__ACCOUNTING__RECORD/__ACCOUNT__NUMBER" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="__GAAC__ACCOUNTING__RECORD/__GAAC__ACCT__PRIMARY__KEY/__DPDESK" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="__GAAC__ACCOUNTING__RECORD/__GAAC__ACCT__PRIMARY__KEY/__BATCH__OR__VOUCHER" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:variable name="journalMonth" select="substring(__GAAC__ACCOUNTING__RECORD/__GAAC__ACCT__ALTERNATE__KEY1/__SEQ__XDATE, 6, 2)"/>
		<xsl:variable name="journalDay" select="substring(__GAAC__ACCOUNTING__RECORD/__GAAC__ACCT__ALTERNATE__KEY1/__SEQ__XDATE, 9)"/>
		<xsl:variable name="journalYear" select="substring(__GAAC__ACCOUNTING__RECORD/__GAAC__ACCT__ALTERNATE__KEY1/__SEQ__XDATE, 1, 4)"/>
		<xsl:variable name="journalDate" select="concat($journalMonth, '-', $journalDay, '-', $journalYear)" />
		<xsl:text>"</xsl:text><xsl:value-of select="$journalDate" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="__GAAC__ACCOUNTING__RECORD/__DESCRIPTION__FIELD" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="__GAAC__ACCOUNTING__RECORD/__CLASS__CODE" /><xsl:text>"</xsl:text><xsl:text>&#10;</xsl:text>
	</xsl:template>	
	<xsl:template match="totals">
		<xsl:text>&#10;</xsl:text>
		<xsl:text>GLED Report Totals:</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>Records,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="totalAcctRecords" /><xsl:text>"</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>Debits,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="totalDebitAmount" /><xsl:text>"</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>Credits,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="totalCreditAmount" /><xsl:text>"</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>Net To Cash,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="totalNetToCashAmount" /><xsl:text>"</xsl:text>
		<xsl:text>&#10;</xsl:text>
	</xsl:template>
</xsl:stylesheet>
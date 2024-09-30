<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:import href="CSV-UTILS.xsl" />
	<xsl:output method="text" indent="no" />
	<!-- Support RGER CSV XSL Transformation Process -->
	<xsl:template match="/">
    	<xsl:apply-templates select="XML__ReportExtract" />
  	</xsl:template>	
 	<xsl:template match="XML__ReportExtract">
  	    <xsl:call-template name="mainHeader1"/>
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
    	<xsl:apply-templates select="reportExtractSet" />
    	<xsl:apply-templates select="totals" />
  	</xsl:template>		
	<xsl:template match="reportExtractSet">
  	    <xsl:text>&#10;</xsl:text>
  	    <xsl:text>&#10;</xsl:text>
		<xsl:text>Group Number,</xsl:text>
		<xsl:text>Group Situation,</xsl:text>
		<xsl:text>Company Code,</xsl:text>
		<xsl:text>Batch Date,</xsl:text>
		<xsl:text>Policy/Client Number,</xsl:text>
		<xsl:text>Transaction Code,</xsl:text>
		<xsl:text>Transaction Amount,</xsl:text>
		<xsl:text>Due Date</xsl:text>
  	    <xsl:text>&#10;</xsl:text>
	   	<xsl:for-each select="REPT__RGER__Extract"> 
		   <xsl:call-template name="detail_line"/>
		</xsl:for-each>
	</xsl:template>
    <xsl:template name="detail_line">
		<xsl:text>"</xsl:text>
		<xsl:value-of select="groupNumber" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="groupSitCode" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="groupCompanyCode" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:variable name="batchMonth" select="substring(batchDate, 6, 2)"/>
		<xsl:variable name="batchDay" select="substring(batchDate, 9)"/>
		<xsl:variable name="batchYear" select="substring(batchDate, 1, 4)"/>
		<xsl:variable name="date" select="concat($batchMonth, '-', $batchDay, '-', $batchYear)" />
		<xsl:value-of select="$date" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="polRefNumber" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="transCode" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="transAmount" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:variable name="dueMonth" select="substring(transDueDate, 6, 2)"/>
		<xsl:variable name="dueDay" select="substring(transDueDate, 9)"/>
		<xsl:variable name="dueYear" select="substring(transDueDate, 1, 4)"/>
		<xsl:variable name="dueDate" select="concat($dueMonth, '-', $dueDay, '-', $dueYear)" />
		<xsl:value-of select="$dueDate" />
		<xsl:text>"</xsl:text>
		<xsl:text>&#10;</xsl:text>
    	<xsl:text>"",</xsl:text>
    	<xsl:text>Error,</xsl:text>
		<xsl:text>Code,</xsl:text>
		<xsl:text>Connector,</xsl:text>
		<xsl:text>Description</xsl:text>
		<xsl:text>&#10;</xsl:text>
	   	<xsl:for-each select="errorEntrySet/REPT__RGER__Error__Entry"> 
		   <xsl:call-template name="error_detail_line"/>
		</xsl:for-each>
		<xsl:text>&#10;</xsl:text>
	</xsl:template>
    <xsl:template name="error_detail_line">
    	<xsl:text>"",</xsl:text>
    	<xsl:text>"",</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="errorMessageCode" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="errorConnector" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="errorDescription" />
		<xsl:text>"</xsl:text>
		<xsl:text>&#10;</xsl:text>
    </xsl:template>
	<xsl:template match="totals">
		<xsl:text>&#10;</xsl:text>
		<xsl:text>RGER Report Totals:</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>Records,</xsl:text>
		<xsl:text>"</xsl:text><xsl:value-of select="totalRecords" /><xsl:text>"</xsl:text>
	</xsl:template>
</xsl:stylesheet>
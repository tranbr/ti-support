<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:output method="text" />	
	<!-- Support SSAV CSV XSL Transformation Process -->
 	<xsl:template match="/">
    	<xsl:apply-templates select="XML__ReportExtract" />
    	<xsl:apply-templates select="XML__ReportExtract/reportExtractSet" />
  	</xsl:template>		
	<xsl:template match="XML__ReportExtract">
		<!-- Company Name -->
		<xsl:value-of select="./companyName" />
		<xsl:text>&#10;</xsl:text>
		<!-- Report Title -->
		<xsl:value-of select="./reportDescription" />
		<xsl:text>&#10;</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>&#10;</xsl:text>
	</xsl:template>
	<xsl:template match="reportExtractSet">
		<xsl:apply-templates select="REPT__SSAV__ReportMaster" />
	</xsl:template>
	<xsl:template match="REPT__SSAV__ReportMaster">
		<xsl:text>"Date:","</xsl:text>
		<xsl:variable name="month" select="substring(../../reportDate, 6, 2)"/>
		<xsl:variable name="day" select="substring(../../reportDate, 9)"/>
		<xsl:variable name="year" select="substring(../../reportDate, 1, 4)"/>
		<xsl:variable name="date" select="concat($month, '/', $day, '/', $year)" />
		<xsl:value-of select="$date" />
		<xsl:text>"</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>"Control Number:","</xsl:text>
		<xsl:value-of select="clientReference" />
		<xsl:text>","Your agent is:"</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="payorName" />
		<xsl:text>","","</xsl:text>
		<xsl:value-of select="agentName" />
		<xsl:text>"</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="payorStreet" />
		<xsl:text>","","</xsl:text>
		<xsl:value-of select="agencyStreet" />
		<xsl:text>"</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:if test="payorAddress2 != ''">
			<xsl:value-of select="payorAddress2" />
		</xsl:if>
		<xsl:if test="payorAddress2 = ''">
			<xsl:value-of select="payorCity" />
		</xsl:if>
		<xsl:text>","","</xsl:text>
		<xsl:if test="agencyAddress2 != ''">
			<xsl:value-of select="agencyAddress2" />
		</xsl:if>
		<xsl:if test="agencyAddress2 = ''">
			<xsl:value-of select="agencyCity" />
		</xsl:if>
		<xsl:text>"</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:if test="payorAddress3 != ''">
			<xsl:value-of select="payorAddress3" />
		</xsl:if>
		<xsl:if test="payorAddress3 = ''">
			<xsl:if test="payorAddress2 != ''">
				<xsl:value-of select="payorCity" />
			</xsl:if>	
		</xsl:if>
		<xsl:text>","","</xsl:text>
		<xsl:if test="agencyAddress3 != ''">
			<xsl:value-of select="agencyAddress3" />
		</xsl:if>
		<xsl:if test="agencyAddress3 = ''">
			<xsl:if test="agencyAddress2 != ''">
				<xsl:value-of select="agencyCity" />
			</xsl:if>
		</xsl:if>
		<xsl:text>"</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:if test="payorAddress3 != ''">
			<xsl:value-of select="payorCity" />
		</xsl:if>
		<xsl:text>","","</xsl:text>
		<xsl:if test="agencyAddress3 != ''">
			<xsl:value-of select="agencyCity" />
		</xsl:if>
		<xsl:text>"</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:if test="agencyPhone != ''">
			<xsl:text>"","","</xsl:text>
			<xsl:value-of select="agencyPhone" />
			<xsl:text>"</xsl:text>
			<xsl:text>&#10;</xsl:text>
		</xsl:if>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>"Company",</xsl:text>
		<xsl:text>"Policy Number",</xsl:text>
		<xsl:text>"Insured's Name",</xsl:text>
		<xsl:text>"I.D. Number",</xsl:text>
		<xsl:text>"Description",</xsl:text>
		<xsl:text>"Amount",</xsl:text>
		<xsl:text>"Due Date"</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:apply-templates select="detailEntrySet/REPT__SSAV__ReportDetailEntry" />
		<xsl:text>"Please remit this amount:","</xsl:text>
		<xsl:value-of select="grandTotal" />
		<xsl:text>"</xsl:text>
		<xsl:text>&#10;</xsl:text>
	</xsl:template>
	<xsl:template match="REPT__SSAV__ReportDetailEntry">
		<xsl:text>"</xsl:text>
		<xsl:value-of select="company" />
		<xsl:text>","</xsl:text>
		<xsl:value-of select="policy" />
		<xsl:text>","</xsl:text>
		<xsl:value-of select="insured" />
		<xsl:text>","</xsl:text>
		<xsl:value-of select="idNumber" />
		<xsl:text>","</xsl:text>
		<xsl:value-of select="description" />
		<xsl:text>","</xsl:text>
		<xsl:value-of select="amount" />
		<xsl:text>","</xsl:text>
		<xsl:variable name="dueMonth" select="substring(dueDate, 6, 2)"/>
		<xsl:variable name="dueDay" select="substring(dueDate, 9)"/>
		<xsl:variable name="dueYear" select="substring(dueDate, 1, 4)"/>
		<xsl:variable name="dueDate" select="concat($dueMonth, '-', $dueDay, '-', $dueYear)" />
		<xsl:value-of select="$dueDate" />
		<xsl:text>"</xsl:text>
		<xsl:text>&#10;</xsl:text>
	</xsl:template>
</xsl:stylesheet>
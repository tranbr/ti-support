<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:output method="text" />	
	<!-- Support LPS1 CSV XSL Transformation Process -->
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
		<xsl:apply-templates select="BILL__Notice__ReportMaster" />
	</xsl:template>
	<xsl:template match="BILL__Notice__ReportMaster">
		<xsl:text>"Date:","</xsl:text>
		<xsl:variable name="month" select="substring(../../reportDate, 6, 2)"/>
		<xsl:variable name="day" select="substring(../../reportDate, 9)"/>
		<xsl:variable name="year" select="substring(../../reportDate, 1, 4)"/>
		<xsl:variable name="date" select="concat($month, '-', $day, '-', $year)" />
		<xsl:value-of select="$date" />
		<xsl:text>"</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>"Notice of Lapse"</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>"","",</xsl:text>
		<xsl:text>"If you have questions"</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>"","",</xsl:text>
		<xsl:text>"regarding your policy"</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>"","",</xsl:text>
		<xsl:text>"please contact:"</xsl:text>
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
		<xsl:text>"Policy No.:","</xsl:text>
		<xsl:value-of select="companyCode" />
		<xsl:text>-</xsl:text>
		<xsl:value-of select="policyNumber" />
		<xsl:text>"</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>"Insured:","</xsl:text>
		<xsl:value-of select="insuredsName" />
		<xsl:text>"</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>"Date due:","</xsl:text>
		<xsl:variable name="dueMonth" select="substring(dueDate, 6, 2)"/>
		<xsl:variable name="dueDay" select="substring(dueDate, 9)"/>
		<xsl:variable name="dueYear" select="substring(dueDate, 1, 4)"/>
		<xsl:variable name="dueDate" select="concat($dueMonth, '-', $dueDay, '-', $dueYear)" />
		<xsl:value-of select="$dueDate" />
		<xsl:text>"</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>"Premium Due","</xsl:text>
		<xsl:value-of select="premiumDue" />
		<xsl:text>"</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:apply-templates select="detailEntrySet/BILL__Notice__ReportDetailEntry" />
		<xsl:text>"Please remit this amount:","</xsl:text>
		<xsl:value-of select="grandTotal" />
		<xsl:text>"</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>"This policy will lapse if your premium is not paid by","</xsl:text>
		<xsl:variable name="lapseMonth" select="substring(lapseDate, 6, 2)"/>
		<xsl:variable name="lapseDay" select="substring(lapseDate, 9)"/>
		<xsl:variable name="lapseYear" select="substring(lapseDate, 1, 4)"/>
		<xsl:variable name="lapseDate" select="concat($lapseMonth, '-', $lapseDay, '-', $lapseYear)" />
		<xsl:value-of select="$lapseDate" />
		<xsl:text>"</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:value-of select="scanLine" />
		<xsl:text>&#10;</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>&#10;</xsl:text>
	</xsl:template>
	<xsl:template match="BILL__Notice__ReportDetailEntry">
		<xsl:text>"</xsl:text>
		<xsl:value-of select="description" />
		<xsl:text>","</xsl:text>
		<xsl:choose>
			<xsl:when test="contains(dateOrAmount, '-')">
				<xsl:variable name="detailMonth" select="substring(dateOrAmount, 6, 2)"/>
				<xsl:variable name="detailDay" select="substring(dateOrAmount, 9)"/>
				<xsl:variable name="detailYear" select="substring(dateOrAmount, 1, 4)"/>
				<xsl:variable name="detailDate" select="concat($detailMonth, '-', $detailDay, '-', $detailYear)" />
				<xsl:value-of select="$detailDate" />	
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="dateOrAmount" />
			</xsl:otherwise>
		</xsl:choose>
		<xsl:text>"</xsl:text>
		<xsl:text>&#10;</xsl:text>
	</xsl:template>
</xsl:stylesheet>
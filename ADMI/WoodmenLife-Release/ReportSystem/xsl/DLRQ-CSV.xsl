<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:output method="text" />
	<!-- Support DLRQ CSV XSL Transformation Process -->
	<xsl:template match="/">
		<xsl:apply-templates select="XML__ReportExtract" />
		<xsl:apply-templates select="XML__ReportExtract/reportExtractSet" />
	</xsl:template>
	<xsl:template match="XML__ReportExtract">
		<!-- Report Title -->
		<xsl:value-of select="./reportDescription" />
		<xsl:text>&#10;</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<!-- Company Name -->
		<xsl:text>"From: ",</xsl:text>
		<xsl:value-of select="./companyName" />
	</xsl:template>
	<xsl:template match="reportExtractSet">
		<xsl:apply-templates
			select="com.lidp.model.admin.persistence.REPT__DLRQ__Extract" />
	</xsl:template>
	<xsl:template match="com.lidp.model.admin.persistence.REPT__DLRQ__Extract">
		<xsl:text>,"","Date:","</xsl:text>
		<xsl:variable name="month" select="substring(../../reportDate, 6, 2)" />
		<xsl:variable name="day" select="substring(../../reportDate, 9)" />
		<xsl:variable name="year" select="substring(../../reportDate, 1, 4)" />
		<xsl:variable name="date"
			select="concat($month, '-', $day, '-', $year)" />
		<xsl:value-of select="$date" />
		<xsl:text>"</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>"",</xsl:text>
		<xsl:text>"1234 Hobson Road"</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>"",</xsl:text>
		<xsl:text>"Woodridge, IL 60517"</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>&#10;</xsl:text>

		<xsl:text>"","","",</xsl:text>
		<xsl:text>"To: ","</xsl:text>
		<xsl:value-of select="agentName" />
		<xsl:value-of select="agentAddressSet" />
		<xsl:value-of select="agentNumber" />
		<xsl:text>"</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>&#10;</xsl:text>

		<!-- Report Body -->
		<xsl:text>"Pending Policy Number: ","</xsl:text>
		<xsl:value-of select="policyNumber" />
		<xsl:text>"</xsl:text>
		<xsl:text>&#10;</xsl:text>

		<xsl:text>&#10;</xsl:text>
		<xsl:text>"Payor Information:","</xsl:text>
		<xsl:value-of select="payorName" />
		<xsl:value-of select="payorAddressSet" />
		<xsl:text>"</xsl:text>

		<xsl:text>&#10;</xsl:text>
		<xsl:text>"Insured Information:","</xsl:text>
		<xsl:value-of select="insuredName" />
		<xsl:value-of select="insuredAddressSet" />
		<xsl:text>"</xsl:text>
		<xsl:text>&#10;</xsl:text>

		<xsl:text>"Pending Requirements: ","</xsl:text>    <!--How is this section populated, check apdlrq00! -->
		<xsl:value-of select="DLRQ_DescriptionEntry" />
		<xsl:text>"</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>"","","",</xsl:text>
		<xsl:text>"Date due:","</xsl:text>
		<xsl:variable name="dueMonth" select="substring(dueDate, 6, 2)"/>
		<xsl:variable name="dueDay" select="substring(dueDate, 9)"/>
		<xsl:variable name="dueYear" select="substring(dueDate, 1, 4)"/>
		<xsl:variable name="dueDate" select="concat($dueMonth, '-', $dueDay, '-', $dueYear)" />
		<xsl:value-of select="$dueDate" />
		<xsl:text>"</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>"",</xsl:text>
		<xsl:text>"Billing Mode: ","</xsl:text>
		<xsl:value-of select="billingMode" />
		<xsl:text>"</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>"",</xsl:text>
		<xsl:text>"Premium Mode Amount: ","</xsl:text>
		<xsl:text>$</xsl:text>
		<xsl:value-of select="modePremium" />
		<xsl:text>"</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>"",</xsl:text>
		<xsl:text>"Amount Received: ","</xsl:text>
		<xsl:text>$</xsl:text>
		<xsl:value-of select="suspenseAmount" />
		<xsl:text>"</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>"",</xsl:text>
		<xsl:text>"Amount Due: ","</xsl:text>
		<xsl:text>$</xsl:text>
		<xsl:value-of select="amountDue" />
		<xsl:text>"</xsl:text>
		<xsl:text>&#10;</xsl:text>
	</xsl:template>
</xsl:stylesheet>
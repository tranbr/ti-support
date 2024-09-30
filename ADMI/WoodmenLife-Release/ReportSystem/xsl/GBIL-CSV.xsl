<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:output method="text" />	
	<!-- Support GBIL CSV XSL Transformation Process -->
 	<xsl:template match="/">
    	<xsl:apply-templates select="XML__ReportExtract" />
    	<xsl:apply-templates select="XML__ReportExtract/reportExtractSet" />
  	</xsl:template>
	<xsl:template match="XML__ReportExtract">
		<!-- Company Code -->
		<xsl:text>Co. </xsl:text>
		<xsl:value-of select="./companyCode" />
		<xsl:text> Report </xsl:text>
		<xsl:value-of select="./reportID" />
		<xsl:text>&#10;</xsl:text>
		<!-- Company Name -->
		<xsl:value-of select="./companyName" />
		<xsl:text>&#10;</xsl:text>
		<xsl:text>&#10;</xsl:text>
	</xsl:template>
	<xsl:template match="reportExtractSet">
		<xsl:apply-templates select="REPT__GBIL__Extract" />
	</xsl:template>
	<xsl:template match="REPT__GBIL__Extract">
		<!-- Report Date -->
		<xsl:text>Date: </xsl:text>
		<xsl:value-of select="../../reportDate" />
		<xsl:text>&#10;</xsl:text>
		<xsl:choose>
			<xsl:when test="billStatus = 'PD'">
				<xsl:text>Billing Notice -- Paid in Full</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text>Billing Notice -- Please Remit Payment</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:apply-templates select="commentNoteSet/REPT__GBIL__CommentNote" />
		<xsl:text>"Group:","</xsl:text>
		<xsl:value-of select="groupName" />
		<xsl:text>","","Agent:","</xsl:text>
		<xsl:value-of select="agentName" />
		<xsl:text>"</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>"","</xsl:text>
		<xsl:value-of select="groupStreet" />
		<xsl:text>","","","</xsl:text>
		<xsl:value-of select="agentStreet" />
		<xsl:text>"</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>"","</xsl:text>
		<xsl:value-of select="groupCity" />
		<xsl:text>","","","</xsl:text>
		<xsl:value-of select="agentCity" />
		<xsl:text>"</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:if test="not(groupAddress3 = '' and agentAddress3 = '')">
			<xsl:text>"","</xsl:text>
			<xsl:value-of select="groupAddress3" />
			<xsl:text>","","","</xsl:text>
			<xsl:value-of select="agentAddress3" />
			<xsl:text>"</xsl:text>
			<xsl:text>&#10;</xsl:text>
		</xsl:if>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>"Company",</xsl:text>
		<xsl:text>"Client Reference",</xsl:text>
		<xsl:text>"Policy Number",</xsl:text>
		<xsl:text>"Amount Description",</xsl:text>
		<xsl:text>"Account Reference",</xsl:text>
		<xsl:text>"Due Date",</xsl:text>
		<xsl:text>"Amount"</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:apply-templates select="tableEntrySet/REPT__GBIL__Table__Entry" />
		<xsl:text>"","","***GRAND TOTALS","------------","Employee","","</xsl:text>
		<xsl:value-of select="employeeGrandBillTotal" />
		<xsl:text>"</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>"","","","","Employer","","</xsl:text>
		<xsl:value-of select="employerGrandBillTotal" />
		<xsl:text>"</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>"","","","","Client","","</xsl:text>
		<xsl:value-of select="clientGrandBillTotal" />
		<xsl:text>"</xsl:text>
		<xsl:if test="accumSuspenseAmount != 0">
			<xsl:text>&#10;</xsl:text>
			<xsl:text>&#10;</xsl:text>
			<xsl:text>"","","****ADJUSTMENTS","------------",</xsl:text>
			<xsl:choose>
				<xsl:when test="accumSuspenseAmount > 0">
					<xsl:text>"Prior Over","","</xsl:text>
					<xsl:value-of select="accumSuspenseAmount" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:text>"Prior Short","","</xsl:text>
					<xsl:value-of select="format-number(accumSuspenseAmount * -1, '###########0.00')" />
				</xsl:otherwise>
			</xsl:choose>
			<xsl:text>"</xsl:text>
			<xsl:text>&#10;</xsl:text>
			<xsl:text>&#10;</xsl:text>
			<xsl:text>"","","*****AMOUNT DUE","------------","","","</xsl:text>
			<xsl:value-of select="totalAmountDue" />
			<xsl:text>"</xsl:text>
		</xsl:if>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>&#10;</xsl:text>
	</xsl:template>
	<xsl:template match="REPT__GBIL__CommentNote">
		<xsl:text>"</xsl:text>
		<xsl:value-of select="comment" />
		<xsl:text>","","","</xsl:text>
		<xsl:value-of select="note" />
		<xsl:text>"</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:if test="count(following-sibling::REPT__GBIL__CommentNote) = 0">
			<xsl:text>&#10;</xsl:text>
		</xsl:if>
	</xsl:template>
	<xsl:template match="REPT__GBIL__Table__Entry">
		<xsl:text>"</xsl:text>
		<xsl:value-of select="company" />
		<xsl:text>","</xsl:text>
		<xsl:value-of select="clientReference" />
		<xsl:text>","</xsl:text>
		<xsl:value-of select="policy" />
		<xsl:text>",</xsl:text>
		<xsl:apply-templates select="tableSubEntrySet/REPT__GBIL__Table__SubEntry" />
		<xsl:text>"","",</xsl:text>
		<xsl:text>"**TOTALS","------------","Employee","","</xsl:text>
		<xsl:value-of select="employeeBillTotal" />
		<xsl:text>"</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>"","","","","Employer","","</xsl:text>
		<xsl:value-of select="employerBillTotal" />
		<xsl:text>"</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>"","","","","Client","","</xsl:text>
		<xsl:value-of select="clientBillTotal" />
		<xsl:text>"</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>&#10;</xsl:text>
	</xsl:template>
	<xsl:template match="REPT__GBIL__Table__SubEntry">
		<xsl:if test="count(preceding-sibling::REPT__GBIL__Table__SubEntry) > 0">
			<xsl:text>"","","",</xsl:text>
		</xsl:if>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="amountDescription" />
		<xsl:text>","</xsl:text>
		<xsl:value-of select="accountReference" />
		<xsl:text>","</xsl:text>
		<xsl:variable name="dueMonth" select="substring(dueDate, 6, 2)"/>
		<xsl:variable name="dueDay" select="substring(dueDate, 9)"/>
		<xsl:variable name="dueYear" select="substring(dueDate, 1, 4)"/>
		<xsl:variable name="dueDate" select="concat($dueMonth, '-', $dueDay, '-', $dueYear)" />
		<xsl:value-of select="$dueDate" />
		<xsl:text>","</xsl:text>
		<xsl:value-of select="amount" />
		<xsl:text>"</xsl:text>
		<xsl:text>&#10;</xsl:text>
	</xsl:template>
</xsl:stylesheet>
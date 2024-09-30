<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<!-- Support TXRP CSV XSL Transformation Process -->
	<xsl:output method="text" />
	<xsl:variable name="comma" select="','"/>
 	<xsl:template match="/">
    	<xsl:apply-templates select="XML__ReportExtract" />
		<xsl:apply-templates select="XML__ReportExtract/reportExtractSet"/>
  	</xsl:template>
	<xsl:template match="XML__ReportExtract">
		<xsl:text>Company Code: </xsl:text>
		<xsl:value-of select="./companyCode"/>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>Company Name: </xsl:text>
		<xsl:value-of select="./companyName"/>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>Report Description: </xsl:text>
		<xsl:value-of select="./reportDescription"/>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>Report ID: </xsl:text>
		<xsl:value-of select="./reportID"/>
		<xsl:text>&#10;</xsl:text>
		<xsl:variable select="substring(./fromDate, 6, 2)" name="fromMonth"/>
		<xsl:variable select="substring(./fromDate, 9)" name="fromDay"/>
		<xsl:variable select="substring(./fromDate, 1, 4)" name="fromYear"/>
		<xsl:variable select="concat($fromMonth, '-', $fromDay, '-', $fromYear)" name="fromDate"/>
		<xsl:text>From Date: </xsl:text>
		<xsl:value-of select="$fromDate"/>
		<xsl:text>&#10;</xsl:text>
		<xsl:variable select="substring(./thruDate, 6, 2)" name="thruMonth"/>
		<xsl:variable select="substring(./thruDate, 9)" name="thruDay"/>
		<xsl:variable select="substring(./thruDate, 1, 4)" name="thruYear"/>
		<xsl:variable select="concat($thruMonth, '-', $thruDay, '-', $thruYear)" name="thruDate"/>
		<xsl:text>Thru Date: </xsl:text>
		<xsl:value-of select="$thruDate"/>
		<xsl:text>&#10;</xsl:text>
		<xsl:variable select="substring(./reportDate, 6, 2)" name="reportMonth"/>
		<xsl:variable select="substring(./reportDate, 9)" name="reportDay"/>
		<xsl:variable select="substring(./reportDate, 1, 4)" name="reportYear"/>
		<xsl:variable select="concat($reportMonth, '-', $reportDay, '-', $reportYear)" name="reportDate"/>
		<xsl:text>Report Date: </xsl:text>
		<xsl:value-of select="$reportDate"/>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>Report Time: </xsl:text>
		<xsl:value-of select="./reportTime"/>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>Printed By: </xsl:text>
		<xsl:value-of select="./printedBy"/>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>&#10;</xsl:text>
	</xsl:template>
	<xsl:template match="reportExtractSet">
		<xsl:value-of select="$EntryHeader"/>
		<xsl:apply-templates select="com.lidp.model.admin.persistence.REPT__TXRP__Extract"/>
	</xsl:template>
	<xsl:variable name='EntryHeader'>
		<xsl:text>Policy Number</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Coverage</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Sub Coverage</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Company Code</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Segment Type</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Distribution Code</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Tax Year End Date</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Adjust Operator</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Adjust Time</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Adjust Date</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Recorded Withholding State</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Recorded Gross Amount</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Recorded Income Amount</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Recorded Subject Excise Amount </xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Recorded Employee Contribution</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Recorded Federal Withholdings</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Recorded State Withholdings</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Adjust Withholding State</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Adjust Gross Amount</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Adjust Income Amount</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Adjust Subject Excise Amount </xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Adjust Employee Contribution</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Adjust Federal Withholdings</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Adjust State Withholdings</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Reported Withholding State</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Reported Gross Amount</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Reported Income Amount</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Reported Subject Excise Amount</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Reported Employee Contribution</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Reported Federal Withholdings</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Reported State Withholdings</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>ToReport Withholding State</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>ToReport Gross Amount</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>ToReport Income Amount</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>ToReport Subject Excise Amount</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>ToReport Employee Contribution</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>ToReport Federal Withholdings</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>ToReport State Withholdings</xsl:text>
		<xsl:text>&#10;</xsl:text>
	</xsl:variable>

	<xsl:variable name="StateTotalHeader">
		<xsl:text>&#10;</xsl:text>
		<xsl:text>State Totals</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Federal-State Code</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Total Gross Recorded</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>"Total Gross Adjust"</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Total Gross ToReport</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Total Gross Reported</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Total Income Recorded</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Total Income Adjust</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Total Income ToReport</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Total Income Reported</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Total SubjExcise Recorded</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Total SubjExcise Adjust</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Total SubjExcise ToReport</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Total SubjExcise Reported</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Total EmpContribution Recorded</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Total EmpContribution Adjust</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Total EmpContribution ToReport</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Total EmpContribution Reported</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Total FedWithholding Recorded</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Total FedWithholding Adjust</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Total FedWithholding ToReport</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Total FedWithholding Reported</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Total StateWithholding Recorded</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Total StateWithholding Adjust</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Total StateWithholding ToReport</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Total StateWithholding Reported</xsl:text>
		<xsl:text>&#10;</xsl:text>
	</xsl:variable>

	<xsl:variable name="GrandTotalHeader">
		<xsl:text>&#10;</xsl:text>
		<xsl:text>Grand Total</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Total Gross Recorded</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Total Gross Adjust</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Total Gross ToReport</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Total Gross Reported</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Total Income Recorded</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Total Income Adjust</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Total Income ToReport</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Total Income Reported</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Total SubjExcise Recorded</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Total SubjExcise Adjust</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Total SubjExcise ToReport</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Total SubjExcise Reported</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Total EmpContribution Recorded</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Total EmpContribution Adjust</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Total EmpContribution ToReport</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Total EmpContribution Reported</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Total FedWithholding Recorded</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Total FedWithholding Adjust</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Total FedWithholding ToReport</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Total FedWithholding Reported</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Total StateWithholding Recorded</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Total StateWithholding Adjust</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Total StateWithholding ToReport</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Total StateWithholding Reported</xsl:text>
		<xsl:text>&#10;</xsl:text>
	</xsl:variable>

    <xsl:template match="com.lidp.model.admin.persistence.REPT__TXRP__Extract">
		<xsl:apply-templates select="entryList"/>
		<xsl:apply-templates select="txrpTotals"/>
	</xsl:template>
	<xsl:template match="entryList">
		<xsl:apply-templates select="com.lidp.model.admin.persistence.REPT__TXRP__Entry"/>
	</xsl:template>
	<xsl:template match="com.lidp.model.admin.persistence.REPT__TXRP__Entry">
		<xsl:value-of select="./policyNumber"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./coverage"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./subCoverage"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./companyCode"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="segmentType"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./distributionCode"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./taxYearEndDate"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./adjustOperator"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./adjustTime"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./adjustDate"/>
		<xsl:value-of select="$comma"/>
		<xsl:apply-templates select="recorded"/>
		<xsl:apply-templates select="adjust"/>
		<xsl:apply-templates select="reported"/>
		<xsl:apply-templates select="toReport"/>
		<xsl:text>&#10;</xsl:text>
	</xsl:template>
	<xsl:template match="recorded">
		<xsl:value-of select="./withholdingState"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./grossAmount"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./incomeAmount"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./subjExciseAmount"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./empContribution"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./fedWithholding"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./stateWithholding"/>
		<xsl:value-of select="$comma"/>
	</xsl:template>
	<xsl:template match="adjust">
		<xsl:value-of select="./withholdingState"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./grossAmount"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./incomeAmount"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="subjExciseAmount"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="empContribution"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="fedWithholding"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="stateWithholding"/>
		<xsl:value-of select="$comma"/>
	</xsl:template>
	<xsl:template match="reported">
		<xsl:value-of select="./withholdingState"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./grossAmount"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./incomeAmount"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="subjExciseAmount"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="empContribution"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="fedWithholding"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="stateWithholding"/>
		<xsl:value-of select="$comma"/>
	</xsl:template>
	<xsl:template match="toReport">
		<xsl:value-of select="./withholdingState"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./grossAmount"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./incomeAmount"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="subjExciseAmount"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="empContribution"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="fedWithholding"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="stateWithholding"/>
	</xsl:template>

	<xsl:template match="txrpTotals">
		<xsl:value-of select="$StateTotalHeader"/>
		<xsl:apply-templates select="stateTotals/entry"/>
		<xsl:value-of select="$GrandTotalHeader"/>
		<xsl:apply-templates select="grandTotals"/>
	</xsl:template>

	<xsl:template match="stateTotals/entry">
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./string"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./com.lidp.model.admin.persistence.REPT__TXRP__TOTAL__Table/totalGrossRecorded"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./com.lidp.model.admin.persistence.REPT__TXRP__TOTAL__Table/totalGrossAdjust"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./com.lidp.model.admin.persistence.REPT__TXRP__TOTAL__Table/totalGrossToReport"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./com.lidp.model.admin.persistence.REPT__TXRP__TOTAL__Table/totalGrossReported"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./com.lidp.model.admin.persistence.REPT__TXRP__TOTAL__Table/totalIncomeRecorded"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./com.lidp.model.admin.persistence.REPT__TXRP__TOTAL__Table/totalIncomeAdjust"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./com.lidp.model.admin.persistence.REPT__TXRP__TOTAL__Table/totalIncomeToReport"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./com.lidp.model.admin.persistence.REPT__TXRP__TOTAL__Table/totalIncomeReported"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./com.lidp.model.admin.persistence.REPT__TXRP__TOTAL__Table/totalSubjExciseRecorded"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./com.lidp.model.admin.persistence.REPT__TXRP__TOTAL__Table/totalSubjExciseAdjust"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./com.lidp.model.admin.persistence.REPT__TXRP__TOTAL__Table/totalSubjExciseToReport"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./com.lidp.model.admin.persistence.REPT__TXRP__TOTAL__Table/totalSubjExciseReported"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./com.lidp.model.admin.persistence.REPT__TXRP__TOTAL__Table/totalEmpContributionRecorded"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./com.lidp.model.admin.persistence.REPT__TXRP__TOTAL__Table/totalEmpContributionAdjust"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./com.lidp.model.admin.persistence.REPT__TXRP__TOTAL__Table/totalEmpContributionToReport"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./com.lidp.model.admin.persistence.REPT__TXRP__TOTAL__Table/totalEmpContributionReported"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./com.lidp.model.admin.persistence.REPT__TXRP__TOTAL__Table/totalFedWithholdingRecorded"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./com.lidp.model.admin.persistence.REPT__TXRP__TOTAL__Table/totalFedWithholdingAdjust"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./com.lidp.model.admin.persistence.REPT__TXRP__TOTAL__Table/totalFedWithholdingToReport"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./com.lidp.model.admin.persistence.REPT__TXRP__TOTAL__Table/totalFedWithholdingReported"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./com.lidp.model.admin.persistence.REPT__TXRP__TOTAL__Table/totalStateWithholdingRecorded"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./com.lidp.model.admin.persistence.REPT__TXRP__TOTAL__Table/totalStateWithholdingAdjust"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./com.lidp.model.admin.persistence.REPT__TXRP__TOTAL__Table/totalStateWithholdingToReport"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./com.lidp.model.admin.persistence.REPT__TXRP__TOTAL__Table/totalStateWithholdingReported"/>
		<xsl:text>&#10;</xsl:text>
	</xsl:template>

	<xsl:template match="grandTotals">
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./totalGrossRecorded"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./totalGrossAdjust"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./totalGrossToReport"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./totalGrossReported"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./totalIncomeRecorded"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./totalIncomeAdjust"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./totalIncomeToReport"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./totalIncomeReported"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./totalSubjExciseRecorded"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./totalSubjExciseAdjust"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./totalSubjExciseToReport"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./totalSubjExciseReported"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./totalEmpContributionRecorded"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./totalEmpContributionAdjust"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./totalEmpContributionToReport"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./totalEmpContributionReported"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./totalFedWithholdingRecorded"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./totalFedWithholdingAdjust"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./totalFedWithholdingToReport"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./totalFedWithholdingReported"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./totalStateWithholdingRecorded"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./totalStateWithholdingAdjust"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./totalStateWithholdingToReport"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./totalStateWithholdingReported"/>
		<xsl:text>&#10;</xsl:text>
	</xsl:template>
</xsl:stylesheet>
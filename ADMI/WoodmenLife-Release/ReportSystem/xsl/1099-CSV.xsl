<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<!-- Support 1099 CSV XSL Transformation Process -->
	<xsl:output method="text" />
	<xsl:variable name="comma" select="','"/>

	<xsl:variable name="PayerInformation">
		<xsl:text>Record ID</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Company Code</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Payer Tax ID Number</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Payer Name Line 1</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Payer Name Line 2</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Payer Address Line 1</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Payer Address Line 2</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Payer City</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Payer State</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Payer Zip Code</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Payer Phone</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Foreign Entity Indicator</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Payer Name Control</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Combined FS Filer</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Transmitter Control Code</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Transfer Agent Indicator</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Transmitter Name</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Transmitter Name 2</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Transmitter Address</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Transmitter City State Zip Code</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Transmitter TIN</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Company Name Line 1</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Company Name Line 2</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Company Address Line</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Company City</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Company State</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Company Zip Code</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Contact Name</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Contact Phone</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Contact Email</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Phone Number</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Office Code</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Test File Indicator</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Last Filing Indicator</xsl:text>
		<xsl:text>&#10;</xsl:text>
	</xsl:variable>

	<xsl:variable name="PayeeInformation">
		<xsl:text>&#10;</xsl:text>
		<xsl:text>Record ID</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Submission Type</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Tax Payer ID Type</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Foreign Payee Indicator</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Sequence Number</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Tax ID Number</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Account Number</xsl:text>
		<xsl:value-of select="$comma"/>
        <xsl:text>Name Control</xsl:text>
        <xsl:value-of select="$comma"/>
		<xsl:text>Client Situation</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Client Number</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Distribution Code</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Tax Year</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Date Filed</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Recipient Name 1</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Recipient Name 2</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Street Address</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>City</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>State</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Zip Code</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Foreign Address</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Comment</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Fed-State Code</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>IRA SIMP Reporting Indicator</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Taxable Amount Indicator</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Total Distribution Indicator</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Sub Segment Type</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Coverage</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Sub Coverage</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Pension Indicator</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Recorded State</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Locality Name</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Designated Roth Contribution Date</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Gross Distribution</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Taxable Amount</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Capital Gain</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Net Employer Securities</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Employee Contribution</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Total Employee Contribution</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Federal Income Tax Withheld</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>State Income Tax Withheld</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>State Distribution</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Local Income Tax Withheld</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Local Distribution</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Other Amount</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>IRA SEP/SIMPLE/ROTH Amount</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>IRA Rollover</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Other Percentage</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Percent Distribution</xsl:text>
		<xsl:text>&#10;</xsl:text>
	</xsl:variable>

	<xsl:variable name="TotalsInformation">
		<xsl:text>&#10;</xsl:text>
		<xsl:text>Record ID</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Total Gross Distribution</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Total Taxable Amount</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Total Capital Gain</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Total Federal Income Tax Withheld</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Total State Income Tax Withheld</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Total Local Tax Withheld</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Total Employee Contribution</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Total Employee Contribution Total</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Total Net Employer Securities</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Total Other Amount</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Total IRA SEP/SIMP Distribution</xsl:text>
		<xsl:text>&#10;</xsl:text>
	</xsl:variable>

	<xsl:variable name="StateTotals">
		<xsl:text>&#10;</xsl:text>
		<xsl:text>Record ID</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Fed-State Code</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Total Gross Distribution</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Total Taxable Amount</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Total Capital Gain</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Total Federal Income Tax Withheld</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Total State Income Tax Withheld</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Total Local Income Tax Withheld</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Total Employee Contribution</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Total Employee Contribution Total</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Total Net Employer Securities</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Total Other Amount</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Total IRA SEP/SIMP Distribution</xsl:text>
		<xsl:text>&#10;</xsl:text>
	</xsl:variable>

	<xsl:variable name="EndRecord">
		<xsl:text>&#10;</xsl:text>
		<xsl:text>Record ID</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Fed-State Code</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Number Of Occurrences</xsl:text>
		<xsl:value-of select="./int"/>
		<xsl:text>&#10;</xsl:text>
	</xsl:variable>

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
	<xsl:apply-templates select="com.lidp.model.admin.persistence.REPT__1099__Extract"/>
	</xsl:template>

    <xsl:template match="com.lidp.model.admin.persistence.REPT__1099__Extract">
		<xsl:value-of select="$PayerInformation"/>
		<xsl:text>A</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./payerInformation/companyCode"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./payerInformation/payerTaxIdNumb"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./payerInformation/payerNameLine1"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./payerInformation/payerNameLine2"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./payerInformation/payerAddrLine1"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./payerInformation/payerAddrLine2"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./payerInformation/payerCity"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./payerInformation/payerState"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./payerInformation/payerZip"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./payerInformation/payerPhone"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./payerInformation/foreignCorpInd"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./payerInformation/payerNameControl"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./payerInformation/combinedFsFiler"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./payerInformation/xmitterCntrlCode"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./payerInformation/transferAgentInd"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./payerInformation/xmitterName"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./payerInformation/xmitterName2"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./payerInformation/xmitterAddr"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./payerInformation/xmitterCityStZip"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./payerInformation/xmitterTin"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./payerInformation/cmpyNameLine1"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./payerInformation/cmpyNameLine2"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./payerInformation/cmpyAddrLine"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./payerInformation/cmpyCity"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./payerInformation/cmpyState"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./payerInformation/cmpyZip"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./payerInformation/contactName"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./payerInformation/contactPhone"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./payerInformation/contactEmail"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./payerInformation/phoneNumber"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./payerInformation/officeCode"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./payerInformation/testFileIndicator"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./payerInformation/lastFilingIndicator"/>
		<xsl:value-of select="$comma"/>
		<xsl:text>&#10;</xsl:text>
		<xsl:value-of select="$PayeeInformation"/>
		<xsl:apply-templates select="taxEntries"/>
		<xsl:value-of select="$TotalsInformation"/>
		<xsl:apply-templates select="rTotals"/>
		<xsl:value-of select="$StateTotals"/>
		<xsl:apply-templates select="fedStateTotals/entry"/>
		<xsl:value-of select="$EndRecord"/>
		<xsl:apply-templates select="fedStateCounter/entry"/>
	</xsl:template>
	<xsl:template match="taxEntries">
		<xsl:apply-templates select="com.lidp.model.admin.persistence.REPT__1099R__Entry"/>
	</xsl:template>
	<xsl:template match="com.lidp.model.admin.persistence.REPT__1099R__Entry">
		<xsl:text>B</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./submissionType"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./taxPayerIDType"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./foreignPayee"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./sequenceNumber"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./taxIDNumber"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./accountNumber"/>
		<xsl:value-of select="$comma"/>
        <xsl:value-of select="./nameControl"/>
        <xsl:value-of select="$comma"/>
        <xsl:value-of select="./clientSituation"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./clientNumber"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./distributionCode"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./taxYear"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./dateFiled"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./recipientName__1"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./recipientName__2"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./streetAddress"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./city"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./state"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./zipcode"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./foreignAddress"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./comment"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./fedStateCode"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./iraSimpReportingInd"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./taxableAmountInd"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./totalDistributionInd"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./subSegmentType"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./coverage"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./subCoverage"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./pensionIndicator"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./recordedState"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./localityName"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./designatedRothContributionDate"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./grossDistribution"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./taxableAmount"/>
		<xsl:value-of select="$comma"/>
        <xsl:value-of select="./capitalGain"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./netEmployerSecurities"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./employeeContribution"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./totalEmployeeContribution"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./federalIncomeTaxWithheld"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./stateIncomeTaxWithheld"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./stateDistribution"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./localIncomeTaxWithheld"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./localDistribution"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./otherAmount"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./iraSepSimpleRothAmount"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./iraRollover"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./otherPercentage"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./percentDistribution"/>
		<xsl:text>&#10;</xsl:text>
	</xsl:template>
	<xsl:template match="rTotals">
		<xsl:text>C</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./totalGrossDistribution"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./totalTaxableAmount"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./totalCapitalGain"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./totalFederalTaxWithheld"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./totalStateIncomeTaxWithheld"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./totalLocalIncomeTaxWithheld"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./totalEmployeeContribution"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./totalEmployeeContributionsTotal"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./totalNetEmployerSecurities"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./totalOtherAmount"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./totalIraSepSimpDistribution"/>
		<xsl:text>&#10;</xsl:text>
	</xsl:template>
	<xsl:template match="fedStateTotals/entry">
		<xsl:text>K</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./string"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./com.lidp.model.admin.persistence.REPT__1099__Extract_-REPT__1099R__TOTALS/totalGrossDistribution"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./com.lidp.model.admin.persistence.REPT__1099__Extract_-REPT__1099R__TOTALS/totalTaxableAmount"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./com.lidp.model.admin.persistence.REPT__1099__Extract_-REPT__1099R__TOTALS/totalCapitalGain"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./com.lidp.model.admin.persistence.REPT__1099__Extract_-REPT__1099R__TOTALS/totalFederalTaxWithheld"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./com.lidp.model.admin.persistence.REPT__1099__Extract_-REPT__1099R__TOTALS/totalStateIncomeTaxWithheld"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./com.lidp.model.admin.persistence.REPT__1099__Extract_-REPT__1099R__TOTALS/totalLocalIncomeTaxWithheld"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./com.lidp.model.admin.persistence.REPT__1099__Extract_-REPT__1099R__TOTALS/totalEmployeeContribution"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./com.lidp.model.admin.persistence.REPT__1099__Extract_-REPT__1099R__TOTALS/totalEmployeeContributionsTotal"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./com.lidp.model.admin.persistence.REPT__1099__Extract_-REPT__1099R__TOTALS/totalNetEmployerSecurities"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./com.lidp.model.admin.persistence.REPT__1099__Extract_-REPT__1099R__TOTALS/totalOtherAmount"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./com.lidp.model.admin.persistence.REPT__1099__Extract_-REPT__1099R__TOTALS/totalIraSepSimpDistribution"/>
		<xsl:text>&#10;</xsl:text>
	</xsl:template>
	<xsl:template match="fedStateCounter/entry">
		<xsl:text>F</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./string"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./int"/>
		<xsl:text>&#10;</xsl:text>
	</xsl:template>

	</xsl:stylesheet>
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<!-- Support TXFM CSV XSL Transformation Process -->
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
		<xsl:apply-templates select="com.lidp.model.admin.persistence.REPT__TXXX__Extract"/>
	</xsl:template>
	<xsl:variable name="TransmitterInfo">
		<xsl:text>Record ID</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Payment Year</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Prior Year Indicator </xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Transmitter TIN</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Transmitter Control Code</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Test File Indicator</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Foreign Entity Indicator</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Transmitter Name</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Transmitter Name 2 </xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Company Name Line 1</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Company Name Line 2</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Transmitter Address </xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Company City</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Company State </xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Company Zip Code </xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Number Of Payees </xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Contact Name</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Contact Phone</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Contact Email</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Sequence Number</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Vendor Indicator</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Vendor Name</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Vendor Mailing Address</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Vendor City</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Vendor State</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Vendor Zip Code</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Vendor Contact Name</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Vendor Contact Telephone</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Vendor Foreign Entity Indicator</xsl:text>
		<xsl:text>&#10;</xsl:text>
	</xsl:variable>

	<xsl:variable name="PayerInformation">
		<xsl:text>&#10;</xsl:text>
		<xsl:text>Record ID</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Payment Year</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Combined FS Filer</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Payer Tax ID Number</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Payer Name Control</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Last Filing Indicator</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Type Of Return</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Amount Codes</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Foreign Entity Indicator</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Payer Name Line 1</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Payer Name Line 2</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Transfer Agent Indicator</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Payer Street Address</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Payer City</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Payer State</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Payer Zip Code</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Payer Phone </xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Sequence Number</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>&#10;</xsl:text>
	</xsl:variable>

	<xsl:variable name="PayeeInformation">
		<xsl:text>&#10;</xsl:text>
		<xsl:text>Record ID</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Tax Year</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Submission Type</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Name Control</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Type Of TIN</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Payee ID</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Account Number</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Payer Office Code</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Amount Code 1</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Amount Code 2</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Amount Code 3</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Amount Code 4</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Amount Code 5</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Amount Code 6</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Amount Code 7</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Amount Code 8</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Amount Code 9 </xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Amount Code A</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Amount Code B</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Amount Code C</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Amount Code D</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Amount Code E</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Amount Code F</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Amount Code G</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Foreign Country Indicator</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Recipient Name 1 </xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Recipient Name 2</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Recipient Street Address</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>City</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>State</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Zip Code</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Sequence Number</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Distribution Code</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Taxable Amount Indicator</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>IRA/SEP/SIMPLE Indicator</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Total Distribution Indicator</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Percent Distribution</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>First Designated Roth Year</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Fatca Filing Indicator</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Designated Roth Contribution Date</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Special Data Entries</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>State Income Tax Withheld</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Local Income Tax Withheld</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Fed State Code</xsl:text>
		<xsl:text>&#10;</xsl:text>
	</xsl:variable>

	<xsl:variable name="TotalsInformation">
		<xsl:text>&#10;</xsl:text>
		<xsl:text>Record ID</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Number Of Payees</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Control Total 1</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Control Total 2</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Control Total 3</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Control Total 4</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Control Total 5</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Control Total 6</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Control Total 7</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Control Total 8</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Control Total 9 </xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Control Total A</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Control Total B</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Control Total C</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Control Total D</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Control Total E</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Control Total F</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Control Total G</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Sequence Number</xsl:text>
		<xsl:text>&#10;</xsl:text>
	</xsl:variable>

	<xsl:variable name="StateTotals">
		<xsl:text>&#10;</xsl:text>
		<xsl:text>Record ID</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Number Of Payees</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Control Total 1</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Control Total 2</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Control Total 3</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Control Total 4</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Control Total 5</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Control Total 6</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Control Total 7</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Control Total 8</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Control Total 9 </xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Control Total A</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Control Total B</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Control Total C</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Control Total D</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Control Total E</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Control Total F</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Control Total G</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Sequence Number</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>State Income Tax Withheld Total</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Local Income Tax Withheld Total</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Fed-State Code</xsl:text>
		<xsl:text>&#10;</xsl:text>
	</xsl:variable>

	<xsl:variable name="EndRecord">
		<xsl:text>&#10;</xsl:text>
		<xsl:text>Record ID</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Number Of A Records</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Number Of Payees</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:text>Sequence Number</xsl:text>
		<xsl:text>&#10;</xsl:text>
	</xsl:variable>

    <xsl:template match="com.lidp.model.admin.persistence.REPT__TXXX__Extract">
        <xsl:value-of select="$TransmitterInfo"/>
		<xsl:text>T</xsl:text>
		<xsl:value-of select="$comma"/>
        <xsl:value-of select="./irstRecord/paymentYear"/>
		<xsl:value-of select="$comma"/>
        <xsl:value-of select="./irstRecord/priorYearIndicator"/>
		<xsl:value-of select="$comma"/>
        <xsl:value-of select="./irstRecord/xmitterTin"/>
		<xsl:value-of select="$comma"/>
        <xsl:value-of select="./irstRecord/xmitterCntrlCode"/>
		<xsl:value-of select="$comma"/>
        <xsl:value-of select="./irstRecord/testFileIndicator"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./irstRecord/foreignCorpInd"/>
		<xsl:value-of select="$comma"/>
        <xsl:value-of select="./irstRecord/xmitterName"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./irstRecord/xmitterName2"/>
		<xsl:value-of select="$comma"/>
        <xsl:value-of select="./irstRecord/cmpyNameLine1"/>
		<xsl:value-of select="$comma"/>
        <xsl:value-of select="./irstRecord/cmpyNameLine2"/>
		<xsl:value-of select="$comma"/>
        <xsl:value-of select="./irstRecord/xmitterAddr"/>
		<xsl:value-of select="$comma"/>
        <xsl:value-of select="./irstRecord/cmpyCity"/>
		<xsl:value-of select="$comma"/>
        <xsl:value-of select="./irstRecord/cmpyState"/>
		<xsl:value-of select="$comma"/>
        <xsl:value-of select="./irstRecord/cmpyZip"/>
		<xsl:value-of select="$comma"/>
        <xsl:value-of select="./irstRecord/numberOfPayeesTRecord"/>
		<xsl:value-of select="$comma"/>
        <xsl:value-of select="./irstRecord/contactName"/>
		<xsl:value-of select="$comma"/>
        <xsl:value-of select="./irstRecord/contactPhone"/>
		<xsl:value-of select="$comma"/>
        <xsl:value-of select="./irstRecord/contactEmail"/>
		<xsl:value-of select="$comma"/>
        <xsl:value-of select="./irstRecord/sequenceNumber"/>
		<xsl:value-of select="$comma"/>
        <xsl:value-of select="./irstRecord/vendorIndicator"/>
		<xsl:value-of select="$comma"/>
        <xsl:value-of select="./irstRecord/vendorName"/>
		<xsl:value-of select="$comma"/>
        <xsl:value-of select="./irstRecord/vendorMailingAddress"/>
		<xsl:value-of select="$comma"/>
        <xsl:value-of select="./irstRecord/vendorCity"/>
		<xsl:value-of select="$comma"/>
        <xsl:value-of select="./irstRecord/vendorState"/>
		<xsl:value-of select="$comma"/>
        <xsl:value-of select="./irstRecord/vendorZipCode"/>
		<xsl:value-of select="$comma"/>
        <xsl:value-of select="./irstRecord/vendorContactName"/>
		<xsl:value-of select="$comma"/>
        <xsl:value-of select="./irstRecord/vendorContactTelephoneExt"/>
		<xsl:value-of select="$comma"/>
        <xsl:value-of select="./irstRecord/vendorForeignEntityIndicator"/>
        <xsl:text>&#10;</xsl:text>
		<xsl:value-of select="$PayerInformation"/>
		<xsl:text>A</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./irsaRecord/paymentYear"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./irsaRecord/combinedFSFiler"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./irsaRecord/payerTaxIdNumb"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./irsaRecord/payerNameControl"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./irsaRecord/lastFilingIndicator"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./irsaRecord/typeOfReturn"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./irsaRecord/amountCodes"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./irsaRecord/foreignEntityIndicator"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./irsaRecord/payerNameLine1"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./irsaRecord/payerNameLine2"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./irsaRecord/transferAgentIndicator"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./irsaRecord/payerStreetAddress"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./irsaRecord/payerCity"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./irsaRecord/payerState"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./irsaRecord/payerZip"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./irsaRecord/payerPhone"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./irsaRecord/sequenceNumber"/>
		<xsl:value-of select="$comma"/>
		<xsl:text>&#10;</xsl:text>
		<xsl:value-of select="$PayeeInformation"/>
        <xsl:apply-templates select="txxxEntries"/>
		<xsl:value-of select="$TotalsInformation"/>
		<xsl:apply-templates select="irscRecord"/>
		<xsl:value-of select="$StateTotals"/>
		<xsl:apply-templates select="irskRecords"/>
		<xsl:value-of select="$EndRecord"/>
		<xsl:apply-templates select="irsfRecord"/>
	</xsl:template>
	<xsl:template match="txxxEntries">
		<xsl:apply-templates select="com.lidp.model.admin.persistence.REPT__TXFM__Entry"/>
	</xsl:template>
	<xsl:template match="com.lidp.model.admin.persistence.REPT__TXFM__Entry">
		<xsl:text>B</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./taxYear"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./submissionType"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./nameControl"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./typeOfTin"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./payeeID"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./accountNumber"/>
		<xsl:value-of select="$comma"/>
        <xsl:value-of select="./payerOfficeCode"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./amountCode__1"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./amountCode__2"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./amountCode__3"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./amountCode__4"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./amountCode__5"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./amountCode__6"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./amountCode__7"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./amountCode__8"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./amountCode__9"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./amountCode__A"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./amountCode__B"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./amountCode__C"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./amountCode__D"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./amountCode__E"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./amountCode__F"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./amountCode__G"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./amountCode__H"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./amountCode__J"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./foreignCountryIndicator"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./recipientName__1"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./recipientName__2"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./recipientStreetAddress"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./city"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./state"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./zipcode"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./sequenceNumber"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./distributionCode"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./taxableAmountIndicator"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./iraSepSimpleIndicator"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./totalDistributionIndicator"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./percentDistribution"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./firstDesignatedRothYear"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./fatcaFilingIndicator"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./designatedRothContributionDate"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./specialDataEntries"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./stateIncomeTaxWithheld"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./localIncomeTaxWithheld"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./combinedFedStateCode"/>
		<xsl:text>&#10;</xsl:text>
	</xsl:template>
	<xsl:template match="irscRecord">
		<xsl:text>C</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./numberOfPayeesCRecord"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./controlTotal__1"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./controlTotal__2"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./controlTotal__3"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./controlTotal__4"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./controlTotal__5"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./controlTotal__6"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./controlTotal__7"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./controlTotal__8"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./controlTotal__9"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./controlTotal__A"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./controlTotal__B"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./controlTotal__C"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./controlTotal__D"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./controlTotal__E"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./controlTotal__F"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./controlTotal__G"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./sequenceNumber"/>
		<xsl:text>&#10;</xsl:text>
	</xsl:template>
		<xsl:template match="irskRecords">
		<xsl:apply-templates select="com.lidp.model.admin.persistence.REPT__TXXX__Extract_-IRSKRecord"/>
	</xsl:template>
	<xsl:template match="com.lidp.model.admin.persistence.REPT__TXXX__Extract_-IRSKRecord">
		<xsl:text>K</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./numberOfPayeesK"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./controlTotal__1"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./controlTotal__2"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./controlTotal__3"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./controlTotal__4"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./controlTotal__5"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./controlTotal__6"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./controlTotal__7"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./controlTotal__8"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./controlTotal__9"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./controlTotal__A"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./controlTotal__B"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./controlTotal__C"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./controlTotal__D"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./controlTotal__E"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./controlTotal__F"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./controlTotal__G"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./sequenceNumber"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./stateIncomeTaxWithheldTotal"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./localIncomeTaxWithheldTotal"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./fedStateCode"/>
		<xsl:text>&#10;</xsl:text>
	</xsl:template>
	<xsl:template match="irsfRecord">
		<xsl:text>F</xsl:text>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./numberOfARecords"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./numberOfPayeesF"/>
		<xsl:value-of select="$comma"/>
		<xsl:value-of select="./sequenceNumber"/>
		<xsl:text>&#10;</xsl:text>
	</xsl:template>
	
	</xsl:stylesheet>
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:output method="text" />
	<xsl:variable name="blank1" select="' '"/>
	<xsl:variable name="blank2" select="'  '"/>
	<xsl:variable name="blank5" select="'     '"/>
	<xsl:variable name="blank10" select="concat($blank5,$blank5)"/>
	<xsl:variable name="blank15" select="concat($blank5,$blank5,$blank5)"/>
	<xsl:variable name="blank30" select="concat($blank15,$blank15)"/>
	<xsl:variable name="blank91" select="concat($blank30,$blank30,$blank30, ' ')"/>
	<xsl:variable name="blank100" select="concat($blank30,$blank30,$blank30,$blank10)"/>
	<!-- Support TXFM IRS 1220 Format CSV XSL Transformation Process -->
 	<xsl:template match="/">
    	<xsl:apply-templates select="XML__ReportExtract" />
		<xsl:apply-templates select="XML__ReportExtract/reportExtractSet"/>
  	</xsl:template>
	<xsl:template match="XML__ReportExtract">
	</xsl:template>
	<xsl:template match="reportExtractSet">
		<xsl:apply-templates select="com.lidp.model.admin.persistence.REPT__TXXX__Extract"/>
	</xsl:template>
    <xsl:template match="com.lidp.model.admin.persistence.REPT__TXXX__Extract">
        <xsl:text>T</xsl:text>
        <xsl:value-of select="./irstRecord/paymentYear"/>
        <xsl:value-of select="./irstRecord/priorYearIndicator"/>
        <xsl:value-of select="./irstRecord/xmitterTin"/>
        <xsl:value-of select="./irstRecord/xmitterCntrlCode"/>
        <xsl:value-of select="concat($blank5,$blank2)"/>
        <xsl:value-of select="./irstRecord/testFileIndicator"/>
		<xsl:value-of select="./irstRecord/foreignCorpInd"/>
        <xsl:value-of select="./irstRecord/xmitterName"/>
		<xsl:value-of select="./irstRecord/xmitterName2"/>
        <xsl:value-of select="./irstRecord/cmpyNameLine1"/>
        <xsl:value-of select="./irstRecord/cmpyNameLine2"/>
        <xsl:value-of select="./irstRecord/xmitterAddr"/>
        <xsl:value-of select="./irstRecord/cmpyCity"/>
        <xsl:value-of select="./irstRecord/cmpyState"/>
        <xsl:value-of select="./irstRecord/cmpyZip"/>
        <xsl:value-of select="$blank15"/>
        <xsl:value-of select="./irstRecord/numberOfPayeesTRecord"/>
        <xsl:value-of select="./irstRecord/contactName"/>
        <xsl:value-of select="./irstRecord/contactPhone"/>
        <xsl:value-of select="./irstRecord/contactEmail"/>
        <xsl:value-of select="$blank91"/>
        <xsl:value-of select="./irstRecord/sequenceNumber"/>
        <xsl:value-of select="$blank10"/>
        <xsl:value-of select="./irstRecord/vendorIndicator"/>
        <xsl:value-of select="./irstRecord/vendorName"/>
        <xsl:value-of select="./irstRecord/vendorMailingAddress"/>
        <xsl:value-of select="./irstRecord/vendorCity"/>
        <xsl:value-of select="./irstRecord/vendorState"/>
        <xsl:value-of select="./irstRecord/vendorZipCode"/>
        <xsl:value-of select="./irstRecord/vendorContactName"/>
        <xsl:value-of select="./irstRecord/vendorContactTelephoneExt"/>
        <xsl:value-of select="concat($blank15,$blank15,$blank5)"/>
        <xsl:value-of select="./irstRecord/vendorForeignEntityIndicator"/>
        <xsl:value-of select="concat($blank5,$blank2,$blank1)"/>
        <xsl:text>&#10;</xsl:text>
		<xsl:text>A</xsl:text>
		<xsl:value-of select="./irsaRecord/paymentYear"/>
		<xsl:value-of select="./irsaRecord/combinedFSFiler"/>
		<xsl:value-of select="$blank5"/>
		<xsl:value-of select="./irsaRecord/payerTaxIdNumb"/>
		<xsl:value-of select="./irsaRecord/payerNameControl"/>
		<xsl:value-of select="./irsaRecord/lastFilingIndicator"/>
		<xsl:value-of select="./irsaRecord/typeOfReturn"/>
		<xsl:value-of select="./irsaRecord/amountCodes"/>
		<xsl:value-of select="concat($blank5,$blank2,$blank1)"/>
		<xsl:value-of select="./irsaRecord/foreignEntityIndicator"/>
		<xsl:value-of select="./irsaRecord/payerNameLine1"/>
		<xsl:value-of select="./irsaRecord/payerNameLine2"/>
		<xsl:value-of select="./irsaRecord/transferAgentIndicator"/>
		<xsl:value-of select="./irsaRecord/payerStreetAddress"/>
		<xsl:value-of select="./irsaRecord/payerCity"/>
		<xsl:value-of select="./irsaRecord/payerState"/>
		<xsl:value-of select="./irsaRecord/payerZip"/>
		<xsl:value-of select="./irsaRecord/payerPhone"/>
		<xsl:value-of select="concat($blank100,$blank100,$blank30,$blank30)"/>
		<xsl:value-of select="./irsaRecord/sequenceNumber"/>
		<xsl:value-of select="concat($blank100,$blank100,$blank30,$blank10,$blank1)"/>
		<xsl:text>&#10;</xsl:text>
        <xsl:apply-templates select="txxxEntries"/>
		<xsl:apply-templates select="irscRecord"/>
		<xsl:apply-templates select="irskRecords"/>
		<xsl:apply-templates select="irsfRecord"/>
	</xsl:template>
	<xsl:template match="txxxEntries">
		<xsl:apply-templates select="com.lidp.model.admin.persistence.REPT__TXFM__Entry"/>
	</xsl:template>
	<xsl:template match="com.lidp.model.admin.persistence.REPT__TXFM__Entry">
        <xsl:variable name="blank45-54" select="$blank10"/>
        <xsl:variable name="blank271-286" select="concat($blank10,$blank5,$blank1)"/>
        <xsl:variable name="blank499" select="$blank1"/>
        <xsl:variable name="blank408-447" select="concat($blank30, $blank10)"/>
        <xsl:variable name="blank508-543" select="concat($blank30,$blank5,$blank1)"/>
		<xsl:value-of select="./recordType"/>
		<xsl:value-of select="./taxYear"/>
		<xsl:value-of select="./submissionType"/>
		<xsl:value-of select="./nameControl"/>
		<xsl:value-of select="./typeOfTin"/>
		<xsl:value-of select="./payeeID"/>
		<xsl:value-of select="./accountNumber"/>
        <xsl:value-of select="./payerOfficeCode"/>
        <xsl:value-of select="$blank45-54"/>
		<xsl:value-of select="./amountCode__1"/>
		<xsl:value-of select="./amountCode__2"/>
		<xsl:value-of select="./amountCode__3"/>
		<xsl:value-of select="./amountCode__4"/>
		<xsl:value-of select="./amountCode__5"/>
		<xsl:value-of select="./amountCode__6"/>
		<xsl:value-of select="./amountCode__7"/>
		<xsl:value-of select="./amountCode__8"/>
		<xsl:value-of select="./amountCode__9"/>
		<xsl:value-of select="./amountCode__A"/>
		<xsl:value-of select="./amountCode__B"/>
		<xsl:value-of select="./amountCode__C"/>
		<xsl:value-of select="./amountCode__D"/>
		<xsl:value-of select="./amountCode__E"/>
		<xsl:value-of select="./amountCode__F"/>
		<xsl:value-of select="./amountCode__G"/>
		<xsl:value-of select="./amountCode__H"/>
		<xsl:value-of select="./amountCode__J"/>
		<xsl:value-of select="$blank271-286"/>
		<xsl:value-of select="./foreignCountryIndicator"/>
		<xsl:value-of select="./recipientName__1"/>
		<xsl:value-of select="./recipientName__2"/>
		<xsl:value-of select="./recipientStreetAddress"/>
        <xsl:value-of select="$blank408-447"/>
		<xsl:value-of select="./city"/>
		<xsl:value-of select="./state"/>
		<xsl:value-of select="./zipcode"/>
        <xsl:value-of select="$blank499"/>
		<xsl:value-of select="./sequenceNumber"/>
        <xsl:value-of select="$blank508-543"/>
		<xsl:value-of select="$blank1"/>
		<xsl:value-of select="./distributionCode"/>
		<xsl:value-of select="./taxableAmountIndicator"/>
		<xsl:value-of select="./iraSepSimpleIndicator"/>
		<xsl:value-of select="./totalDistributionIndicator"/>
		<xsl:value-of select="./percentDistribution"/>
		<xsl:value-of select="./firstDesignatedRothYear"/>
		<xsl:value-of select="./fatcaFilingIndicator"/>
		<xsl:value-of select="./designatedRothContributionDate"/>
		<xsl:value-of select="concat($blank30,$blank30,$blank30,$blank5,$blank2,$blank1)"/>
		<xsl:value-of select="./specialDataEntries"/>
		<xsl:value-of select="./stateIncomeTaxWithheld"/>
		<xsl:value-of select="./localIncomeTaxWithheld"/>
		<xsl:value-of select="./combinedFedStateCode"/>
		<xsl:text>&#10;</xsl:text>
	</xsl:template>
	<xsl:template match="irscRecord">
		<xsl:text>C</xsl:text>
		<xsl:value-of select="./numberOfPayeesCRecord"/>
		<xsl:value-of select="concat($blank5,$blank1)"/>
		<xsl:value-of select="./controlTotal__1"/>
		<xsl:value-of select="./controlTotal__2"/>
		<xsl:value-of select="./controlTotal__3"/>
		<xsl:value-of select="./controlTotal__4"/>
		<xsl:value-of select="./controlTotal__5"/>
		<xsl:value-of select="./controlTotal__6"/>
		<xsl:value-of select="./controlTotal__7"/>
		<xsl:value-of select="./controlTotal__8"/>
		<xsl:value-of select="./controlTotal__9"/>
		<xsl:value-of select="./controlTotal__A"/>
		<xsl:value-of select="./controlTotal__B"/>
		<xsl:value-of select="./controlTotal__C"/>
		<xsl:value-of select="./controlTotal__D"/>
		<xsl:value-of select="./controlTotal__E"/>
		<xsl:value-of select="./controlTotal__F"/>
		<xsl:value-of select="./controlTotal__G"/>
		<xsl:value-of select="concat($blank100,$blank91,$blank5)"/>
		<xsl:value-of select="./sequenceNumber"/>
		<xsl:value-of select="concat($blank100,$blank100,$blank30,$blank10,$blank1)"/>
		<xsl:text>&#10;</xsl:text>
	</xsl:template>
		<xsl:template match="irskRecords">
		<xsl:apply-templates select="com.lidp.model.admin.persistence.REPT__TXXX__Extract_-IRSKRecord"/>
	</xsl:template>
	<xsl:template match="com.lidp.model.admin.persistence.REPT__TXXX__Extract_-IRSKRecord">
		<xsl:value-of select="./recordType"/>
		<xsl:value-of select="./numberOfPayeesK"/>
		<xsl:value-of select="concat($blank5,$blank1)"/>
		<xsl:value-of select="./controlTotal__1"/>
		<xsl:value-of select="./controlTotal__2"/>
		<xsl:value-of select="./controlTotal__3"/>
		<xsl:value-of select="./controlTotal__4"/>
		<xsl:value-of select="./controlTotal__5"/>
		<xsl:value-of select="./controlTotal__6"/>
		<xsl:value-of select="./controlTotal__7"/>
		<xsl:value-of select="./controlTotal__8"/>
		<xsl:value-of select="./controlTotal__9"/>
		<xsl:value-of select="./controlTotal__A"/>
		<xsl:value-of select="./controlTotal__B"/>
		<xsl:value-of select="./controlTotal__C"/>
		<xsl:value-of select="./controlTotal__D"/>
		<xsl:value-of select="./controlTotal__E"/>
		<xsl:value-of select="./controlTotal__F"/>
		<xsl:value-of select="./controlTotal__G"/>
		<xsl:value-of select="concat($blank100,$blank91,$blank5)"/>
		<xsl:value-of select="./sequenceNumber"/>
		<xsl:value-of select="concat($blank100,$blank91,$blank5,$blank2,$blank1)"/>
		<xsl:value-of select="./stateIncomeTaxWithheldTotal"/>
		<xsl:value-of select="./localIncomeTaxWithheldTotal"/>
		<xsl:value-of select="concat($blank2,$blank2)"/>
		<xsl:value-of select="./fedStateCode"/>
		<xsl:text>&#10;</xsl:text>
	</xsl:template>
	<xsl:template match="irsfRecord">
		<xsl:variable name="zeros" select="'0000000000'"/>
		<xsl:value-of select="./recordType"/>
		<xsl:value-of select="./numberOfARecords"/>
		<xsl:value-of select="concat($zeros,$zeros,'0')"/>
		<xsl:value-of select="concat($blank15,$blank2,$blank2)"/>
		<xsl:value-of select="./numberOfPayeesF"/>
		<xsl:value-of select="concat($blank100,$blank100,$blank100,$blank100,$blank30,$blank10,$blank2)"/>
		<xsl:value-of select="./sequenceNumber"/>
		<xsl:value-of select="concat($blank100,$blank100,$blank30,$blank10,$blank1)"/>
		<xsl:text>&#10;</xsl:text>
	</xsl:template>
	
	</xsl:stylesheet>
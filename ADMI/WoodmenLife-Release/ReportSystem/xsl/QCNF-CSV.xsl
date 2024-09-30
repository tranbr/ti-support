<?xml version="1.0" encoding="UTF-8"?>
<?mso-application progid="Excel.Sheet"?>

<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:output method="text" />	
	<!-- Support QCNF CSV XSL Transformation Process -->
 	<xsl:template match="/">
    	<xsl:apply-templates select="XML__ReportExtract"/>
    	<xsl:apply-templates select="XML__ReportExtract/reportExtractSet"/>
  	</xsl:template>
	<xsl:template match="XML__ReportExtract">  
	    <xsl:text>"Company Code:" </xsl:text><xsl:value-of select="./companyCode" /><xsl:text>,</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>"Company Name:" </xsl:text><xsl:text>"</xsl:text><xsl:value-of select="./companyName" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>"Report Description: " </xsl:text><xsl:text>"</xsl:text><xsl:value-of select="./reportDescription" /><xsl:text>,</xsl:text><xsl:text>"</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>"Report ID:" </xsl:text><xsl:value-of select="./reportID" /><xsl:text>,</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:variable name="fromMonth" select="substring(./fromDate, 6, 2)"/>
		<xsl:variable name="fromDay" select="substring(./fromDate, 9)"/>
		<xsl:variable name="fromYear" select="substring(./fromDate, 1, 4)"/>
		<xsl:variable name="fromDate" select="concat($fromMonth, '-', $fromDay, '-', $fromYear)" />
		<xsl:text>"From Date:" </xsl:text><xsl:value-of select="$fromDate" /><xsl:text>,</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:variable name="thruMonth" select="substring(./thruDate, 6, 2)"/>
		<xsl:variable name="thruDay" select="substring(./thruDate, 9)"/>
		<xsl:variable name="thruYear" select="substring(./thruDate, 1, 4)"/>
		<xsl:variable name="thruDate" select="concat($thruMonth, '-', $thruDay, '-', $thruYear)" />
		<xsl:text>"Thru Date:" </xsl:text><xsl:value-of select="$thruDate" /><xsl:text>,</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:variable name="reportMonth" select="substring(./reportDate, 6, 2)"/>
		<xsl:variable name="reportDay" select="substring(./reportDate, 9)"/>
		<xsl:variable name="reportYear" select="substring(./reportDate, 1, 4)"/>
		<xsl:variable name="reportDate" select="concat($reportMonth, '-', $reportDay, '-', $reportYear)" />
		<xsl:text>"Report Date:" </xsl:text><xsl:value-of select="$reportDate" /><xsl:text>,</xsl:text>
		<xsl:text>&#10;</xsl:text>
	    <xsl:text>"Report Time:" </xsl:text><xsl:value-of select="./reportTime" /><xsl:text>,</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>"Printed By:" </xsl:text><xsl:value-of select="./printedBy" /><xsl:text>,</xsl:text>	
		<xsl:text>&#10;</xsl:text>	
		<xsl:text>&#10;</xsl:text>
	</xsl:template>
	<xsl:template match="reportExtractSet">
		<xsl:text>"QCNF__REPORT__AREA"</xsl:text>
		<xsl:text>,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,</xsl:text>
		<xsl:text>"__QCNF__0101__FUND__ENTRYSet"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>,,,,</xsl:text>
		<xsl:text>__QCNF__CVSG__FUND__ENTRYSet</xsl:text>
		<xsl:text>,,</xsl:text>
		<xsl:text>__QCNF__FUND__DATA__RANGESet</xsl:text>
		<xsl:text>,,,,,,</xsl:text>
		<xsl:text>__QCNF__DTL__ENTRYSet</xsl:text>
		<xsl:text>&#10;</xsl:text>


		<xsl:text>"Company Code"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Agent Number"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Owner ID"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Policy Number"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Record Type"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Rec Type Seq"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Start XDate"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"End XDate"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Issue State"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Rept State"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"CMPY Curr Date"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Billing Mode"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Plan Code"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Issue Date"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Status Code"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Exhibit Code"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Pension Ind"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Back Coi Ind"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Grace Ind"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"NLG Ind"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"NBR of Xfers"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Print Ind"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Policy Desc"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Owner Name"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Owner SSN"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Owner Addr1"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Owner Addr2"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Owner Addr3"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Owner Addr4"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Owner City"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Owner State"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Owner Zip"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Insured Name"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Insured ID"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Agent Name"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Agent Addr1"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Agent Addr2"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Agent Addr3"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Agent Addr4"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Agent City"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Agent State"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Agent Zip"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Agent Phone"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Agency Name"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Agency ID"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Typ Max"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Fnd Max"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Dtl Max"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Nbr of Trans"</xsl:text><xsl:text>,</xsl:text>

		<xsl:text>"Fund Type"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Fixed Or Var"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Fund Amounts"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Fund Units"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Fund Unit Price"</xsl:text><xsl:text>,</xsl:text>

		<xsl:text>"Fund Type"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Fund Fixed Of Vary"</xsl:text><xsl:text>,</xsl:text>

		<xsl:text>"Fund Amount"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Fund Units"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Fund Unit Price"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Fund Percent"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Fund Fut Pct"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Period Ind"</xsl:text><xsl:text>,</xsl:text>

		<xsl:text>"Date"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Type"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Fund"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Class CD"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Desc"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Tran CD"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Seg Amount"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Net Amount"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Units"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Unit Price"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>"Tax Year"</xsl:text><xsl:text>,</xsl:text>

		<xsl:for-each select="com.lidp.model.admin.persistence.QCNF__REPORT__AREA">
			<xsl:text>&#10;</xsl:text>
			<xsl:value-of select="__COMPANY__CODE" /><xsl:text>,</xsl:text>
			<xsl:value-of select="__SORT__KEY/__AGENT__NUMBER" /><xsl:text>,</xsl:text>
			<xsl:value-of select="__SORT__KEY/__OWNER__ID" /><xsl:text>,</xsl:text>
			<xsl:value-of select="__SORT__KEY/__POLICY__NUMBER" /><xsl:text>,</xsl:text>
			<xsl:value-of select="__SORT__KEY/__RECORD__TYPE" /><xsl:text>,</xsl:text>
			<xsl:value-of select="__SORT__KEY/__REC__TYPE__SEQ" /><xsl:text>,</xsl:text>
			<xsl:value-of select="__START__XDATE" /><xsl:text>,</xsl:text>
			<xsl:value-of select="__END__XDATE" /><xsl:text>,</xsl:text>
			<xsl:value-of select="__ISSUE__STATE" /><xsl:text>,</xsl:text>
			<xsl:value-of select="__REPT__STATE" /><xsl:text>,</xsl:text>
			<xsl:value-of select="__CMPY__CURR__DATE" /><xsl:text>,</xsl:text>
			<xsl:value-of select="__BILLING__MODE" /><xsl:text>,</xsl:text>
			<xsl:value-of select="__PLAN__CODE" /><xsl:text>,</xsl:text>
			<xsl:value-of select="__ISSUE__DATE" /><xsl:text>,</xsl:text>
			<xsl:value-of select="__STATUS__CODE" /><xsl:text>,</xsl:text>
			<xsl:value-of select="__EXHIBIT__CODE" /><xsl:text>,</xsl:text>
			<xsl:value-of select="__PENSION__IND" /><xsl:text>,</xsl:text>
			<xsl:value-of select="__BACK__COI__IND" /><xsl:text>,</xsl:text>
			<xsl:value-of select="__GRACE__IND" /><xsl:text>,</xsl:text>
			<xsl:value-of select="__NLG__IND" /><xsl:text>,</xsl:text>
			<xsl:value-of select="__NBR__OF__XFERS" /><xsl:text>,</xsl:text>
			<xsl:value-of select="__PRINT__IND" /><xsl:text>,</xsl:text>
			<xsl:value-of select="__POLICY__DESC" /><xsl:text>,</xsl:text>
			<xsl:value-of select="__OWNER__NAME" /><xsl:text>,</xsl:text>
			<xsl:value-of select="__OWNER__SSN" /><xsl:text>,</xsl:text>
			<xsl:value-of select="__OWNER__ADDR1" /><xsl:text>,</xsl:text>
			<xsl:value-of select="__OWNER__ADDR2" /><xsl:text>,</xsl:text>
			<xsl:value-of select="__OWNER__ADDR3" /><xsl:text>,</xsl:text>
			<xsl:value-of select="__OWNER__ADDR4" /><xsl:text>,</xsl:text>
			<xsl:value-of select="__OWNER__CITY" /><xsl:text>,</xsl:text>
			<xsl:value-of select="__OWNER__STATE" /><xsl:text>,</xsl:text>
			<xsl:value-of select="__OWNER__ZIP" /><xsl:text>,</xsl:text>
			<xsl:value-of select="__INSURED__NAME" /><xsl:text>,</xsl:text>
			<xsl:value-of select="__INSURED__ID" /><xsl:text>,</xsl:text>
			<xsl:value-of select="__AGENT__NAME" /><xsl:text>,</xsl:text>
			<xsl:value-of select="__AGENT__ADDR1" /><xsl:text>,</xsl:text>
			<xsl:value-of select="__AGENT__ADDR2" /><xsl:text>,</xsl:text>
			<xsl:value-of select="__AGENT__ADDR3" /><xsl:text>,</xsl:text>
			<xsl:value-of select="__AGENT__ADDR4" /><xsl:text>,</xsl:text>
			<xsl:value-of select="__AGENT__CITY" /><xsl:text>,</xsl:text>
			<xsl:value-of select="__AGENT__STATE" /><xsl:text>,</xsl:text>
			<xsl:value-of select="__AGENT__ZIP" /><xsl:text>,</xsl:text>
			<xsl:value-of select="__AGENT__PHONE" /><xsl:text>,</xsl:text>
			<xsl:value-of select="__AGENCY__NAME" /><xsl:text>,</xsl:text>
			<xsl:value-of select="__AGENCY__ID" /><xsl:text>,</xsl:text>
			<xsl:value-of select="__TYP__MAX" /><xsl:text>,</xsl:text>
			<xsl:value-of select="__FND__MAX" /><xsl:text>,</xsl:text>
			<xsl:value-of select="__DTL__MAX" /><xsl:text>,</xsl:text>
			<xsl:value-of select="__NBR__OF__TRANS" /><xsl:text>,</xsl:text>

			<xsl:for-each select="__QCNF__0101__FUND__ENTRYSet/com.lidp.model.admin.persistence.QCNF__0101__FUND__ENTRY">
				<xsl:text>&#10;</xsl:text>
				<xsl:text>,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,</xsl:text>
				<xsl:value-of select="__FUND__TYPE" /><xsl:text>,</xsl:text>
				<xsl:value-of select="__FIXED__OR__VAR" /><xsl:text>,</xsl:text>
				<xsl:value-of select="__FUND__AMOUNT" /><xsl:text>,</xsl:text>
				<xsl:value-of select="__FUND__UNITS" /><xsl:text>,</xsl:text>
				<xsl:value-of select="__FUND__UNIT__PRICE" /><xsl:text>,</xsl:text>
			</xsl:for-each>

			<xsl:for-each select="__QCNF__CVSG__FUND__ENTRYSet/com.lidp.model.admin.persistence.QCNF__CVSG__FUND__ENTRY">
				<xsl:text>&#10;</xsl:text>
				<xsl:text>,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,</xsl:text>
				<xsl:value-of select="__FUND__TYPE" /><xsl:text>,</xsl:text>
				<xsl:value-of select="__FUND__FIXED__OR__VARY" /><xsl:text>,</xsl:text>
				<xsl:for-each select="__QCNF__FUND__DATA__RANGESet/com.lidp.model.admin.persistence.QCNF__FUND__DATA__RANGE">
					<xsl:text>&#10;</xsl:text>
					<xsl:text>,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,</xsl:text>
					<xsl:value-of select="__FUND__AMOUNT" /><xsl:text>,</xsl:text>
					<xsl:value-of select="__FUND__UNITS" /><xsl:text>,</xsl:text>
					<xsl:value-of select="__FUND__UNIT__PRICE" /><xsl:text>,</xsl:text>
					<xsl:value-of select="__FUND__PERCENT" /><xsl:text>,</xsl:text>
					<xsl:value-of select="__FUND__FUT__PCT" /><xsl:text>,</xsl:text>
					<xsl:value-of select="__PERIOD__IND" /><xsl:text>,</xsl:text>
				</xsl:for-each>
			</xsl:for-each>

			<xsl:for-each select="__QCNF__DTL__ENTRYSet/com.lidp.model.admin.persistence.QCNF__DTL__ENTRY">
				<xsl:text>&#10;</xsl:text>
				<xsl:text>,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,</xsl:text>
				<xsl:value-of select="__DATE" /><xsl:text>,</xsl:text>
				<xsl:value-of select="__TYPE" /><xsl:text>,</xsl:text>
				<xsl:value-of select="__FUND" /><xsl:text>,</xsl:text>
				<xsl:value-of select="__CLASS__CD" /><xsl:text>,</xsl:text>
				<xsl:value-of select="__DESC" /><xsl:text>,</xsl:text>
				<xsl:value-of select="__TRAN__CD" /><xsl:text>,</xsl:text>
				<xsl:value-of select="__SEG__AMOUNT" /><xsl:text>,</xsl:text>
				<xsl:value-of select="__NET__AMOUNT" /><xsl:text>,</xsl:text>
				<xsl:value-of select="__UNITS" /><xsl:text>,</xsl:text>
				<xsl:value-of select="__UNT__PRICE" /><xsl:text>,</xsl:text>
				<xsl:value-of select="__TAX__YEAR" /><xsl:text>,</xsl:text>
			</xsl:for-each>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>

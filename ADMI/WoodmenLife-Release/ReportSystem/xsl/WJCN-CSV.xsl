<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:output method="text" />
	
	<!-- Support WJCN CSV XSL Transformation Process -->
	
	<xsl:template match="/">
    	<xsl:apply-templates select="XML__ReportExtract" />
  	</xsl:template>
  	
  	<xsl:template match="XML__ReportExtract">  	
		<xsl:apply-templates select="reportExtractSet/REPT__WJCN__Extract" />
	</xsl:template>
  	
	<xsl:template match="REPT__WJCN__Extract">
		<!-- - - - - - - - - - - - - - - - - - - --->
		<!-- Start by printing the report heading -->
		<!-- - - - - - - - - - - - - - - - - - - --->
		
		<xsl:text>CO. </xsl:text><xsl:value-of select="//companyCode" /><xsl:text> REPORT </xsl:text><xsl:value-of select="//reportID" />
		<xsl:text>&#10;</xsl:text>
		<xsl:value-of select="heading1" />
		<xsl:text>&#10;</xsl:text>
		<xsl:variable name="from_Month" select="substring(//fromDate, 6, 2)"/>
		<xsl:variable name="from_Day" select="substring(//fromDate, 9)"/>
		<xsl:variable name="from_Year" select="substring(//fromDate, 1, 4)"/>
		<xsl:variable name="from_Date" select="concat($from_Month, '-', $from_Day, '-', $from_Year)" />
		<xsl:text>From </xsl:text><xsl:value-of select="$from_Date" />
		<xsl:variable name="thru_Month" select="substring(//thruDate, 6, 2)"/>
		<xsl:variable name="thru_Day" select="substring(//thruDate, 9)"/>
		<xsl:variable name="thru_Year" select="substring(//thruDate, 1, 4)"/>
		<xsl:variable name="thru_Date" select="concat($thru_Month, '-', $thru_Day, '-', $thru_Year)" />
		<xsl:text> Thru </xsl:text><xsl:value-of select="$thru_Date" />
		<xsl:text>&#10;</xsl:text>
		<xsl:variable name="rept_Month" select="substring(//reportDate, 6, 2)"/>
		<xsl:variable name="rept_Day" select="substring(//reportDate, 9)"/>
		<xsl:variable name="rept_Year" select="substring(//reportDate, 1, 4)"/>
		<xsl:variable name="rept_Date" select="concat($rept_Month, '-', $rept_Day, '-', $rept_Year)" />
		<xsl:text>Date </xsl:text><xsl:value-of select="$rept_Date" />
		<xsl:text> Time </xsl:text><xsl:value-of select="//reportTime" />
		<xsl:text>&#10;</xsl:text>
		<xsl:value-of select="heading2" />
		<xsl:text>&#10;</xsl:text>
		<xsl:text>Printed By: </xsl:text><xsl:value-of select="//printedBy" />
		<xsl:text>&#10;</xsl:text>
		<xsl:text>&#10;</xsl:text>
		
		<!-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -->
		<!-- We potentially have three different types of data to display. -->
		<!--    Detail Records  (see APVWBP00.modifier.charAt(7))          -->
		<!--    'B' Detail Records (see APVWBP00.modifier.charAt(6))       -->
		<!--    Totals                                                     -->
		<!-- At a minimum, we have Totals to print.                        -->
		<!-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -->
		
		<xsl:if test="detailLines != null">
			<!-- - - - - - - - - - - - - - - - - - - - - - - - - -->
			<!-- Detail Lines would be their own page on the PDF -->
			<!-- - - - - - - - - - - - - - - - - - - - - - - - - -->
			
			<xsl:apply-templates select="detailHeading" />

			<xsl:text>,Policy Number,Coverage Number,Sub Coverage,Total Gross Advanced,Total Gross Deferred,Total Gross Due,Total Gross Unearned,Total Net Due,Total Net Deferred,Total Net Unearned</xsl:text>

			<xsl:apply-templates select="detailLines/REPT__WJCN__DetailLine" />

			<xsl:text>&#10;</xsl:text>
			<xsl:text>&#10;</xsl:text>
		</xsl:if>
		
		<xsl:if test="detailLines__B != null">
			<!-- - - - - - - - - - - - - - - - - - - - - - - - - - -->
			<!-- B Detail Lines would be their own page on the PDF -->
			<!-- - - - - - - - - - - - - - - - - - - - - - - - - - -->
			
			<xsl:apply-templates select="detailHeading" />
			
			<xsl:text>,Policy Number,Coverage Number,Sub Coverage,Issue Date,Paid To Date,Valuation Age,Current Duration,Number Of Units,Current Net Premium,Advanced Days,Deferred Days,Due Days,Unearned Days</xsl:text>
			
			<xsl:apply-templates select="detailLines__B/REPT__WJCN_DetailLine__B" />

			<xsl:text>&#10;</xsl:text>
			<xsl:text>&#10;</xsl:text>
		</xsl:if>
		
		<!-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - --->
		<!-- Totals must exist and would be their own page on the PDF -->
		<!-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - --->
		<xsl:apply-templates select="totals" />
		
	</xsl:template>
	
	<xsl:template match="detailHeading">
		<xsl:text>Request:,</xsl:text><xsl:value-of select="requestNumber" /><xsl:text>,</xsl:text>
		<xsl:choose>
			<xsl:when test="wjcdSW = 'true'">
				<xsl:text>ABC Code:,</xsl:text><xsl:value-of select="majorLine" /><xsl:text>,</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text>Major Line:,</xsl:text><xsl:value-of select="majorLine" /><xsl:text>,</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:text>Basis:,</xsl:text><xsl:value-of select="basis" /><xsl:text>,</xsl:text>
		<xsl:text>Coverage Type:,</xsl:text><xsl:value-of select="coverageType" /><xsl:text>,</xsl:text>
		<xsl:text>VPC:,</xsl:text><xsl:value-of select="vpc" /><xsl:text>,</xsl:text>
		<xsl:text>Plan:,</xsl:text><xsl:value-of select="planCode" /><xsl:text>,</xsl:text>
		<xsl:text>Plan Sub:,</xsl:text><xsl:value-of select="planCodeSubType" /><xsl:text>,</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>&#10;</xsl:text>
	</xsl:template>
	
	<xsl:template match="REPT__WJCN__DetailLine">
		<xsl:text>&#10;</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:value-of select="policy" /><xsl:text>,</xsl:text>
		<xsl:value-of select="coverageNumber" /><xsl:text>,</xsl:text>
		<xsl:value-of select="subCovNumber" /><xsl:text>,</xsl:text>
		<xsl:value-of select="format-number(grossAdvanced, '###,###,###.00')" /><xsl:text>,</xsl:text>
		<xsl:value-of select="format-number(grossDeferred, '###,###,###.00')" /><xsl:text>,</xsl:text>
		<xsl:value-of select="format-number(grossDue, '###,###,###.00')" /><xsl:text>,</xsl:text>
		<xsl:value-of select="format-number(grossUnearned, '###,###,###.00')" /><xsl:text>,</xsl:text>
		<xsl:value-of select="format-number(netDue, '###,###,###.00')" /><xsl:text>,</xsl:text>
		<xsl:value-of select="format-number(netDeferred, '###,###,###.00')" /><xsl:text>,</xsl:text>
		<xsl:value-of select="format-number(netUnearned, '###,###,###.00')" /><xsl:text>,</xsl:text>
	</xsl:template>
	
	<xsl:template match="REPT__WJCN__DetailLine__B">
		<xsl:text>&#10;</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:value-of select="policy" /><xsl:text>,</xsl:text>
		<xsl:value-of select="coverageNumber" /><xsl:text>,</xsl:text>
		<xsl:value-of select="subCovNumber" /><xsl:text>,</xsl:text>
		<xsl:value-of select="issueDate" /><xsl:text>,</xsl:text>
		<xsl:value-of select="paidToDate" /><xsl:text>,</xsl:text>
		<xsl:value-of select="valAge" /><xsl:text>,</xsl:text>
		<xsl:value-of select="currentDuration" /><xsl:text>,</xsl:text>
		<xsl:value-of select="format-number(numberOfUnits, '###,###,###.000000')" /><xsl:text>,</xsl:text>
		<xsl:value-of select="format-number(netPremium, '###,###,###.00')" /><xsl:text>,</xsl:text>
		<xsl:value-of select="advDays" /><xsl:text>,</xsl:text>
		<xsl:value-of select="defrDays" /><xsl:text>,</xsl:text>
		<xsl:value-of select="dueDays" /><xsl:text>,</xsl:text>
		<xsl:value-of select="unearnedDays" /><xsl:text>,</xsl:text>
	</xsl:template>
	
	<xsl:template match="totals">
		<xsl:text>Totals For Basis </xsl:text><xsl:value-of select="basis" />
		<xsl:text> and Request Number </xsl:text><xsl:value-of select="requestNumber" />
		<xsl:text>&#10;</xsl:text>
		<xsl:text>&#10;</xsl:text>

		<xsl:if test="breakTotals != null">
			<xsl:apply-templates select="breakTotals" />

			<xsl:text>&#10;</xsl:text>
			<xsl:text>&#10;</xsl:text>
		</xsl:if>

		<xsl:if test="keyTotals != null">
			<xsl:apply-templates select="keyTotals" />

			<xsl:text>&#10;</xsl:text>
			<xsl:text>&#10;</xsl:text>
		</xsl:if>

		<xsl:if test="basisTotals != null">
			<xsl:text>* * * * Request/Basis Totals * * * *</xsl:text>
			<xsl:text>&#10;</xsl:text>
			<xsl:text>&#10;</xsl:text>
			<xsl:text>Request Number,Basis Type</xsl:text>
			<xsl:text>&#10;</xsl:text>
			<xsl:value-of select="requestNumber" />
			<xsl:text>,</xsl:text><xsl:value-of select="basis" />
			<xsl:text>&#10;</xsl:text>
			<xsl:text>&#10;</xsl:text>
			<xsl:text>,Total Gross Advanced,Total Gross Deferred,Total Gross Due,Total Gross Unearned,Total Net Due,Total Net Deferred,Total Net Unearned,Piece Count</xsl:text>
		
			<xsl:apply-templates select="basisTotals/WJCN__Totals" />

			<xsl:text>&#10;</xsl:text>
			<xsl:text>&#10;</xsl:text>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="breakTotals">
		<xsl:text>* * * * </xsl:text>
		<xsl:choose>
			<xsl:when test="breakType = '2'">
				<xsl:text>Valuation Age </xsl:text>
			</xsl:when>

			<xsl:when test="breakType = '1'">
				<xsl:text>Duration </xsl:text>
			</xsl:when>

			<xsl:when test="breakType = '0'">
				<xsl:text>Issue Year </xsl:text>
			</xsl:when>
		</xsl:choose>
		<xsl:value-of select="breakField" /><xsl:text> Totals* * * *</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>&#10;</xsl:text>
		
		<xsl:text>,Total Gross Advanced,Total Gross Deferred,Total Gross Due,Total Gross Unearned,Total Net Due,Total Net Deferred,Total Net Unearned,Piece Count</xsl:text>
		
		<xsl:apply-templates select="totals/WJCN__Totals" />
		
	</xsl:template>
	
	<xsl:template match="keyTotals">
		<xsl:text>* * * * Valuation Key Totals * * * *</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>,Coverage Type,Major Line,Lives Code,Modify Code,Interest Function,Interest Rate/Code,Mortality Table,Plan Code,Sub Code</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>,</xsl:text><xsl:value-of select="coverageType" /><xsl:text>,</xsl:text>
		<xsl:value-of select="majorLine" /><xsl:text>,</xsl:text>
		<xsl:value-of select="livesCode" /><xsl:text>,</xsl:text>
		<xsl:value-of select="modifyCode" /><xsl:text>,</xsl:text>
		<xsl:value-of select="interestFunction" /><xsl:text>,</xsl:text>
		<xsl:value-of select="format-number(interestRateCode, '###,###,###.0000')" /><xsl:text>,</xsl:text>
		<xsl:value-of select="mortalityTable" /><xsl:text>,</xsl:text>
		<xsl:value-of select="planCode" /><xsl:text>,</xsl:text>
		<xsl:value-of select="planSub" /><xsl:text>,</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>,Total Gross Advanced,Total Gross Deferred,Total Gross Due,Total Gross Unearned,Total Net Due,Total Net Deferred,Total Net Unearned,Piece Count</xsl:text>
		
		<xsl:apply-templates select="totals/WJCN__Totals" />
		
	</xsl:template>
	
	<xsl:template match="WJCN__Totals">
		<xsl:text>&#10;</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:value-of select="format-number(grossAdvanced, '###,###,###.00')" /><xsl:text>,</xsl:text>
		<xsl:value-of select="format-number(grossDeferred, '###,###,###.00')" /><xsl:text>,</xsl:text>
		<xsl:value-of select="format-number(grossDue, '###,###,###.00')" /><xsl:text>,</xsl:text>
		<xsl:value-of select="format-number(grossUnearned, '###,###,###.00')" /><xsl:text>,</xsl:text>
		<xsl:value-of select="format-number(netDue, '###,###,###.00')" /><xsl:text>,</xsl:text>
		<xsl:value-of select="format-number(netDeferred, '###,###,###.00')" /><xsl:text>,</xsl:text>
		<xsl:value-of select="format-number(netUnearned, '###,###,###.00')" /><xsl:text>,</xsl:text>
		<xsl:value-of select="pieceCount" />
	</xsl:template>
</xsl:stylesheet>
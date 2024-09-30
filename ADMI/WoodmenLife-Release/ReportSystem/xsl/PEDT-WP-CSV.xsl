<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:import href="CSV-UTILS.xsl" />
	<xsl:import href="PEDT-CSV-UTILS.xsl" />	
	<xsl:import href="ADMI-UTILS.xsl" />
	<xsl:output method="text" />	
	<!-- Support WP Section for PEDT CSV XSL Transformation Process -->
	<xsl:template match="/">
    	<xsl:apply-templates select="XML__ReportExtract" />
  	</xsl:template>	
  	<xsl:template match="XML__ReportExtract">
  	    <xsl:call-template name="mainHeader1"/>
	   	<xsl:for-each select="reportExtractSet/PFWP__MasterArea"> 
		   <xsl:call-template name="plwp"/>
		</xsl:for-each>
	</xsl:template>
    <xsl:template name="plwp">  
        <xsl:call-template name="header1"/>
        <xsl:call-template name="header2"/>		
		<xsl:apply-templates select="__PFWP__EntrySet" />
    </xsl:template>		
    <xsl:template match="PFWP__Entry">	
		<xsl:text>Issue State,</xsl:text>	
		<xsl:text>Date 1,</xsl:text>	
		<xsl:text>Date 2,</xsl:text>
		<xsl:text>Date Use,</xsl:text>
		<xsl:text>Rider Processing Cycle Rule,</xsl:text>
		<xsl:text>Rider Processing Cycle Adjust Days,</xsl:text>
		<xsl:text>Relationship Rule,</xsl:text>
		<xsl:text>Joint Age Rule,</xsl:text>
		<xsl:text>Opt Out Rule,</xsl:text>
		<xsl:text>Age Calculation Method,</xsl:text>
		<xsl:text>Payment Detail Update Rule,</xsl:text>
		<xsl:text>Payment Detail Anniversary Use,</xsl:text>
		<xsl:text>Payment Detail Anniversary Duration,</xsl:text>
		<xsl:text>Payment Detail Depletion Rule,</xsl:text>
		<xsl:text>Maximum Benefit Base,</xsl:text>
		<xsl:text>Maximum Benefit Use,</xsl:text>
		<xsl:text>Bonus Use Code,</xsl:text>
		<xsl:text>Bonus Period,</xsl:text>
		<xsl:text>Bonus Percent,</xsl:text>
		<xsl:text>Bonus Table Use,</xsl:text>
		<xsl:text>Bonus Table Type,</xsl:text>
		<xsl:text>Step Up Use Code,</xsl:text>
		<xsl:text>Step Up Age/Duration,</xsl:text>
		<xsl:text>Roll Up Use Code,</xsl:text>
		<xsl:text>Roll Up Duration,</xsl:text>
		<xsl:text>Roll Up Interest Table ID,</xsl:text>
		<xsl:text>Payments After Withdrawal Use Code,</xsl:text>
		<xsl:text>Payments After Withdrawal Duration,</xsl:text>
		<xsl:text>Withdrawal Phase Minimum Age,</xsl:text>
		<xsl:text>Withdrawal Phase Joint Minimum Age,</xsl:text>
		<xsl:text>Withdrawal Phase Initiate Rule,</xsl:text>
		<xsl:text>Withdrawal Phase Benefit Rule,</xsl:text>
		<xsl:text>Withdrawal Phase Election Use,</xsl:text>
		<xsl:text>Withdrawal Phase Election Duration,</xsl:text>
		<xsl:text>Withdrawal Phase Premiums Allowed,</xsl:text>
		<xsl:text>Withdrawal Phase Max YTD Premium,</xsl:text>
		<xsl:text>Withdrawal Phase Billing Rule,</xsl:text>
		<xsl:text>Withdrawal Phase Termination Rule,</xsl:text>
		<xsl:text>Lifetime GWA Minimum Age,</xsl:text>
		<xsl:text>Lifetime GWA Minimum Amount,</xsl:text>
		<xsl:text>RMD Rule,</xsl:text>
		<xsl:text>Lifetime Distribution Factor Table,</xsl:text>
		<xsl:text>Term Distribution Factor Table,</xsl:text>
		<xsl:text>Death Benefit Termination Rule,</xsl:text>
		<xsl:text>Death Benefit Calculation Rule,</xsl:text>
		<xsl:text>Interfund Transfer Restriction,</xsl:text>
		<xsl:text>Transfer/Allocation Duration,</xsl:text>
		<xsl:text>Level GWD Withdrawal Calc Rule,</xsl:text>
		<xsl:text>Waive Surrender Charge Rule,</xsl:text>
		<xsl:text>Minimum Issue Age,</xsl:text>
		<xsl:text>Maximum Issue Age</xsl:text>
		<xsl:text>&#10;</xsl:text> 		
    	<xsl:text>"</xsl:text>
		<xsl:value-of select="__ISSUE__STATE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:variable name="date1Month" select="substring(__DATEX__1, 6, 2)"/>
		<xsl:variable name="date1Day" select="substring(__DATEX__1, 9)"/>
		<xsl:variable name="date1Year" select="substring(__DATEX__1, 1, 4)"/>
		<xsl:variable name="date1Date" select="concat($date1Month, '-', $date1Day, '-', $date1Year)" />
		<xsl:value-of select="$date1Date" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:variable name="date2Month" select="substring(__DATEX__2, 6, 2)"/>
		<xsl:variable name="date2Day" select="substring(__DATEX__2, 9)"/>
		<xsl:variable name="date2Year" select="substring(__DATEX__2, 1, 4)"/>
		<xsl:variable name="date2Date" select="concat($date2Month, '-', $date2Day, '-', $date2Year)" />
		<xsl:value-of select="$date2Date" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__DATE__USE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__RIDER__CYCLE__RULE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__RID__CYCLE__ADJ__DAYS" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__RELATIONSHIP__RULE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__JOINT__AGE__RULE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__OPT__OUT__RULE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__AGE__CALCULATE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__DETAIL__UPDATE__RULE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__DETAIL__ANNIV__USE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__DETAIL__ANNI__DURA" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__DETAIL__DEPLET__RULE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__MAX__BENEFIT__BASE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__MAX__BENEFIT__USE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__BONUS__USE__CODE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__BONUS__PERIOD" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__BONUS__PERCENT" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__BONUS__TABLE__USE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__BONUS__TABLE__TYPE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__STEP__UP__USE__CODE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__STEP__UP__AGE__DUR" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__ROLL__STEP__UP__USE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__ROLL__STEP__UP__DURA" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__ROLL__UP__INT__TAB__ID" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__AFTER__WITHDRAW__USE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__AFTER__WITHDRAW__DUR" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__WP__MINIMUM__AGE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__WP__JNT__ANN__MIN__AGE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__WP__INITIATE__RULE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__WP__BENEFIT__RULE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__WP__ELECTION__USE__CD" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__WP__ELECTION__DURA" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__WP__PREMIUMS__ALLOW" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__WP__MAX__YTD__PREMIUM" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__WP__BILLING__RULE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__WP__RIDER__TERM__RULE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__LIFE__GWA__MIN__AGE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__LIFE__GWA__MIN__AMT" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__RMD__FRIENDLY__RULE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__LIFE__FACTOR__TABLE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__TERM__FACTOR__TABLE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__DB__TERMINATION__RL" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__DB__CALCULATION__RL" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__XFER__RESTRICT__RULE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__XFER__ALLO__CHG__DUR" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__LVL__GWA__SW__CALC__RL" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__WAIVE__CHARGE__RULE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__MIN__ISSUE__AGE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__MAX__ISSUE__AGE" />
		<xsl:text>"</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>*************************</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>Adjust Rules Table</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>Phase Type,</xsl:text>
		<xsl:text>Benefit Type,</xsl:text>
		<xsl:text>Action Code,</xsl:text>
		<xsl:text>Kind Code,</xsl:text>
		<xsl:text>Benefit Base,</xsl:text>
		<xsl:text>Remaining Amount,</xsl:text>
		<xsl:text>Distribution Factor,</xsl:text>
		<xsl:text>Guaranteed Withdrawal Amount,</xsl:text>
		<xsl:text>Bonus Base,</xsl:text>
		<xsl:text>Rider Charge Base,</xsl:text>
		<xsl:text>Max Anniversary Value,</xsl:text>
		<xsl:text>Premium Roll-Up Amount</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:for-each select="__PFWP__SubEntrySet/PFWP__SubEntry" >
			<xsl:text>"</xsl:text>
			<xsl:value-of select="__AR__PHASE__TYPE" />
			<xsl:text>"</xsl:text>
			<xsl:text>,</xsl:text>
			<xsl:text>"</xsl:text>
			<xsl:value-of select="__AR__BENEFIT__TYPE" />
			<xsl:text>"</xsl:text>
			<xsl:text>,</xsl:text>
			<xsl:text>"</xsl:text>
			<xsl:value-of select="__AR__ACTION__CODE" />
			<xsl:text>"</xsl:text>
			<xsl:text>,</xsl:text>
			<xsl:text>"</xsl:text>
			<xsl:value-of select="__AR__KIND__CODE" />
			<xsl:text>"</xsl:text>
			<xsl:text>,</xsl:text>
			<xsl:text>"</xsl:text>
			<xsl:value-of select="__AR__BENEFIT__BASE" />
			<xsl:text>"</xsl:text>
			<xsl:text>,</xsl:text>
			<xsl:text>"</xsl:text>
			<xsl:value-of select="__AR__REMAINING__AMT" />
			<xsl:text>"</xsl:text>
			<xsl:text>,</xsl:text>
			<xsl:text>"</xsl:text>
			<xsl:value-of select="__AR__DISTRIB__FACTOR" />
			<xsl:text>"</xsl:text>
			<xsl:text>,</xsl:text>
			<xsl:text>"</xsl:text>
			<xsl:value-of select="__AR__GUAR__WDRAW__AMT" />
			<xsl:text>"</xsl:text>
			<xsl:text>,</xsl:text>
			<xsl:text>"</xsl:text>
			<xsl:value-of select="__AR__BONUS__BASE" />
			<xsl:text>"</xsl:text>
			<xsl:text>,</xsl:text>
			<xsl:text>"</xsl:text>
			<xsl:value-of select="__AR__RIDER__CHRG__BASE" />
			<xsl:text>"</xsl:text>
			<xsl:text>,</xsl:text>
			<xsl:text>"</xsl:text>
			<xsl:value-of select="__AR__MAX__ANNI__VALUE" />
			<xsl:text>"</xsl:text>
			<xsl:text>,</xsl:text>
			<xsl:text>"</xsl:text>
			<xsl:value-of select="__AR__PREM__ROLLUP__AMT" />
			<xsl:text>"</xsl:text>
			<xsl:text>&#10;</xsl:text> 
		</xsl:for-each>
		<xsl:text>&#10;</xsl:text>
	</xsl:template>
</xsl:stylesheet>
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:import href="CSV-UTILS.xsl" />
	<xsl:import href="PEDT-CSV-UTILS.xsl" />	
	<xsl:import href="ADMI-UTILS.xsl" />
	<xsl:output method="text" />	
	<!-- Support YF Section for PEDT CSV XSL Transformation Process -->
	<xsl:template match="/">
    	<xsl:apply-templates select="XML__ReportExtract" />
  	</xsl:template>	
  	<xsl:template match="XML__ReportExtract">
  	    <xsl:call-template name="mainHeader1"/>
	   	<xsl:for-each select="reportExtractSet/PFYF__MasterArea"> 
		   <xsl:call-template name="plyf"/>
		</xsl:for-each>
	</xsl:template>
    <xsl:template name="plyf">  
        <xsl:call-template name="header1"/>
        <xsl:call-template name="header2"/>
		<xsl:text>Issue State,</xsl:text>	
		<xsl:text>Anniversary/Transaction Use,</xsl:text>	
		<xsl:text>Anniversary/Transaction Date,</xsl:text>
		<xsl:text>Flat Fee Code,</xsl:text>
		<xsl:text>Flat Fee Financial Recording,</xsl:text>
		<xsl:text>Flat Fee Charge,</xsl:text>
		<xsl:text>Flat Fee Excess Interest Indicator,</xsl:text>
		<xsl:text>Flat Fee Debit Method,</xsl:text>
		<xsl:text>Units Fee Code,</xsl:text>
		<xsl:text>Units Fee Financial Recording,</xsl:text>
		<xsl:text>Units Fee Per Unit,</xsl:text>
		<xsl:text>Units Fee Minimum,</xsl:text>
		<xsl:text>Units Fee Maximum,</xsl:text>
		<xsl:text>Units Fee Band Rule,</xsl:text>
		<xsl:text>Units Fee Excess Interest Indicator,</xsl:text>
		<xsl:text>Units Fee Break 1,</xsl:text>
		<xsl:text>Units Fee Per Unit Over 1,</xsl:text>
		<xsl:text>Units Fee Break 2,</xsl:text>
		<xsl:text>Units Fee Per Unit Over 2,</xsl:text>
		<xsl:text>Units Fee Break 3,</xsl:text>
		<xsl:text>Units Fee Per Unit Over 3,</xsl:text>
		<xsl:text>Account Fee Break 1,</xsl:text>
		<xsl:text>Account Fee Over 1,</xsl:text>
		<xsl:text>Account Fee Break 2,</xsl:text>
		<xsl:text>Account Fee Over 2,</xsl:text>
		<xsl:text>Default Deduction Control Code,</xsl:text>
		<xsl:text>Valid Codes,</xsl:text>
		<xsl:text>Deduction Deferral Days,</xsl:text>
		<xsl:text>Default Fee,</xsl:text>
		<xsl:text>Account Fee Code,</xsl:text>
		<xsl:text>Account Fee Financial Recording,</xsl:text>
		<xsl:text>Account Fee Use Code,</xsl:text>
		<xsl:text>Account Fee Break 3,</xsl:text>
		<xsl:text>Account Fee Over 3,</xsl:text>
		<xsl:text>Account Fee Break 4,</xsl:text>
		<xsl:text>Account Fee Over 4,</xsl:text>
		<xsl:text>Account Fee Break 5,</xsl:text>
		<xsl:text>Account Fee Over 5,</xsl:text>
		<xsl:text>Account Fee Minimum,</xsl:text>
		<xsl:text>Account Fee Maximum,</xsl:text>
		<xsl:text>Account Fee Band Rule,</xsl:text>
		<xsl:text>Account Fee Excess Interest Indicator,</xsl:text>
		<xsl:text>Account Fee Break 6,</xsl:text>
		<xsl:text>Account Fee Over 6,</xsl:text>
		<xsl:text>Limit STO Deductions Use,</xsl:text>
		<xsl:text>Limit STO Deductions Amount,</xsl:text>
		<xsl:text>Waive Fee Use,</xsl:text>
		<xsl:text>Waive Fee Amount,</xsl:text>
		<xsl:text>Waive Fee Use 2,</xsl:text>
		<xsl:text>Waive Fee Amount 2</xsl:text>
		<xsl:text>&#10;</xsl:text>  		
 		<xsl:apply-templates select="__PFYF__EntrySet" />
    </xsl:template>		
    <xsl:template match="PFYF__Entry">	
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__ISSUE__STATE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__ANNIV__OR__TRANS__USE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:variable name="anniOrTranMonth" select="substring(__ANNI__OR__TRANS__DATE, 6, 2)"/>
		<xsl:variable name="anniOrTranDay" select="substring(__ANNI__OR__TRANS__DATE, 9)"/>
		<xsl:variable name="anniOrTranYear" select="substring(__ANNI__OR__TRANS__DATE, 1, 4)"/>
		<xsl:variable name="anniOrTranDate" select="concat($anniOrTranMonth, '-', $anniOrTranDay, '-', $anniOrTranYear)" />
		<xsl:value-of select="$anniOrTranDate" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__FLAT__FEE__CODE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__FLAT__FEE__FIN__REC" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__FLAT__FEE__CHARGE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__FLAT__FEE__EXC__INT" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__DEBIT__METHOD" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__UNITS__FEE__CODE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__UNITS__FEE__FIN__REC" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__UNITS__FEE__PER__UNIT" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__UNITS__FEE__MINIMUM" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__UNITS__FEE__MAXIMUM" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__UNITS__FEE__BAND__RL" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__UNITS__EXC__INT__IND" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__UNITS__FEE__BREAK__1" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__UNITS__FEE__OVER__1" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__UNITS__FEE__BREAK__2" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__UNITS__FEE__OVER__2" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__UNITS__FEE__BREAK__3" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__UNITS__FEE__OVER__3" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__ACCT__FEE__BREAK__1" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__ACCT__FEE__OVER__1" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__ACCT__FEE__BREAK__2" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__ACCT__FEE__OVER__2" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__DEFLT__DEDT__CTRL__CD" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__VALID__DED__CTRL__CDS" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__DEDUCT__DEFER__DAYS" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__ACCT__DEFAULT__FEE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__ACCT__FEE__CODE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__ACCT__FEE__FIN__REC" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__ACCT__FEE__USE__CODE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__ACCT__FEE__BREAK__3" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__ACCT__FEE__OVER__3" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__ACCT__FEE__BREAK__4" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__ACCT__FEE__OVER__4" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__ACCT__FEE__BREAK__5" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__ACCT__FEE__OVER__5" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__ACCT__FEE__MINIMUM" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__ACCT__FEE__MAXIMUM" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__ACCT__FEE__BAND__RULE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__ACCT__FEE__EXC__INT" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__ACCT__FEE__BREAK__6" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__ACCT__FEE__OVER__6" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__LIMIT__DEDT__USE__CD" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__LIMIT__DEDT__AMOUNT" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__WAIVE__FEE__USE__CODE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__WAIVE__FEE__AMOUNT" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__WAIVE__FEE__USE__CD__2" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__WAIVE__FEE__AMNT__2" />
		<xsl:text>"</xsl:text>
		<xsl:text>&#10;</xsl:text> 
	</xsl:template>
</xsl:stylesheet>
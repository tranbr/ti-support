<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:import href="CSV-UTILS.xsl" />
	<xsl:import href="PEDT-CSV-UTILS.xsl" />	
	<xsl:import href="ADMI-UTILS.xsl" />
	<xsl:output method="text" />	
	<!-- Support BX Section for PEDT CSV XSL Transformation Process -->
	<xsl:template match="/">
    	<xsl:apply-templates select="XML__ReportExtract" />
  	</xsl:template>	
  	<xsl:template match="XML__ReportExtract">
  	    <xsl:call-template name="mainHeader1"/>
	   	<xsl:for-each select="reportExtractSet/PFBX__MasterArea"> 
		   <xsl:call-template name="plbx"/>
		</xsl:for-each>
	</xsl:template>
    <xsl:template name="plbx">  
        <xsl:call-template name="header1"/>
        <xsl:call-template name="header2"/>
		<xsl:text>Issue State,</xsl:text>	
		<xsl:text>Date 1,</xsl:text>	
		<xsl:text>Date 2,</xsl:text>
		<xsl:text>Premium Allocation Method,</xsl:text>
		<xsl:text>Period Control Use,</xsl:text>
		<xsl:text>Period Control Value,</xsl:text>
		<xsl:text>Period Control Reset Use,</xsl:text>
		<xsl:text>TAMRA Recalculation Method,</xsl:text>
		<xsl:text>Minimum Accumulation Interest Rate,</xsl:text>
		<xsl:text>Coverage Processing: Guideline Level,</xsl:text>
		<xsl:text>Coverage Processing: Guideline Single,</xsl:text>
		<xsl:text>Coverage Processing: Minimum Premium,</xsl:text>
		<xsl:text>Coverage Processing: Required Premium,</xsl:text>
		<xsl:text>Coverage Processing: Target 1,</xsl:text>
		<xsl:text>Coverage Processing: Target 2,</xsl:text>
		<xsl:text>Coverage Processing: Surrender Charge Units,</xsl:text>
		<xsl:text>Coverage Processing: Surrender Charge Max,</xsl:text>
		<xsl:text>Coverage Processing: TAMRA,</xsl:text>
		<xsl:text>Coverage Processing: SEC Guideline,</xsl:text>
		<xsl:text>Coverage Processing: TAMRA Waiver Premium,</xsl:text>
		<xsl:text>Coverage Processing: Waiver of Premium Guideline Level,</xsl:text>
		<xsl:text>Coverage Processing: Waiver of Premium Guideline Single,</xsl:text>
		<xsl:text>IRC7702 Guideline Level Rate,</xsl:text>
		<xsl:text>IRC7702 Guideline Single Rate,</xsl:text>
		<xsl:text>IRC7702 TAMRA Rate,</xsl:text>
		<xsl:text>Reinstatement Calc Method,</xsl:text>
		<xsl:text>Level Commission Method,</xsl:text>
		<xsl:text>Level Commission Years,</xsl:text>
		<xsl:text>No Lapse Grace Rule,</xsl:text>
		<xsl:text>Minimum Premium Extension Lapse Reinstatement,</xsl:text>
		<xsl:text>Minimum Premium Extension Disability</xsl:text>
		<xsl:text>&#10;</xsl:text>  		
 		<xsl:apply-templates select="__PFBX__EntrySet" />
    </xsl:template>		
    <xsl:template match="PFBX__Entry">	
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
		<xsl:value-of select="__PREM__ALLOC__METHOD" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__PERIOD__CONTROL__USE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__PERIOD__CONTROL" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__PERD__RESET__USE__CD" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__TAMRA__RECALC__METH" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__MIN__ACCUM__INT__RATE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__GL__CALC__METHOD" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__GS__CALC__METHOD" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__MIN__PREM__CALC__METH" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__REQ__PREM__CALC__METH" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__PRE__COM__TG__1__CALC" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__PRE__COM__TG__2__CALC" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__SCU__VAR__CALC__METH" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__SC__AV__PCT__VAR__MX" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__TAMRA__CALC__MTHD" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__SEC__GL__CALC__METHOD" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__WPTAMRA__CALC__MTHD" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__WPGL__CALC__METHOD" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__WPGS__CALC__METHOD" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__GL__IRC7702__RATE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__GS__IRC7702__RATE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__TAMRA__IRC7702__RATE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__REINST__CALC__METHOD" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__LEVEL__COMM__METHOD" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__LEVEL__COMM__YEARS" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__NO__LAPSE__GRACE__RUL" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__LAPSE__RE__EXT__METH" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__DISABLTY__EXT__METH" />
		<xsl:text>"</xsl:text>
		<xsl:text>&#10;</xsl:text> 
	</xsl:template>
</xsl:stylesheet>
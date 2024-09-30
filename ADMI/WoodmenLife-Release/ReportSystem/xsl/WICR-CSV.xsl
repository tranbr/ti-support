<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:output method="text" />
	
	<!-- Support WICR CSV XSL Transformation Process -->
	
	<xsl:template match="/">
    	<xsl:apply-templates select="XML__ReportExtract" />
  	</xsl:template>	
  	
  	<xsl:template match="XML__ReportExtract">  	
		<xsl:apply-templates select="reportExtractSet/REPT__WICR__Extract" />
	</xsl:template>
	
	<xsl:template match="REPT__WICR__Extract">
	
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
		
		<xsl:apply-templates select="detailLine" />
		
		<xsl:text>&#10;</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>State Code Option: </xsl:text><xsl:value-of select="stateCodeOpt" />
		<xsl:text>,Plan Code: </xsl:text><xsl:value-of select="planCode" />
		<xsl:text>,Benefit Type: </xsl:text><xsl:value-of select="planCodeSubType" />
		<xsl:text>,Cov Type: </xsl:text><xsl:value-of select="coverageType" />
		<xsl:text>&#10;</xsl:text>
		<xsl:text>State Code Values: </xsl:text><xsl:value-of select="stateCodeList" />
		
		<xsl:apply-templates select="basisLine" />
		
		<xsl:apply-templates select="reportTotals" />
	</xsl:template>
	
	<xsl:template match="detailLine">
		<xsl:text>&#10;</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>Request Number,Restart Ind,File Date,Start Policy,Stop Policy,Current Policy,Line of Business,Detail Tab,Audit Ind,</xsl:text>
		<xsl:text>Process Control,Table ID,VMR Option,Browse Control,Report Request,Report Table,Table Sequence,</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:value-of select="request" /><xsl:text>,</xsl:text>
		<xsl:value-of select="restart" /><xsl:text>,</xsl:text>
		<xsl:value-of select="fileDate" /><xsl:text>,</xsl:text>
		<xsl:value-of select="startPolicy" /><xsl:text>,</xsl:text>
		<xsl:value-of select="stopPolicy" /><xsl:text>,</xsl:text>
		<xsl:value-of select="currentPolicy" /><xsl:text>,</xsl:text>
		<xsl:value-of select="lob" /><xsl:text>,</xsl:text>
		<xsl:value-of select="detailTable" /><xsl:text>,</xsl:text>
		<xsl:value-of select="auditInd" /><xsl:text>,</xsl:text>
		<xsl:value-of select="processControl" /><xsl:text>,</xsl:text>
		<xsl:value-of select="tableId" /><xsl:text>,</xsl:text>
		<xsl:value-of select="vmrOpt" /><xsl:text>,</xsl:text>
		<xsl:value-of select="browseControl" /><xsl:text>,</xsl:text>
		<xsl:value-of select="reportRequest" /><xsl:text>,</xsl:text>
		<xsl:value-of select="reportTable" /><xsl:text>,</xsl:text>
		<xsl:value-of select="format-number(tableSequence, '0000')" />
	</xsl:template>
	
	<xsl:template match="basisLine">
		<xsl:text>&#10;</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>Basis Code,Interpolation Option,Summarize Code,ABC Summarize (Additional Basis Calculations),</xsl:text>
		
		<xsl:apply-templates select="ADMD__ValuationControl__Entry" />
	</xsl:template>
	
	<xsl:template match="ADMD__ValuationControl__Entry">
		<xsl:text>&#10;</xsl:text>
		<xsl:value-of select="basisCode" /><xsl:text>,</xsl:text>
		<xsl:value-of select="summrzCode" /><xsl:text>,</xsl:text>
		<xsl:value-of select="interpOption" /><xsl:text>,</xsl:text>
		<xsl:value-of select="abcSummrz1" /><xsl:text> </xsl:text>
		<xsl:value-of select="abcSummrz2" /><xsl:text> </xsl:text>
		<xsl:value-of select="abcSummrz3" /><xsl:text> </xsl:text>
		<xsl:value-of select="abcSummrz4" /><xsl:text> </xsl:text>
		<xsl:value-of select="abcSummrz5" /><xsl:text> </xsl:text>
		<xsl:value-of select="abcSummrz6" /><xsl:text> </xsl:text>
		<xsl:value-of select="abcSummrz7" /><xsl:text> </xsl:text>
		<xsl:value-of select="abcSummrz8" /><xsl:text>,</xsl:text>
	</xsl:template>
	
	<xsl:template match="reportTotals">
		<xsl:text>&#10;</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>,,Policy Totals,,</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>,,Number,Units,,Values</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>,CO:,</xsl:text><xsl:value-of select="coCount" /><xsl:text>,</xsl:text>
		<xsl:value-of select="format-number(coUnits, '###,###.000000')" /><xsl:text>,</xsl:text>
		<xsl:text>,LL:,</xsl:text><xsl:value-of select="format-number(llValue, '###,###.00')" /><xsl:text>,</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>,DB:,</xsl:text><xsl:value-of select="dbCount" /><xsl:text>,</xsl:text>
		<xsl:value-of select="format-number(dbUnits, '###,###.000000')" /><xsl:text>,</xsl:text>
		<xsl:text>,SF:,</xsl:text><xsl:value-of select="format-number(sfValue, '###,###.00')" /><xsl:text>,</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>,EX:,</xsl:text><xsl:value-of select="exCount" /><xsl:text>,</xsl:text>
		<xsl:value-of select="format-number(exUnits, '###,###.000000')" /><xsl:text>,</xsl:text>
		<xsl:text>,SU:,</xsl:text><xsl:value-of select="format-number(suValue, '###,###.00000')" /><xsl:text>,</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>,,,,</xsl:text>
		<xsl:text>,AV:,</xsl:text><xsl:value-of select="format-number(avValue, '###,###.00')" /><xsl:text>,</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>,,,,</xsl:text>
		<xsl:text>,Misc:,</xsl:text><xsl:value-of select="format-number(miscValue, '###,###.00')" /><xsl:text>,</xsl:text>
		
		<xsl:text>&#10;</xsl:text>
		<xsl:text>&#10;</xsl:text>
		
		<xsl:text>,,Run Totals,,,,</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>,,Number,Units,,Values,,Policy Count</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>,CO:,</xsl:text><xsl:value-of select="coTtlCount" /><xsl:text>,</xsl:text>
		<xsl:value-of select="format-number(coTtlUnits, '###,###.000000')" /><xsl:text>,</xsl:text>
		<xsl:text>,LL:,</xsl:text><xsl:value-of select="format-number(llTtlValue, '###,###.00')" /><xsl:text>,</xsl:text>
		<xsl:value-of select="policyCount" /><xsl:text>,</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>,DB:,</xsl:text><xsl:value-of select="dbTtlCount" /><xsl:text>,</xsl:text>
		<xsl:value-of select="format-number(dbTtlUnits, '###,###.000000')" /><xsl:text>,</xsl:text>
		<xsl:text>,SF:,</xsl:text><xsl:value-of select="format-number(sfTtlValue, '###,###.00')" /><xsl:text>,</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>,EX:,</xsl:text><xsl:value-of select="exTtlCount" /><xsl:text>,</xsl:text>
		<xsl:value-of select="format-number(exTtlUnits, '###,###.000000')" /><xsl:text>,</xsl:text>
		<xsl:text>,SU:,</xsl:text><xsl:value-of select="format-number(suTtlValue, '###,###.00000')" /><xsl:text>,</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>,,,,</xsl:text>
		<xsl:text>,AV:,</xsl:text><xsl:value-of select="format-number(avTtlValue, '###,###.00')" /><xsl:text>,</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>,,,,</xsl:text>
		<xsl:text>,Misc:,</xsl:text><xsl:value-of select="format-number(miscTtlValue, '###,###.00')" /><xsl:text>,</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>&#10;</xsl:text>
	</xsl:template>
</xsl:stylesheet>
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:output method="text" />
	
	<!-- Support PEIF CSV XSL Transformation Process -->
	
	<xsl:template match="/">
		<xsl:apply-templates select="XML__ReportExtract" />
    	<xsl:apply-templates select="XML__ReportExtract/reportExtractSet" />
  	</xsl:template>	
  	
  	<xsl:template match="XML__ReportExtract">
  		<xsl:text>Company Code:  </xsl:text><xsl:value-of select="companyCode" />
		<xsl:text>&#10;</xsl:text>
		<xsl:text>Company Name:  </xsl:text><xsl:value-of select="companyName" />
		<xsl:text>&#10;</xsl:text>
		<xsl:text>Report Description:  </xsl:text><xsl:value-of select="reportDescription" />
		<xsl:text>&#10;</xsl:text>
		<xsl:text>Report ID:  </xsl:text><xsl:value-of select="reportID" />
		<xsl:text>&#10;</xsl:text>
		<xsl:variable name="from_Month" select="substring(fromDate, 6, 2)"/>
		<xsl:variable name="from_Day" select="substring(fromDate, 9)"/>
		<xsl:variable name="from_Year" select="substring(fromDate, 1, 4)"/>
		<xsl:variable name="from_Date" select="concat($from_Month, '-', $from_Day, '-', $from_Year)" />
		<xsl:text>From Date:  </xsl:text><xsl:value-of select="$from_Date" />
		<xsl:text>&#10;</xsl:text>
		<xsl:variable name="thru_Month" select="substring(thruDate, 6, 2)"/>
		<xsl:variable name="thru_Day" select="substring(thruDate, 9)"/>
		<xsl:variable name="thru_Year" select="substring(thruDate, 1, 4)"/>
		<xsl:variable name="thru_Date" select="concat($thru_Month, '-', $thru_Day, '-', $thru_Year)" />
		<xsl:text>Thru Date:  </xsl:text><xsl:value-of select="$thru_Date" />
		<xsl:text>&#10;</xsl:text>
		<xsl:variable name="report_Month" select="substring(reportDate, 6, 2)"/>
		<xsl:variable name="report_Day" select="substring(reportDate, 9)"/>
		<xsl:variable name="report_Year" select="substring(reportDate, 1, 4)"/>
		<xsl:variable name="report_Date" select="concat($report_Month, '-', $report_Day, '-', $report_Year)" />
		<xsl:text>Report Date:  </xsl:text><xsl:value-of select="$report_Date" />
		<xsl:text>&#10;</xsl:text>
	    <xsl:text>Report Time:  </xsl:text><xsl:value-of select="reportTime" />
		<xsl:text>&#10;</xsl:text>
		<xsl:text>Printed By:  </xsl:text><xsl:value-of select="printedBy" />	
		<xsl:text>&#10;</xsl:text>		
		<xsl:text>&#10;</xsl:text>		
  	</xsl:template>	
  	
  	<xsl:template match="reportExtractSet">
		<xsl:apply-templates select="REPT__PEIF__GenerateExtract" />
	</xsl:template>
	
  	<xsl:template match="REPT__PEIF__GenerateExtract">  

		<xsl:if test="autoBalance != ''">
			<xsl:text>&#10;</xsl:text>
			<xsl:text>AUTO BALANCING IS </xsl:text><xsl:value-of select="autoBalance" />	
		</xsl:if>
		
		<xsl:if test="processMessage != ''">
			<xsl:text>&#10;</xsl:text>
			<xsl:value-of select="processMessage" />
		</xsl:if>
		
		<xsl:if test="startDate != '' or stopDate != ''">
			<xsl:text>&#10;</xsl:text>
			<xsl:text>EXHIBIT START DATE IS </xsl:text>
			<xsl:variable name="month1" select="substring(startDate, 6, 2)"/>
			<xsl:variable name="day1" select="substring(startDate, 9)"/>
			<xsl:variable name="year1" select="substring(startDate, 1, 4)"/>
			<xsl:variable name="date1" select="concat($month1, '-', $day1, '-', $year1)" />
			<xsl:value-of select="$date1" />	
			<xsl:text> STOP DATE IS </xsl:text>
			<xsl:variable name="month2" select="substring(stopDate, 6, 2)"/>
			<xsl:variable name="day2" select="substring(stopDate, 9)"/>
			<xsl:variable name="year2" select="substring(stopDate, 1, 4)"/>
			<xsl:variable name="date2" select="concat($month2, '-', $day2, '-', $year2)" />
			<xsl:value-of select="$date2" />
		</xsl:if>

		<xsl:if test="stateOption != ''">
			<xsl:text>&#10;</xsl:text>
			<xsl:value-of select="stateOption" />
		</xsl:if>
		
		<xsl:if test="states1 != ''">
			<xsl:text>&#10;</xsl:text>
			<xsl:value-of select="states1" />
		</xsl:if>
		
		<xsl:if test="states2 != ''">
			<xsl:text>&#10;</xsl:text>
			<xsl:value-of select="states2" />
		</xsl:if>
		
		<xsl:if test="numberOfBefore != ''">
			<xsl:text>&#10;</xsl:text>
			<xsl:value-of select="numberOfBefore" /><xsl:text> RECORDS WERE PROCESSED FROM THE PREVIOUS FILE</xsl:text>
		</xsl:if>
		
		<xsl:if test="numberOfAfter != ''">
			<xsl:text>&#10;</xsl:text>
			<xsl:value-of select="numberOfAfter" /><xsl:text> RECORDS WERE PROCESSED FROM THE CURRENT FILE</xsl:text>
		</xsl:if>
		
		<xsl:if test="numberOfExhibit != ''">
			<xsl:text>&#10;</xsl:text>
			<xsl:value-of select="numberOfExhibit" /><xsl:text> RECORDS WERE PROCESSED FROM THE EXHIBIT FILE</xsl:text>
		</xsl:if>
		
		<xsl:if test="pebeMessage != ''">
			<xsl:text>&#10;</xsl:text>
			<xsl:value-of select="pebeMessage" />
		</xsl:if>	
		
		<xsl:if test="peerMessage != ''">
			<xsl:text>&#10;</xsl:text>
			<xsl:value-of select="peerMessage" />
		</xsl:if>
		
		<xsl:text>&#10;</xsl:text>
			
		<xsl:apply-templates select="__REPT__PEIF__Total__EntrySet/REPT__PEIF__Total__Entry" />
		
		<xsl:text>&#10;</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>**********************************************************</xsl:text><xsl:text>&#10;</xsl:text>
		<xsl:text>*****************END OF REPORT********************</xsl:text><xsl:text>&#10;</xsl:text>
		<xsl:text>**********************************************************</xsl:text><xsl:text>&#10;</xsl:text>
		<xsl:text>&#10;</xsl:text>
		
	</xsl:template>
	
	<xsl:template match="REPT__PEIF__Total__Entry">

		<xsl:text>&#10;</xsl:text>
		<xsl:text>**********</xsl:text>
		<xsl:value-of select="../../heading1" />
		<xsl:text>**********</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>**********</xsl:text>
		<xsl:value-of select="../../heading2" />
		<xsl:text>**********</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>&#10;</xsl:text>
		
		<xsl:text>,</xsl:text>
		<xsl:text>,</xsl:text><xsl:value-of select="header1" />
		<xsl:text>,</xsl:text><xsl:value-of select="header2" />
		<xsl:text>,</xsl:text><xsl:value-of select="header3" />
		<xsl:text>,</xsl:text><xsl:value-of select="header4" />
		<xsl:text>,</xsl:text><xsl:value-of select="header5" />
		
		<xsl:apply-templates select="__REPT__PEIF__Line__EntrySet/REPT__PEIF__Line__Entry" />
	</xsl:template>
	
	<xsl:template match="REPT__PEIF__Line__Entry">
		<xsl:text>&#10;</xsl:text>
		<xsl:value-of select="messageLine" />
		<xsl:apply-templates select="__REPT__PEIF__Line__DetailSet/REPT__PEIF__Line__Detail" />
	</xsl:template>
		
	<xsl:template match="REPT__PEIF__Line__Detail">
		<xsl:text>&#10;</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:value-of select="detailMessage" /><xsl:text>,</xsl:text>
		<xsl:value-of select="policyCount" /><xsl:text>,</xsl:text>
		<xsl:value-of select="faceAmount" /><xsl:text>,</xsl:text>
		<xsl:value-of select="corridor" /><xsl:text>,</xsl:text>
		<xsl:value-of select="cashValueNetPrem" /><xsl:text>,</xsl:text>
		<xsl:value-of select="deathBenefit" />
	</xsl:template>	
</xsl:stylesheet>
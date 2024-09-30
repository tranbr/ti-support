<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:output method="text" />	
	<!-- Support SPIS CSV XSL Transformation Process --> 
 	<xsl:template match="/">
    	<xsl:apply-templates select="XML__ReportExtract" />
    	<xsl:apply-templates select="XML__ReportExtract/reportExtractSet" />
    	<xsl:apply-templates select="XML__ReportExtract/totals" />
  	</xsl:template>		
	<xsl:template match="XML__ReportExtract">  
	    <xsl:text>"Company Code:" </xsl:text><xsl:value-of select="./companyCode" /><xsl:text>,</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>"Company Name:" </xsl:text><xsl:text>"</xsl:text><xsl:value-of select="./companyName" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>"Report Description: " </xsl:text><xsl:text>"</xsl:text><xsl:value-of select="./reportDescription" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
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
		<xsl:apply-templates select="AGWK__ReportMaster" />
	</xsl:template>
	
	<xsl:template match="AGWK__ReportMaster">
	
	    <xsl:if test= "preceding-sibling::AGWK__ReportMaster[position()=1]/agent != agent or position() = 1">
	    	<xsl:text>,</xsl:text>
	    	<xsl:text>"</xsl:text><xsl:value-of select="concat('AGENT ', agent)" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
	    	<xsl:text>,</xsl:text>
	    	<xsl:text>,</xsl:text>
	    	<xsl:text>,</xsl:text>
	    	<xsl:text>,</xsl:text>
	    	<xsl:text>,</xsl:text>
	    	<xsl:text>"</xsl:text><xsl:value-of select="concat('AGENCY ', agency)" /><xsl:text>"</xsl:text><xsl:text>&#10;</xsl:text>
	    	<xsl:text>,</xsl:text>
	    	<xsl:text>"</xsl:text><xsl:value-of select="agentName" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
	    	<xsl:text>,</xsl:text>
	    	<xsl:text>,</xsl:text>
	    	<xsl:text>,</xsl:text>
	    	<xsl:text>,</xsl:text>
	    	<xsl:text>,</xsl:text>
	    	<xsl:text>"</xsl:text><xsl:value-of select="agencyName" /><xsl:text>"</xsl:text><xsl:text>&#10;</xsl:text>
	        <xsl:text>,</xsl:text>
	    	<xsl:text>"</xsl:text><xsl:value-of select="agentStreet" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
	    	<xsl:text>,</xsl:text>
	    	<xsl:text>,</xsl:text>
	    	<xsl:text>,</xsl:text>
	    	<xsl:text>,</xsl:text>
	    	<xsl:text>,</xsl:text>
	    	<xsl:text>"</xsl:text><xsl:value-of select="agencyStreet" /><xsl:text>"</xsl:text><xsl:text>&#10;</xsl:text>
	    	<xsl:text>,</xsl:text>
	    	<xsl:text>"</xsl:text><xsl:value-of select="agentCity" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
	    	<xsl:text>,</xsl:text>
	    	<xsl:text>,</xsl:text>
	    	<xsl:text>,</xsl:text>
	    	<xsl:text>,</xsl:text>
	    	<xsl:text>,</xsl:text>
	    	<xsl:text>"</xsl:text><xsl:value-of select="agencyCity" /><xsl:text>"</xsl:text><xsl:text>&#10;</xsl:text>
	        <xsl:text>,</xsl:text>
	    	<xsl:text>"</xsl:text><xsl:value-of select="agentAddr3" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
	    	<xsl:text>,</xsl:text>
	    	<xsl:text>,</xsl:text>
	    	<xsl:text>,</xsl:text>
	    	<xsl:text>,</xsl:text>
	    	<xsl:text>,</xsl:text>
	    	<xsl:text>"</xsl:text><xsl:value-of select="agencyAddr3" /><xsl:text>"</xsl:text><xsl:text>&#10;</xsl:text>
	    	<xsl:text>,</xsl:text>
	    	<xsl:text>"</xsl:text><xsl:value-of select="agentAddr4" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
	    	<xsl:text>,</xsl:text>
	    	<xsl:text>,</xsl:text>
	    	<xsl:text>,</xsl:text>
	    	<xsl:text>,</xsl:text>
	    	<xsl:text>,</xsl:text>
	    	<xsl:text>"</xsl:text><xsl:value-of select="agencyAddr4" /><xsl:text>"</xsl:text><xsl:text>&#10;</xsl:text>
	    	<xsl:text>&#10;</xsl:text>
		    <xsl:text>"CO."</xsl:text><xsl:text>,</xsl:text>
			<xsl:text>"POLICY"</xsl:text><xsl:text>,</xsl:text>
			<xsl:text>"UW"</xsl:text><xsl:text>,</xsl:text>
			<xsl:text>"PROPOSED"</xsl:text><xsl:text>,</xsl:text>
			<xsl:text>"RQRMNT"</xsl:text><xsl:text>,</xsl:text>
			<xsl:text>"SINCE"</xsl:text><xsl:text>,</xsl:text>
			<xsl:text>"NEXT"</xsl:text><xsl:text>,</xsl:text>
			<xsl:text>"OP/CL"</xsl:text><xsl:text>,</xsl:text>
			<xsl:text>"CASH"</xsl:text><xsl:text>,</xsl:text>
			<xsl:text>"ACTUAL"</xsl:text><xsl:text>&#10;</xsl:text>
		    <xsl:text>"CDE"</xsl:text><xsl:text>,</xsl:text>
			<xsl:text>"NUMBER"</xsl:text><xsl:text>,</xsl:text>
			<xsl:text>"ID"</xsl:text><xsl:text>,</xsl:text>
			<xsl:text>"INSURED"</xsl:text><xsl:text>,</xsl:text>
			<xsl:text>"TYP/DSC"</xsl:text><xsl:text>,</xsl:text>
			<xsl:text>"MO-DA"</xsl:text><xsl:text>,</xsl:text>
			<xsl:text>"MO-DA"</xsl:text><xsl:text>,</xsl:text>
			<xsl:text>"IND"</xsl:text><xsl:text>,</xsl:text>
			<xsl:text>"WITH APP"</xsl:text><xsl:text>,</xsl:text>
			<xsl:text>"VOLUME"</xsl:text><xsl:text>,</xsl:text>
			<xsl:text>&#10;</xsl:text>
			<xsl:text>&#10;</xsl:text>
			<xsl:text>"</xsl:text><xsl:value-of select="compCode" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
			<xsl:text>"</xsl:text><xsl:value-of select="policyNum" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
			<xsl:text>"</xsl:text><xsl:value-of select="uwID" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
			<xsl:text>,</xsl:text>
			<xsl:text>,</xsl:text>
			<xsl:text>"</xsl:text><xsl:value-of select="sinceMoDa" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
			<xsl:text>"</xsl:text><xsl:value-of select="nextMoDa" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
			<xsl:text>"</xsl:text><xsl:value-of select="opClInd" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
			<xsl:text>"</xsl:text><xsl:value-of select="cashWithApp" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
			<xsl:text>"</xsl:text><xsl:value-of select="actualVolume" /><xsl:text>"</xsl:text><xsl:text>&#10;</xsl:text>
		    <xsl:text>,</xsl:text>
			<xsl:text>,</xsl:text>
			<xsl:text>,</xsl:text>
			<xsl:text>"</xsl:text><xsl:value-of select="proposedIns" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
			<xsl:text>"</xsl:text><xsl:value-of select="substring-before(concat(stringRqrmntConcat/string[1],':'), ':')"/><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
			<xsl:text>"</xsl:text><xsl:value-of select="substring-after(concat(stringRqrmntConcat/string[1],''),':')"/><xsl:text>"</xsl:text><xsl:text>,</xsl:text>  			
			<xsl:for-each select="stringRqrmntConcat/string">
				<xsl:if test="position() > 1">
					<xsl:text>&#10;</xsl:text>
					<xsl:text>,</xsl:text>
					<xsl:text>,</xsl:text>
					<xsl:text>,</xsl:text>
					<xsl:text>,</xsl:text>
					<xsl:text>"</xsl:text><xsl:value-of select="substring-before(concat(.,':'), ':')"/><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
				    <xsl:text>"</xsl:text><xsl:value-of select="substring-after(concat(.,''),':')"/><xsl:text>"</xsl:text><xsl:text>,</xsl:text> 
				</xsl:if>
			</xsl:for-each>
			<xsl:text>&#10;</xsl:text>
			<xsl:text>&#10;</xsl:text>
        </xsl:if>

		<xsl:if test= "preceding-sibling::AGWK__ReportMaster[position()=1]/agent = agent and preceding-sibling::AGWK__ReportMaster[position()=1]/policyNum != policyNum">
			<xsl:text>"</xsl:text><xsl:value-of select="compCode" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
			<xsl:text>"</xsl:text><xsl:value-of select="policyNum" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
			<xsl:text>"</xsl:text><xsl:value-of select="uwID" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
			<xsl:text>,</xsl:text>
			<xsl:text>,</xsl:text>
			<xsl:text>"</xsl:text><xsl:value-of select="sinceMoDa" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
			<xsl:text>"</xsl:text><xsl:value-of select="nextMoDa" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
			<xsl:text>"</xsl:text><xsl:value-of select="opClInd" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
			<xsl:text>"</xsl:text><xsl:value-of select="cashWithApp" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
			<xsl:text>"</xsl:text><xsl:value-of select="actualVolume" /><xsl:text>"</xsl:text><xsl:text>&#10;</xsl:text>
		    <xsl:text>,</xsl:text>
			<xsl:text>,</xsl:text>
			<xsl:text>,</xsl:text>
			<xsl:text>"</xsl:text><xsl:value-of select="proposedIns" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
			<xsl:text>"</xsl:text><xsl:value-of select="substring-before(concat(stringRqrmntConcat/string[1],':'), ':')"/><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
			<xsl:text>"</xsl:text><xsl:value-of select="substring-after(concat(stringRqrmntConcat/string[1],''),':')"/><xsl:text>"</xsl:text><xsl:text>,</xsl:text>  
			<xsl:for-each select="stringRqrmntConcat/string">
				<xsl:if test="position() > 1">
					<xsl:text>&#10;</xsl:text>
					<xsl:text>,</xsl:text>
					<xsl:text>,</xsl:text>
					<xsl:text>,</xsl:text>
					<xsl:text>,</xsl:text>
					<xsl:text>"</xsl:text><xsl:value-of select="substring-before(concat(.,':'), ':')"/><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
				    <xsl:text>"</xsl:text><xsl:value-of select="substring-after(concat(.,''),':')"/><xsl:text>"</xsl:text><xsl:text>,</xsl:text> 
				</xsl:if>
			</xsl:for-each>
			<xsl:text>&#10;</xsl:text>
			<xsl:text>&#10;</xsl:text>
        </xsl:if>
        
        <xsl:if test= "not(following-sibling::AGWK__ReportMaster[position()=1]/agent = agent) and position() != last()">
		    <xsl:text>&#10;</xsl:text>
		  	<xsl:text>"SUBMITTED PENDING ISSUE TOTALS"</xsl:text><xsl:text>,</xsl:text>
		  	<xsl:text>,</xsl:text>
		  	<xsl:text>,</xsl:text>
		  	<xsl:text>,</xsl:text>
		  	<xsl:text>,</xsl:text>
		  	<xsl:text>,</xsl:text>
		  	<xsl:text>"ISSUED PENDING DELIVERY TOTALS"</xsl:text><xsl:text>&#10;</xsl:text>
		  	<xsl:text>"DAYS"</xsl:text><xsl:text>,</xsl:text>
		  	<xsl:text>"CASES"</xsl:text><xsl:text>,</xsl:text>
		  	<xsl:text>"VOLUME"</xsl:text><xsl:text>,</xsl:text>
		  	<xsl:text>,</xsl:text>
		  	<xsl:text>,</xsl:text>
		  	<xsl:text>,</xsl:text>
		  	<xsl:text>"DAYS"</xsl:text><xsl:text>,</xsl:text>
		  	<xsl:text>"CASES"</xsl:text><xsl:text>,</xsl:text>
		  	<xsl:text>"VOLUME"</xsl:text><xsl:text>&#10;</xsl:text>
		  	<xsl:text>"00-07"</xsl:text><xsl:text>,</xsl:text>
		  	<xsl:text>"</xsl:text><xsl:value-of select="stringSubmCases/string[1]" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		  	<xsl:text>"</xsl:text><xsl:value-of select="stringSubmVolume/string[1]" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		  	<xsl:text>,</xsl:text>
		  	<xsl:text>,</xsl:text>
		  	<xsl:text>,</xsl:text>
		  	<xsl:text>"00-07"</xsl:text><xsl:text>,</xsl:text>
		  	<xsl:text>"</xsl:text><xsl:value-of select="stringIssueCases/string[1]" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		  	<xsl:text>"</xsl:text><xsl:value-of select="stringIssueVolume/string[1]" /><xsl:text>"</xsl:text><xsl:text>&#10;</xsl:text>
		  	<xsl:text>"08-14"</xsl:text><xsl:text>,</xsl:text>
		  	<xsl:text>"</xsl:text><xsl:value-of select="stringSubmCases/string[2]" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		  	<xsl:text>"</xsl:text><xsl:value-of select="stringSubmVolume/string[2]" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		  	<xsl:text>,</xsl:text>
		  	<xsl:text>,</xsl:text>
		  	<xsl:text>,</xsl:text>
		  	<xsl:text>"08-14"</xsl:text><xsl:text>,</xsl:text>
		  	<xsl:text>"</xsl:text><xsl:value-of select="stringIssueCases/string[2]" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		  	<xsl:text>"</xsl:text><xsl:value-of select="stringIssueVolume/string[2]" /><xsl:text>"</xsl:text><xsl:text>&#10;</xsl:text>
		    <xsl:text>"15-21"</xsl:text><xsl:text>,</xsl:text>
		  	<xsl:text>"</xsl:text><xsl:value-of select="stringSubmCases/string[3]" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		  	<xsl:text>"</xsl:text><xsl:value-of select="stringSubmVolume/string[3]" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		  	<xsl:text>,</xsl:text>
		  	<xsl:text>,</xsl:text>
		  	<xsl:text>,</xsl:text>
		  	<xsl:text>"15-21"</xsl:text><xsl:text>,</xsl:text>
		  	<xsl:text>"</xsl:text><xsl:value-of select="stringIssueCases/string[3]" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		  	<xsl:text>"</xsl:text><xsl:value-of select="stringIssueVolume/string[3]" /><xsl:text>"</xsl:text><xsl:text>&#10;</xsl:text>
		    <xsl:text>"22-30"</xsl:text><xsl:text>,</xsl:text>
		  	<xsl:text>"</xsl:text><xsl:value-of select="stringSubmCases/string[4]" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		  	<xsl:text>"</xsl:text><xsl:value-of select="stringSubmVolume/string[4]" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		  	<xsl:text>,</xsl:text>
		  	<xsl:text>,</xsl:text>
		  	<xsl:text>,</xsl:text>
		  	<xsl:text>"22-30"</xsl:text><xsl:text>,</xsl:text>
		  	<xsl:text>"</xsl:text><xsl:value-of select="stringIssueCases/string[4]" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		  	<xsl:text>"</xsl:text><xsl:value-of select="stringIssueVolume/string[4]" /><xsl:text>"</xsl:text><xsl:text>&#10;</xsl:text>
		  	<xsl:text>"31-60"</xsl:text><xsl:text>,</xsl:text>
		  	<xsl:text>"</xsl:text><xsl:value-of select="stringSubmCases/string[5]" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		  	<xsl:text>"</xsl:text><xsl:value-of select="stringSubmVolume/string[5]" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		  	<xsl:text>,</xsl:text>
		  	<xsl:text>,</xsl:text>
		  	<xsl:text>,</xsl:text>
		  	<xsl:text>"31-60"</xsl:text><xsl:text>,</xsl:text>
		  	<xsl:text>"</xsl:text><xsl:value-of select="stringIssueCases/string[5]" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		  	<xsl:text>"</xsl:text><xsl:value-of select="stringIssueVolume/string[5]" /><xsl:text>"</xsl:text><xsl:text>&#10;</xsl:text>
		  	<xsl:text>"61+"</xsl:text><xsl:text>,</xsl:text>
		  	<xsl:text>"</xsl:text><xsl:value-of select="stringSubmCases/string[6]" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		  	<xsl:text>"</xsl:text><xsl:value-of select="stringSubmVolume/string[6]" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		  	<xsl:text>,</xsl:text>
		  	<xsl:text>,</xsl:text>
		  	<xsl:text>,</xsl:text>
		  	<xsl:text>"61+"</xsl:text><xsl:text>,</xsl:text>
		  	<xsl:text>"</xsl:text><xsl:value-of select="stringIssueCases/string[6]" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		  	<xsl:text>"</xsl:text><xsl:value-of select="stringIssueVolume/string[6]" /><xsl:text>"</xsl:text><xsl:text>&#10;</xsl:text>
		    <xsl:text>&#10;</xsl:text>
		    <xsl:text>"TOTAL"</xsl:text><xsl:text>,</xsl:text>
		    <xsl:text>"</xsl:text><xsl:value-of select="tlCasesSi" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		    <xsl:text>"</xsl:text><xsl:value-of select="tlVolumeSi" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		    <xsl:text>,</xsl:text>
		  	<xsl:text>,</xsl:text>
		  	<xsl:text>,</xsl:text>
		  	<xsl:text>"TOTAL"</xsl:text><xsl:text>,</xsl:text>
		  	<xsl:text>"</xsl:text><xsl:value-of select="tlCasesId" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		    <xsl:text>"</xsl:text><xsl:value-of select="tlVolumeId" /><xsl:text>"</xsl:text><xsl:text>&#10;</xsl:text>
		    <xsl:text>"AVERAGE DAYS PENDING"</xsl:text><xsl:text>,</xsl:text>
		    <xsl:text>,</xsl:text>
		    <xsl:text>"</xsl:text><xsl:value-of select="submDays" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
		    <xsl:text>,</xsl:text>
		  	<xsl:text>,</xsl:text>
		  	<xsl:text>,</xsl:text>
		  	<xsl:text>"AVERAGE DAYS PENDING"</xsl:text><xsl:text>,</xsl:text>
		  	<xsl:text>,</xsl:text>
		  	<xsl:text>"</xsl:text><xsl:value-of select="issueDays" /><xsl:text>"</xsl:text>
		  	<xsl:text>&#10;</xsl:text>
		  	<xsl:text>&#10;</xsl:text>
		  	<xsl:text>&#10;</xsl:text>
        </xsl:if>
        
	</xsl:template>
  <xsl:template match="totals">
  	<xsl:text>&#10;</xsl:text>
  	<xsl:text>"SUBMITTED PENDING ISSUE TOTALS"</xsl:text><xsl:text>,</xsl:text>
  	<xsl:text>,</xsl:text>
  	<xsl:text>,</xsl:text>
  	<xsl:text>,</xsl:text>
  	<xsl:text>,</xsl:text>
  	<xsl:text>,</xsl:text>
  	<xsl:text>"ISSUED PENDING DELIVERY TOTALS"</xsl:text><xsl:text>&#10;</xsl:text>
  	<xsl:text>"DAYS"</xsl:text><xsl:text>,</xsl:text>
  	<xsl:text>"CASES"</xsl:text><xsl:text>,</xsl:text>
  	<xsl:text>"VOLUME"</xsl:text><xsl:text>,</xsl:text>
  	<xsl:text>,</xsl:text>
  	<xsl:text>,</xsl:text>
  	<xsl:text>,</xsl:text>
  	<xsl:text>"DAYS"</xsl:text><xsl:text>,</xsl:text>
  	<xsl:text>"CASES"</xsl:text><xsl:text>,</xsl:text>
  	<xsl:text>"VOLUME"</xsl:text><xsl:text>&#10;</xsl:text>
	<xsl:text>"00-07"</xsl:text><xsl:text>,</xsl:text>
	<xsl:text>"</xsl:text><xsl:value-of select="stringSubmCases/string[1]" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
	<xsl:text>"</xsl:text><xsl:value-of select="stringSubmVolume/string[1]" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
	<xsl:text>,</xsl:text>
	<xsl:text>,</xsl:text>
	<xsl:text>,</xsl:text>
	<xsl:text>"00-07"</xsl:text><xsl:text>,</xsl:text>
	<xsl:text>"</xsl:text><xsl:value-of select="stringIssueCases/string[1]" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
	<xsl:text>"</xsl:text><xsl:value-of select="stringIssueVolume/string[1]" /><xsl:text>"</xsl:text><xsl:text>&#10;</xsl:text>
	<xsl:text>"08-14"</xsl:text><xsl:text>,</xsl:text>
	<xsl:text>"</xsl:text><xsl:value-of select="stringSubmCases/string[2]" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
	<xsl:text>"</xsl:text><xsl:value-of select="stringSubmVolume/string[2]" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
	<xsl:text>,</xsl:text>
	<xsl:text>,</xsl:text>
	<xsl:text>,</xsl:text>
	<xsl:text>"08-14"</xsl:text><xsl:text>,</xsl:text>
	<xsl:text>"</xsl:text><xsl:value-of select="stringIssueCases/string[2]" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
	<xsl:text>"</xsl:text><xsl:value-of select="stringIssueVolume/string[2]" /><xsl:text>"</xsl:text><xsl:text>&#10;</xsl:text>
	<xsl:text>"15-21"</xsl:text><xsl:text>,</xsl:text>
	<xsl:text>"</xsl:text><xsl:value-of select="stringSubmCases/string[3]" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
	<xsl:text>"</xsl:text><xsl:value-of select="stringSubmVolume/string[3]" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
	<xsl:text>,</xsl:text>
	<xsl:text>,</xsl:text>
	<xsl:text>,</xsl:text>
	<xsl:text>"15-21"</xsl:text><xsl:text>,</xsl:text>
	<xsl:text>"</xsl:text><xsl:value-of select="stringIssueCases/string[3]" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
	<xsl:text>"</xsl:text><xsl:value-of select="stringIssueVolume/string[3]" /><xsl:text>"</xsl:text><xsl:text>&#10;</xsl:text>
	<xsl:text>"22-30"</xsl:text><xsl:text>,</xsl:text>
	<xsl:text>"</xsl:text><xsl:value-of select="stringSubmCases/string[4]" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
	<xsl:text>"</xsl:text><xsl:value-of select="stringSubmVolume/string[4]" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
	<xsl:text>,</xsl:text>
	<xsl:text>,</xsl:text>
	<xsl:text>,</xsl:text>
	<xsl:text>"22-30"</xsl:text><xsl:text>,</xsl:text>
	<xsl:text>"</xsl:text><xsl:value-of select="stringIssueCases/string[4]" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
	<xsl:text>"</xsl:text><xsl:value-of select="stringIssueVolume/string[4]" /><xsl:text>"</xsl:text><xsl:text>&#10;</xsl:text>
	<xsl:text>"31-60"</xsl:text><xsl:text>,</xsl:text>
	<xsl:text>"</xsl:text><xsl:value-of select="stringSubmCases/string[5]" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
	<xsl:text>"</xsl:text><xsl:value-of select="stringSubmVolume/string[5]" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
	<xsl:text>,</xsl:text>
	<xsl:text>,</xsl:text>
	<xsl:text>,</xsl:text>
	<xsl:text>"31-60"</xsl:text><xsl:text>,</xsl:text>
	<xsl:text>"</xsl:text><xsl:value-of select="stringIssueCases/string[5]" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
	<xsl:text>"</xsl:text><xsl:value-of select="stringIssueVolume/string[5]" /><xsl:text>"</xsl:text><xsl:text>&#10;</xsl:text>
	<xsl:text>"61+"</xsl:text><xsl:text>,</xsl:text>
	<xsl:text>"</xsl:text><xsl:value-of select="stringSubmCases/string[6]" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
	<xsl:text>"</xsl:text><xsl:value-of select="stringSubmVolume/string[6]" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
	<xsl:text>,</xsl:text>
	<xsl:text>,</xsl:text>
	<xsl:text>,</xsl:text>
	<xsl:text>"61+"</xsl:text><xsl:text>,</xsl:text>
	<xsl:text>"</xsl:text><xsl:value-of select="stringIssueCases/string[6]" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
	<xsl:text>"</xsl:text><xsl:value-of select="stringIssueVolume/string[6]" /><xsl:text>"</xsl:text><xsl:text>&#10;</xsl:text>
	<xsl:text>&#10;</xsl:text>
    <xsl:text>"TOTAL"</xsl:text><xsl:text>,</xsl:text>
    <xsl:text>"</xsl:text><xsl:value-of select="tlCasesSi" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
    <xsl:text>"</xsl:text><xsl:value-of select="tlVolumeSi" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
    <xsl:text>,</xsl:text>
  	<xsl:text>,</xsl:text>
  	<xsl:text>,</xsl:text>
  	<xsl:text>"TOTAL"</xsl:text><xsl:text>,</xsl:text>
  	<xsl:text>"</xsl:text><xsl:value-of select="tlCasesId" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
    <xsl:text>"</xsl:text><xsl:value-of select="tlVolumeId" /><xsl:text>"</xsl:text><xsl:text>&#10;</xsl:text>
    <xsl:text>"AVERAGE DAYS PENDING"</xsl:text><xsl:text>,</xsl:text>
    <xsl:text>,</xsl:text>
    <xsl:text>"</xsl:text><xsl:value-of select="avDaysSi" /><xsl:text>"</xsl:text><xsl:text>,</xsl:text>
    <xsl:text>,</xsl:text>
  	<xsl:text>,</xsl:text>
  	<xsl:text>,</xsl:text>
  	<xsl:text>"AVERAGE DAYS PENDING"</xsl:text><xsl:text>,</xsl:text>
  	<xsl:text>,</xsl:text>
  	<xsl:text>"</xsl:text><xsl:value-of select="avDaysID" /><xsl:text>"</xsl:text>
  </xsl:template>
</xsl:stylesheet>
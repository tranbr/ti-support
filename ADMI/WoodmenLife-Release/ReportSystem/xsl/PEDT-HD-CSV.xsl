<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:import href="CSV-UTILS.xsl" />
	<xsl:import href="PEDT-CSV-UTILS.xsl" />	
	<xsl:import href="ADMI-UTILS.xsl" />
	<xsl:output method="text" />	
	<!-- Support HD Section for PEDT CSV XSL Transformation Process -->
	<xsl:template match="/">
    	<xsl:apply-templates select="XML__ReportExtract" />
  	</xsl:template>	
  	<xsl:template match="XML__ReportExtract">
  	    <xsl:call-template name="mainHeader1"/>
	   	<xsl:for-each select="reportExtractSet/PFHD__MasterArea"> 
		   <xsl:call-template name="plhd"/>
		</xsl:for-each>
	</xsl:template>
    <xsl:template name="plhd">  
        <xsl:call-template name="header1"/>
        <xsl:call-template name="header2"/>		
		<xsl:text>Issue State,</xsl:text>	
		<xsl:text>Date 1,</xsl:text>	
		<xsl:text>Date 2,</xsl:text>
		<xsl:text>Date Type,</xsl:text>
		<xsl:text>Premium Table,</xsl:text>
		<xsl:text>Smoker Use,</xsl:text>
		<xsl:text>Smoker Table,</xsl:text>
		<xsl:text>Smoker Percent,</xsl:text>
		<xsl:text>Step Rate Rule,</xsl:text>
		<xsl:text>Step Rate Age,</xsl:text>
		<xsl:text>Step Rate First Percent,</xsl:text>
		<xsl:text>Step Rate Minimum Duration,</xsl:text>
		<xsl:text>Step Rate Final Percent,</xsl:text>
		<xsl:text>HMIS Segment Use,</xsl:text>
		<xsl:text>TRHE Segment Use,</xsl:text>
		<xsl:text>Pending Requirements Table,</xsl:text>
		<xsl:text>Pending Requirements Indicator</xsl:text>
		<xsl:text>&#10;</xsl:text> 		
		<xsl:apply-templates select="__PFHD__EntrySet" />
    </xsl:template>		
    <xsl:template match="PFHD__Entry">	
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
		<xsl:value-of select="__DATE__TYPE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__PREMIUM__TABLE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__SMOKER__USE__CODE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__SMOKER__PREM__TABLE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__SMOKER__PREM__PCT" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__STEP__RT__RULE__CODE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__STEP__RATE__AGE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__STEP__RT__FIRST__PCT" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__STEP__RATE__MIN__DUR" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__STEP__RT__FINAL__PCT" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__HM__TRLR__USE__CODE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__HE__TRLR__USE__CODE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__PENDING__REQ__TABLE" />
		<xsl:text>"</xsl:text>
		<xsl:text>,</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="__PENDING__RQ__ACC__IND" />
		<xsl:text>"</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>*************************</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>Variable 1 Definition,</xsl:text>
		<xsl:text>Variable 1 Use,</xsl:text>
		<xsl:text>Variable 1 Value,</xsl:text>
		<xsl:text>Variable 1 Access,</xsl:text>
		<xsl:text>Variable 1 Out of Net,</xsl:text>
		<xsl:text>Variable 2 Definition,</xsl:text>
		<xsl:text>Variable 2 Use,</xsl:text>
		<xsl:text>Variable 2 Value,</xsl:text>
		<xsl:text>Variable 2 Access,</xsl:text>
		<xsl:text>Variable 2 Out of Net,</xsl:text>
		<xsl:text>Variable 3 Definition,</xsl:text>
		<xsl:text>Variable 3 Use,</xsl:text>
		<xsl:text>Variable 3 Value,</xsl:text>
		<xsl:text>Variable 3 Access,</xsl:text>
		<xsl:text>Variable 3 Out of Net</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:for-each select="__PFHD__SubEntrySet__1/PFHD__SubEntry1" >
			<xsl:choose>
				<xsl:when test="count(preceding-sibling::PFHD__SubEntry1) = 0">
					<xsl:text>"</xsl:text>
					<xsl:value-of select="../../__VARIABLE__1__DEF" />
					<xsl:text>"</xsl:text>
					<xsl:text>,</xsl:text>
					<xsl:text>"</xsl:text>
					<xsl:value-of select="../../__VARIABLE__1__USE" />
					<xsl:text>"</xsl:text>
					<xsl:text>,</xsl:text>
					<xsl:text>"</xsl:text>
					<xsl:value-of select="__VAR__1__VALUE" />
					<xsl:text>"</xsl:text>
					<xsl:text>,</xsl:text>
					<xsl:text>"</xsl:text>
					<xsl:value-of select="__VAR__1__ACCESS" />
					<xsl:text>"</xsl:text>
					<xsl:text>,</xsl:text>
					<xsl:text>"</xsl:text>
					<xsl:value-of select="__VAR__1__OUT__NET" />
					<xsl:text>"</xsl:text>
					<xsl:for-each select="../../__PFHD__SubEntrySet__2/PFHD__SubEntry2">
						<xsl:if test="count(preceding-sibling::PFHD__SubEntry2) = 0">
							<xsl:text>,</xsl:text>
							<xsl:text>"</xsl:text>
							<xsl:value-of select="../../__VARIABLE__2__DEF" />
							<xsl:text>"</xsl:text>
							<xsl:text>,</xsl:text>
							<xsl:text>"</xsl:text>
							<xsl:value-of select="../../__VARIABLE__2__USE" />
							<xsl:text>"</xsl:text>
							<xsl:text>,</xsl:text>
							<xsl:text>"</xsl:text>
							<xsl:value-of select="__VAR__2__VALUE" />
							<xsl:text>"</xsl:text>
							<xsl:text>,</xsl:text>
							<xsl:text>"</xsl:text>
							<xsl:value-of select="__VAR__2__ACCESS" />
							<xsl:text>"</xsl:text>
							<xsl:text>,</xsl:text>
							<xsl:text>"</xsl:text>
							<xsl:value-of select="__VAR__2__OUT__NET" />
							<xsl:text>"</xsl:text>
						</xsl:if>
					</xsl:for-each>
					<xsl:for-each select="../../__PFHD__SubEntrySet__3/PFHD__SubEntry3">
						<xsl:if test="count(preceding-sibling::PFHD__SubEntry3) = 0">
							<xsl:text>,</xsl:text>
							<xsl:text>"</xsl:text>
							<xsl:value-of select="../../__VARIABLE__3__DEF" />
							<xsl:text>"</xsl:text>
							<xsl:text>,</xsl:text>
							<xsl:text>"</xsl:text>
							<xsl:value-of select="../../__VARIABLE__3__USE" />
							<xsl:text>"</xsl:text>
							<xsl:text>,</xsl:text>
							<xsl:text>"</xsl:text>
							<xsl:value-of select="__VAR__3__VALUE" />
							<xsl:text>"</xsl:text>
							<xsl:text>,</xsl:text>
							<xsl:text>"</xsl:text>
							<xsl:value-of select="__VAR__3__ACCESS" />
							<xsl:text>"</xsl:text>
							<xsl:text>,</xsl:text>
							<xsl:text>"</xsl:text>
							<xsl:value-of select="__VAR__3__OUT__NET" />
							<xsl:text>"</xsl:text>
						</xsl:if>
					</xsl:for-each>
					<xsl:text>&#10;</xsl:text> 
				</xsl:when>
				<xsl:otherwise>
					<xsl:if test="normalize-space(__VAR__1__VALUE)">
						<xsl:text>"","","</xsl:text>
						<xsl:value-of select="__VAR__1__VALUE" />
						<xsl:text>"</xsl:text>
						<xsl:text>,</xsl:text>
						<xsl:text>"</xsl:text>
						<xsl:value-of select="__VAR__1__ACCESS" />
						<xsl:text>"</xsl:text>
						<xsl:text>,</xsl:text>
						<xsl:text>"</xsl:text>
						<xsl:value-of select="__VAR__1__OUT__NET" />
						<xsl:text>"</xsl:text>
						<xsl:variable name="counter" select="count(preceding-sibling::PFHD__SubEntry1)" />
						<xsl:for-each select="../../__PFHD__SubEntrySet__2/PFHD__SubEntry2">
							<xsl:if test="count(preceding-sibling::PFHD__SubEntry2) = $counter">
								<xsl:text>,"","",</xsl:text>
								<xsl:text>"</xsl:text>
								<xsl:value-of select="__VAR__2__VALUE" />
								<xsl:text>"</xsl:text>
								<xsl:text>,</xsl:text>
								<xsl:text>"</xsl:text>
								<xsl:value-of select="__VAR__2__ACCESS" />
								<xsl:text>"</xsl:text>
								<xsl:text>,</xsl:text>
								<xsl:text>"</xsl:text>
								<xsl:value-of select="__VAR__2__OUT__NET" />
								<xsl:text>"</xsl:text>
							</xsl:if>
						</xsl:for-each>
						<xsl:for-each select="../../__PFHD__SubEntrySet__3/PFHD__SubEntry3">
							<xsl:if test="count(preceding-sibling::PFHD__SubEntry3) = $counter">
								<xsl:text>,"","",</xsl:text>
								<xsl:text>"</xsl:text>
								<xsl:value-of select="__VAR__3__VALUE" />
								<xsl:text>"</xsl:text>
								<xsl:text>,</xsl:text>
								<xsl:text>"</xsl:text>
								<xsl:value-of select="__VAR__3__ACCESS" />
								<xsl:text>"</xsl:text>
								<xsl:text>,</xsl:text>
								<xsl:text>"</xsl:text>
								<xsl:value-of select="__VAR__3__OUT__NET" />
								<xsl:text>"</xsl:text>
							</xsl:if>
						</xsl:for-each>
					</xsl:if>
					<xsl:variable name="counter" select="count(preceding-sibling::PFHD__SubEntry1)" />
					<xsl:if test="not(normalize-space(__VAR__1__VALUE))">
						<xsl:for-each select="../../__PFHD__SubEntrySet__2/PFHD__SubEntry2">
							<xsl:if test="count(preceding-sibling::PFHD__SubEntry2) = $counter and
										  normalize-space(__VAR__2__VALUE)">
								<xsl:text>"","","","","","","",</xsl:text>
								<xsl:text>"</xsl:text>
								<xsl:value-of select="__VAR__2__VALUE" />
								<xsl:text>"</xsl:text>
								<xsl:text>,</xsl:text>
								<xsl:text>"</xsl:text>
								<xsl:value-of select="__VAR__2__ACCESS" />
								<xsl:text>"</xsl:text>
								<xsl:text>,</xsl:text>
								<xsl:text>"</xsl:text>
								<xsl:value-of select="__VAR__2__OUT__NET" />
								<xsl:text>"</xsl:text>
								<xsl:for-each select="../../__PFHD__SubEntrySet__3/PFHD__SubEntry3">
									<xsl:if test="count(preceding-sibling::PFHD__SubEntry3) = $counter">
										<xsl:text>,"","",</xsl:text>
										<xsl:text>"</xsl:text>
										<xsl:value-of select="__VAR__3__VALUE" />
										<xsl:text>"</xsl:text>
										<xsl:text>,</xsl:text>
										<xsl:text>"</xsl:text>
										<xsl:value-of select="__VAR__3__ACCESS" />
										<xsl:text>"</xsl:text>
										<xsl:text>,</xsl:text>
										<xsl:text>"</xsl:text>
										<xsl:value-of select="__VAR__3__OUT__NET" />
										<xsl:text>"</xsl:text>
									</xsl:if>
								</xsl:for-each>
							</xsl:if>
							<xsl:if test="count(preceding-sibling::PFHD__SubEntry2) = $counter and
										  not(normalize-space(__VAR__2__VALUE))">
								<xsl:for-each select="../../__PFHD__SubEntrySet__3/PFHD__SubEntry3">
									<xsl:if test="count(preceding-sibling::PFHD__SubEntry3) = $counter and
												  normalize-space(__VAR__3__VALUE)">
										<xsl:text>"","","","","","","","","","","","",</xsl:text>
										<xsl:text>"</xsl:text>
										<xsl:value-of select="__VAR__3__VALUE" />
										<xsl:text>"</xsl:text>
										<xsl:text>,</xsl:text>
										<xsl:text>"</xsl:text>
										<xsl:value-of select="__VAR__3__ACCESS" />
										<xsl:text>"</xsl:text>
										<xsl:text>,</xsl:text>
										<xsl:text>"</xsl:text>
										<xsl:value-of select="__VAR__3__OUT__NET" />
										<xsl:text>"</xsl:text>
									</xsl:if>
								</xsl:for-each> 
							</xsl:if>
						</xsl:for-each>
					</xsl:if>
					<xsl:text>&#10;</xsl:text> 
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>
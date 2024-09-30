<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
 	<xsl:import href="ADMI-UTILS.xsl" />
	<xsl:output method="xml" indent="yes" />
	<xsl:template match="XML__ReportExtract">
		<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
			<fo:layout-master-set>
				<fo:simple-page-master master-name="each"					
					page-height="8.5in" page-width="11in" margin-top="0.25in"
					margin-bottom="0.1in" margin-left=".2in" margin-right=".2in">
					<fo:region-body margin-top=".65in" margin-bottom=".1in" />	
					<fo:region-before extent="5.2in" />						
				</fo:simple-page-master>
			</fo:layout-master-set>
			<xsl:apply-templates select="reportExtractSet" />
		</fo:root>
	</xsl:template>
	<xsl:template match="reportExtractSet">
		<xsl:apply-templates select="REPT__SSAV__ReportMaster" />
	</xsl:template>
	<xsl:template match="REPT__SSAV__ReportMaster">
		<fo:page-sequence master-reference="each">
			<fo:flow flow-name="xsl-region-body">
				<fo:table width="100%">
					<fo:table-column column-width="50%" />
					<fo:table-column column-width="50%" />
					<fo:table-body>
						<fo:table-row>
							<fo:table-cell>
								<fo:block text-align="center" font-size="8pt" font-family="sans-serif" font-weight="bold">
									<xsl:value-of select="../../companyName" />
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell>
								<fo:block text-align="center" font-size="8pt" font-family="sans-serif" font-weight="bold">
									<xsl:value-of select="../../reportDescription" />
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block text-align="center" font-size="8pt" font-family="sans-serif" font-weight="bold">
									<xsl:text>Date:</xsl:text>
									<xsl:text>&#xA0;&#xA0;</xsl:text>
									<xsl:variable name="month" select="substring(../../reportDate, 6, 2)"/>
									<xsl:variable name="day" select="substring(../../reportDate, 9)"/>
									<xsl:variable name="year" select="substring(../../reportDate, 1, 4)"/>
									<xsl:variable name="date" select="concat($month, '-', $day, '-', $year)" />
									<xsl:value-of select="$date" />	
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</fo:table-body>
				</fo:table>
				<fo:table width="75%">
					<fo:table-column column-width="50%" /> <!-- Payor address -->
					<fo:table-column column-width="25%" /> <!-- Agent address -->
					<fo:table-body>
						<fo:table-row>
							<fo:table-cell border="none">
								<fo:block font-size="8pt" font-family="sans-serif"
									line-height="2em" background-color="white" color="black"
									text-align="left">
									<xsl:text>Control Number:  </xsl:text>
									<xsl:value-of select="clientReference" />
								</fo:block>
							</fo:table-cell>
							<fo:table-cell border="none">
								<fo:block font-size="8pt" text-align="left">Your agent is:</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell border="none">
								<fo:block font-size="8pt" text-align="left">
									<xsl:value-of select="payorName" />
								</fo:block>
								<fo:block font-size="8pt" text-align="left">
									<xsl:value-of select="payorStreet" />
								</fo:block>
								<xsl:if test="payorAddress2 != ''">
									<fo:block font-size="8pt" text-align="left">
										<xsl:value-of select="payorAddress2" />
									</fo:block>
								</xsl:if>
								<xsl:if test="payorAddress3 != ''">
									<fo:block font-size="8pt" text-align="left">
										<xsl:value-of select="payorAddress3" />
									</fo:block>
								</xsl:if>
								<fo:block font-size="8pt" text-align="left">
									<xsl:value-of select="payorCity" />
								</fo:block>
							</fo:table-cell>
							<fo:table-cell border="none">
								<fo:block font-size="8pt" text-align="left">
									<xsl:value-of select="agentName" />
								</fo:block>
								<fo:block font-size="8pt" text-align="left">
									<xsl:value-of select="agencyStreet" />
								</fo:block>
								<xsl:if test="agencyAddress2 != ''">
									<fo:block font-size="8pt" text-align="left">
										<xsl:value-of select="agencyAddress2" />
									</fo:block>
								</xsl:if>
								<xsl:if test="agencyAddress3 != ''">
									<fo:block font-size="8pt" text-align="left">
										<xsl:value-of select="agencyAddress3" />
									</fo:block>
								</xsl:if>
								<fo:block font-size="8pt" text-align="left">
									<xsl:value-of select="agencyCity" />
								</fo:block>
								<xsl:if test="agencyPhone != ''">
									<fo:block font-size="8pt" text-align="left">
										<xsl:value-of select="agencyPhone" />
									</fo:block>
								</xsl:if>
							</fo:table-cell>
						</fo:table-row>
					</fo:table-body>
				</fo:table>
				<fo:block line-height="4em">
					<fo:leader />
				</fo:block>
				<fo:table width="90%">
					<fo:table-column column-width="5%" /> <!-- Company Code -->
					<fo:table-column column-width="15%" /> <!-- Policy Number -->
					<fo:table-column column-width="20%" /> <!-- Insured's Name -->
					<fo:table-column column-width="10%" /> <!-- ID Number -->
					<fo:table-column column-width="15%" /> <!-- Description -->
					<fo:table-column column-width="15%" /> <!-- Amount -->
					<fo:table-column column-width="10%" /> <!-- Due Date -->
					<fo:table-body>
						<fo:table-row>
							<fo:table-cell border="none">
								<fo:block font-size="8pt" font-weight="bold" text-align="center">Company</fo:block>
							</fo:table-cell>
							<fo:table-cell border="none">
								<fo:block font-size="8pt" font-weight="bold" text-align="center">Policy Number</fo:block>
							</fo:table-cell>
							<fo:table-cell border="none">
								<fo:block font-size="8pt" font-weight="bold" text-align="center">Insured's Name</fo:block>
							</fo:table-cell>
							<fo:table-cell border="none">
								<fo:block font-size="8pt" font-weight="bold" text-align="center">ID Number</fo:block>
							</fo:table-cell>
							<fo:table-cell border="none">
								<fo:block font-size="8pt" font-weight="bold" text-align="center">Description</fo:block>
							</fo:table-cell>
							<fo:table-cell border="none">
								<fo:block font-size="8pt" font-weight="bold" text-align="center">Amount</fo:block>
							</fo:table-cell>
							<fo:table-cell border="none">
								<fo:block font-size="8pt" font-weight="bold" text-align="center">Due Date</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<xsl:apply-templates select="detailEntrySet/REPT__SSAV__ReportDetailEntry" />
					</fo:table-body>
				</fo:table>
				<fo:table width="60%">
					<fo:table-column column-width="30%" />
					<fo:table-column column-width="30%" />
					<fo:table-body>
						<fo:table-row>
							<fo:table-cell>
								<fo:block line-height="2em" font-size="8pt" text-align="right">
									<xsl:text>Please remit this amount:</xsl:text>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block line-height="2em" font-size="8pt" text-align="right">
									<xsl:value-of select="format-number(grandTotal, '$#,###,###,###,##0.00')" />
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</fo:table-body>
				</fo:table>
			</fo:flow>		
		</fo:page-sequence>
	</xsl:template>	
	<xsl:template match="REPT__SSAV__ReportDetailEntry">
		<fo:table-row>
			<fo:table-cell border="none">
				<fo:block font-size="8pt" text-align="center" padding="1pt">
					<xsl:value-of select="company" />
				</fo:block>
			</fo:table-cell>
			<fo:table-cell border="none">
				<fo:block font-size="8pt" text-align="center" padding="1pt"> 
					<xsl:value-of select="policy" />
				</fo:block>
			</fo:table-cell>
			<fo:table-cell border="none">
				<fo:block font-size="8pt" text-align="center" padding="1pt"> 
					<xsl:value-of select="insured" />
				</fo:block>
			</fo:table-cell>
			<fo:table-cell border="none">
				<fo:block font-size="8pt" text-align="center" padding="1pt">
					<xsl:value-of select="idNumber" />
				</fo:block>
			</fo:table-cell>
			<fo:table-cell border="none">
				<fo:block font-size="8pt" text-align="center" padding="1pt">
					<xsl:value-of select="description" />
				</fo:block>
			</fo:table-cell>
			<fo:table-cell border="none">
				<fo:block font-size="8pt" text-align="right" padding="1pt">
					<xsl:value-of select="format-number(amount, '$#,###,###,###,##0.00')" />
				</fo:block>
			</fo:table-cell>		
			<fo:table-cell border="none">
				<xsl:choose>
					<xsl:when test="dueDate != ''">
						<fo:block font-size="8pt" text-align="center" padding="1pt"> 
							<xsl:variable name="month" select="substring(dueDate, 6, 2)"/>
							<xsl:variable name="day" select="substring(dueDate, 9)"/>
							<xsl:variable name="year" select="substring(dueDate, 1, 4)"/>
							<xsl:variable name="date" select="concat($month, '-', $day, '-', $year)" />
							<xsl:value-of select="$date" />	
						</fo:block>
					</xsl:when>
					<xsl:otherwise>
						<fo:block>
							<xsl:text />
						</fo:block>
					</xsl:otherwise>
				</xsl:choose>
			</fo:table-cell>			
		</fo:table-row>	
	</xsl:template>	
</xsl:stylesheet>

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
		<xsl:apply-templates select="BILL__Notice__ReportMaster" />
	</xsl:template>
	<xsl:template match="BILL__Notice__ReportMaster">
		<fo:page-sequence master-reference="each">
			<fo:flow flow-name="xsl-region-body">
				<fo:table width="100%">
					<fo:table-column column-width="50%" />
					<fo:table-column column-width="50%" />
					<fo:table-body>
						<fo:table-row>
							<fo:table-cell>
								<fo:block background-color="white">
									<xsl:variable name="imagePath" select="concat($GRAPHICS-FOLDER, $LOGO-FILENAME)"/>
									<fo:external-graphic content-height="scale-to-fit" scaling="non-uniform">
									 	<xsl:attribute name="src">
									 		<xsl:value-of select="$imagePath" />
									 	</xsl:attribute>
									 	<xsl:attribute name="height">
									 		<xsl:value-of select="$LOGO-HEIGHT" />
									 	</xsl:attribute>
									 	<xsl:attribute name="content-width">
									 		<xsl:value-of select="$LOGO-WIDTH" />
									 	</xsl:attribute>
									 </fo:external-graphic>
								 </fo:block>
							</fo:table-cell>
						</fo:table-row>
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
						<fo:table-row>
							<fo:table-cell>
								<fo:block font-size="10pt" font-family="sans-serif"
									line-height="3em" background-color="white" color="black"
									text-align="center">
									<xsl:text>PREMIUM NOTICE</xsl:text>
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
								<fo:block>
									<xsl:text />
								</fo:block>
							</fo:table-cell>
							<fo:table-cell border="none">
								<fo:block font-size="8pt" text-align="left">If you have questions regarding</fo:block>
								<fo:block font-size="8pt" text-align="left">your policy please contact:</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell border="none">
								<fo:block font-size="8pt" text-align="left">
									<xsl:value-of select="payorName" />
								</fo:block>
							</fo:table-cell>
							<fo:table-cell border="none">
								<fo:block font-size="8pt" text-align="left">
									<xsl:value-of select="agentName" />
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell border="none">
								<fo:block font-size="8pt" text-align="left">
									<xsl:value-of select="payorStreet" />
								</fo:block>
							</fo:table-cell>
							<fo:table-cell border="none">
								<fo:block font-size="8pt" text-align="left">
									<xsl:value-of select="agencyStreet" />
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell border="none">
								<fo:block font-size="8pt" text-align="left">
									<xsl:value-of select="payorCity" />
								</fo:block>
							</fo:table-cell>
							<fo:table-cell border="none">
								<fo:block font-size="8pt" text-align="left">
									<xsl:value-of select="agencyCity" />
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<xsl:if test="agencyPhone != ''">
							<fo:table-row>
								<fo:table-cell border="none">
									<fo:block>
										<xsl:text />
									</fo:block>
								</fo:table-cell>
								<fo:table-cell border="none">
									<fo:block font-size="8pt" text-align="left">
										<xsl:value-of select="agencyPhone" />
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</xsl:if>
					</fo:table-body>
				</fo:table>
				<fo:block line-height="4em">
					<fo:leader />
				</fo:block>
				<fo:block font-size="8pt" font-family="sans-serif"
					line-height="2em" background-color="white" color="black"
					text-align="left">
					<xsl:text>Policy No.  </xsl:text>
					<xsl:value-of select="companyCode" />
					<xsl:text>-</xsl:text>
					<xsl:value-of select="policyNumber" />
				</fo:block>
				<fo:block font-size="8pt" font-family="sans-serif"
					line-height="2em" background-color="white" color="black"
					text-align="left">
					<xsl:text>Insured:  </xsl:text>
					<xsl:value-of select="insuredsName" />
				</fo:block>
				<fo:block font-size="8pt" font-family="sans-serif"
					line-height="2em" background-color="white" color="black"
					text-align="left">
					<xsl:text>Date Due:  </xsl:text>
					<xsl:variable name="month" select="substring(dueDate, 6, 2)"/>
					<xsl:variable name="day" select="substring(dueDate, 9)"/>
					<xsl:variable name="year" select="substring(dueDate, 1, 4)"/>
					<xsl:variable name="date" select="concat($month, '-', $day, '-', $year)" />
					<xsl:value-of select="$date" />	
				</fo:block>
				<fo:table width="60%">
					<fo:table-column column-width="30%" />
					<fo:table-column column-width="30%" />
					<fo:table-body>
						<fo:table-row>
							<fo:table-cell border="none">
								<fo:block line-height="2em" font-size="8pt" text-align="right">
									<xsl:text>Premium Due</xsl:text>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell border="none">
								<fo:block line-height="2em" font-size="8pt" text-align="right">
									<xsl:value-of select="format-number(premiumDue, '$#,###,###,###,##0.00')" />
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<xsl:apply-templates select="detailEntrySet/BILL__Notice__ReportDetailEntry" />
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
								<fo:block line-height="2em" font-size="8pt" text-align="center">
									<xsl:value-of select="format-number(grandTotal, '$#,###,###,###,##0.00')" />
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</fo:table-body>
				</fo:table>
			</fo:flow>		
		</fo:page-sequence>
	</xsl:template>	
	<xsl:template match="BILL__Notice__ReportDetailEntry">
		<fo:table-row>
			<fo:table-cell border="none">
				<fo:block font-size="8pt" text-align="right">
					<xsl:value-of select="description" />
				</fo:block>
			</fo:table-cell>
			<fo:table-cell border="none">
				<fo:block line-height="2em" font-size="8pt" text-align="right">
					<xsl:choose>
						<xsl:when test="contains(dateOrAmount, '-')">
							<xsl:variable name="month" select="substring(dateOrAmount, 6, 2)"/>
							<xsl:variable name="day" select="substring(dateOrAmount, 9)"/>
							<xsl:variable name="year" select="substring(dateOrAmount, 1, 4)"/>
							<xsl:variable name="date" select="concat($month, '-', $day, '-', $year)" />
							<xsl:value-of select="$date" />	
						</xsl:when>
						<xsl:when test="(contains(dateOrAmount, '.'))">
							<xsl:value-of select="format-number(dateOrAmount, '$#,###,###,###,##0.00')" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="dateOrAmount" />
						</xsl:otherwise>
					</xsl:choose>
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
	</xsl:template>	
</xsl:stylesheet>

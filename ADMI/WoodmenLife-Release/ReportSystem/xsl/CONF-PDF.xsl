<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
 	<xsl:import href="ADMI-UTILS.xsl" />
	<xsl:output method="xml" indent="yes" />
	<xsl:template match="XML__ReportExtract">
		<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
			<fo:layout-master-set>
				<fo:simple-page-master master-name="report"
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
		<xsl:apply-templates select="CONF__Notice__ReportMaster" />
	</xsl:template>
	<xsl:template match="CONF__Notice__ReportMaster">
  		<fo:page-sequence master-reference="report" initial-page-number="0" force-page-count="no-force">
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
							<fo:table-cell>
								<fo:block text-align="right" font-size="8pt" font-family="serif" font-weight="bold">
									<fo:block>Page <fo:page-number/> of
										<fo:page-number-citation-last ref-id="{generate-id(.)}"/>
									</fo:block>										
								</fo:block>
								<fo:block text-align="right" font-size="8pt" font-family="serif" font-weight="bold">
									<xsl:text>&#10;</xsl:text>
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
								<fo:block font-size="8pt" font-family="sans-serif"
								 line-height="2em" background-color="white" color="black"
							     text-align="left">
									<xsl:text>Policy No.  </xsl:text>
									<xsl:value-of select="policyNumber" />
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell>
								<fo:block font-size="8pt" font-family="sans-serif"
								 line-height="2em" background-color="white" color="black"
								 text-align="left">
									<xsl:text>Insured:  </xsl:text>
									<xsl:value-of select="insuredsName" />
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell>
								<fo:block line-height="2em">
									<fo:leader />
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell border="none">
								<fo:block font-size="8pt" text-align="left">
									<xsl:value-of select="agentName" />
								</fo:block>
							</fo:table-cell>
							<fo:table-cell border="none">
								<fo:block font-size="8pt" text-align="left">
									<xsl:value-of select="ownerName" />
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell border="none">
								<fo:block font-size="8pt" text-align="left">
									<xsl:value-of select="agencyStreet" />
								</fo:block>
							</fo:table-cell>
							<fo:table-cell border="none">
								<fo:block font-size="8pt" text-align="left">
									<xsl:value-of select="ownerStreet" />
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell border="none">
								<fo:block font-size="8pt" text-align="left">
									<xsl:if test="agencyAddress2 = ''">
										<xsl:value-of select="agencyCity" />
									</xsl:if>
									<xsl:if test="agencyAddress2 != ''">
										<xsl:value-of select="agencyAddress2" />
									</xsl:if>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell border="none">
								<fo:block font-size="8pt" text-align="left">
									<xsl:if test="ownerAddress2 = ''">
										<xsl:value-of select="ownerCity" />
									</xsl:if>
									<xsl:if test="ownerAddress2 != ''">
										<xsl:value-of select="ownerAddress2" />
									</xsl:if>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<xsl:if test="not(agencyAddress3 = '' and ownerAddress3 = '')">
							<fo:table-row>
								<fo:table-cell border="none">
									<fo:block font-size="8pt" text-align="left">
										<xsl:value-of select="agencyAddress3" />
									</fo:block>
								</fo:table-cell>
								<fo:table-cell border="none">
									<fo:block font-size="8pt" text-align="left">
										<xsl:value-of select="ownerAddress3" />
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</xsl:if>
						<xsl:if test="not(agencyAddress4 = '' and ownerAddress4 = '')">
							<fo:table-row>
								<fo:table-cell border="none">
									<fo:block font-size="8pt" text-align="left">
										<xsl:value-of select="agencyAddress4" />
									</fo:block>
								</fo:table-cell>
								<fo:table-cell border="none">
									<fo:block font-size="8pt" text-align="left">
										<xsl:value-of select="ownerAddress4" />
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</xsl:if>
						<fo:table-row>
							<fo:table-cell border="none">
								<fo:block font-size="8pt" text-align="left">
									<xsl:value-of select="agencyPhone" />
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell>
								<fo:block> </fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell>
								<fo:block> </fo:block>
							</fo:table-cell>
						</fo:table-row>
					</fo:table-body>
				</fo:table>
				<fo:block line-height="3em">
					<fo:leader />
				</fo:block>
				<fo:table width="80%">
					<fo:table-column column-width="33%" />
					<fo:table-column column-width="33%" />
					<fo:table-column column-width="14%" />
					<fo:table-body>
						<fo:table-row>
							<fo:table-cell>
								<fo:block font-size="8pt" text-align="left">
									<xsl:text>If you have any questions call:</xsl:text>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block font-size="8pt" text-align="left">
									<xsl:text>Indianapolis Metropolitan Area</xsl:text>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block font-size="8pt" text-align="right">
									<xsl:text>927-6848</xsl:text>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell>
								<fo:block font-size="8pt" text-align="left">
									<xsl:text> </xsl:text>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block font-size="8pt" text-align="left">
									<xsl:text>Indiana (outside Indianapolis metro area)</xsl:text>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block font-size="8pt" text-align="right">
									<xsl:text>1-800-822-9160</xsl:text>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell>
								<fo:block font-size="8pt" text-align="left">
									<xsl:text></xsl:text>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block font-size="8pt" text-align="left">
									<xsl:text>National</xsl:text>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block font-size="8pt" text-align="right">
									<xsl:text>1-800-962-2501</xsl:text>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</fo:table-body>
				</fo:table>
				<fo:block page-break-before="always" />
				<fo:table width="100%">
					<fo:table-column column-width="30%" />
					<fo:table-column column-width="40%" />
					<fo:table-column column-width="30%" />
					<fo:table-body>
						<fo:table-row>
							<fo:table-cell>
								<fo:block>
									<xsl:text> </xsl:text>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block text-align="center" font-size="8pt" font-family="serif" font-weight="bold">
									<xsl:value-of select="../../companyName" />
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block text-align="right" font-size="8pt" font-family="serif" font-weight="bold">
									<fo:block>Page <fo:page-number/> of
										<fo:page-number-citation-last ref-id="{generate-id(.)}"/>
									</fo:block>										
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell>
								<fo:block>
									<xsl:text> </xsl:text>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block text-align="center" font-size="8pt" font-family="serif" font-weight="bold">
									<xsl:value-of select="../../reportDescription" />
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block text-align="right" font-size="8pt" font-family="serif" font-weight="bold">
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
				<fo:block line-height="3em">
					<fo:leader />
				</fo:block>
				<xsl:if test="count(reportEntrySet/CONF__Notice__ReportEntry) > '0'">
					<fo:table width="100%">
						<fo:table-column column-width="6%" /> <!-- Date -->
						<fo:table-column column-width="3.5%" /> <!-- Transaction Code -->
						<fo:table-column column-width="6.5%" /> <!-- Transaction -->
						<fo:table-column column-width="3%" /> <!-- IRS Dist Code -->
						<fo:table-column column-width="3%" /> <!-- Account Type -->
						<fo:table-column column-width="9%" /> <!-- Gross Amount -->
						<fo:table-column column-width="9%" /> <!-- Taxable Amount -->
						<fo:table-column column-width="9%" /> <!-- Expense or Fee Charge -->
						<fo:table-column column-width="6%" /> <!-- Account ID -->
						<fo:table-column column-width="3%" /> <!-- Class Code -->
						<fo:table-column column-width="9%" /> <!-- Allocation by Account -->
						<fo:table-column column-width="8%" /> <!-- Variable Unit Value -->
						<fo:table-column column-width="9%" /> <!-- Units Plus or Minus -->
						<fo:table-column column-width="9%" /> <!-- Units Owed -->
						<fo:table-column column-width="7%" /> <!-- Account Value -->
						<fo:table-header>
							<fo:table-row>
								<fo:table-cell border="solid black 1px">
									<fo:block font-size="8pt" font-weight="bold" text-align="center">Date</fo:block>
								</fo:table-cell>
								<fo:table-cell border="solid black 1px">
									<fo:block font-size="8pt" font-weight="bold" text-align="center">Tran Code</fo:block>
								</fo:table-cell>
								<fo:table-cell border="solid black 1px">
									<fo:block font-size="8pt" font-weight="bold" text-align="center">Transaction</fo:block>
								</fo:table-cell>
								<fo:table-cell border="solid black 1px">
									<fo:block font-size="8pt" font-weight="bold" text-align="center">IRS Dist Code</fo:block>
								</fo:table-cell>
								<fo:table-cell border="solid black 1px">
									<fo:block font-size="8pt" font-weight="bold" text-align="center">Acct Type</fo:block>
								</fo:table-cell>
								<fo:table-cell border="solid black 1px">
									<fo:block font-size="8pt" font-weight="bold" text-align="center">Gross Amount</fo:block>
								</fo:table-cell>
								<fo:table-cell border="solid black 1px">
									<fo:block font-size="8pt" font-weight="bold" text-align="center">Taxable Amount</fo:block>
								</fo:table-cell>
								<fo:table-cell border="solid black 1px">
									<fo:block font-size="8pt" font-weight="bold" text-align="center">Expense or Fee Charge</fo:block>
								</fo:table-cell>
								<fo:table-cell border="solid black 1px">
									<fo:block font-size="8pt" font-weight="bold" text-align="center">Account ID</fo:block>
								</fo:table-cell>
								<fo:table-cell border="solid black 1px">
									<fo:block font-size="8pt" font-weight="bold" text-align="center">CLS</fo:block>
								</fo:table-cell>
								<fo:table-cell border="solid black 1px">
									<fo:block font-size="8pt" font-weight="bold" text-align="center">Allocation by Account</fo:block>
								</fo:table-cell>
								<fo:table-cell border="solid black 1px">
									<fo:block font-size="8pt" font-weight="bold" text-align="center">Variable Unit Value</fo:block>
								</fo:table-cell>
								<fo:table-cell border="solid black 1px">
									<fo:block font-size="8pt" font-weight="bold" text-align="center">Units Plus or Minus</fo:block>
								</fo:table-cell>
								<fo:table-cell border="solid black 1px">
									<fo:block font-size="8pt" font-weight="bold" text-align="center">Units Owed</fo:block>
								</fo:table-cell>										
								<fo:table-cell border="solid black 1px">
									<fo:block font-size="8pt" font-weight="bold" text-align="center">Account Value</fo:block>
								</fo:table-cell>										
							</fo:table-row>
						</fo:table-header>
						<fo:table-body>
							<xsl:apply-templates select="reportEntrySet/CONF__Notice__ReportEntry" />
						</fo:table-body>
					</fo:table>
				</xsl:if>
				<fo:block line-height="4em">
					<fo:leader />
				</fo:block>
				<fo:table width="75%">
					<fo:table-column column-width="50%" />
					<fo:table-column column-width="25%" />
					<fo:table-column column-width="25%" />
					<fo:table-body>
						<fo:table-row>
							<fo:table-cell>
								<fo:block>
									<xsl:text> </xsl:text>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block font-size="8pt" text-align="left" padding="1pt">Total Policy Cash Value</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block font-size="8pt" text-align="right" padding="1pt">
									<xsl:value-of select="format-number(grandTotal, '$###,###,###,###,###.00')" />
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell>
								<fo:block>
									<xsl:text> </xsl:text>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block font-size="8pt" text-align="left" padding="1pt">Cash Surrender Value</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block font-size="8pt" text-align="right" padding="1pt">
									<xsl:value-of select="format-number(surrTotal, '$###,###,###,###,###.00')" />
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</fo:table-body>
				</fo:table>
				<fo:block line-height="2em">
					<fo:leader />
				</fo:block>
				<xsl:if test="count(accountDetailEntrySet/CONF__AccountDetailEntry) > '0'">
					<fo:table width="100%">
						<fo:table-column column-width="50%" />
						<fo:table-column column-width="50%" />
							<fo:table-body>
								<xsl:apply-templates select="accountDetailEntrySet/CONF__AccountDetailEntry"/>
							</fo:table-body>
					</fo:table>
				</xsl:if>
				<fo:block line-height="6em">
					<fo:leader />
				</fo:block>
				<fo:block font-size="8pt" font-family="sans-serif"
				 line-height="2em" background-color="white" color="black"
			     text-align="left">
					<xsl:text>We confirm to you as agent for the principal underwriter, Historic Square Equities, Inc.</xsl:text>
				</fo:block>
				<fo:block font-size="8pt" font-family="sans-serif"
				 line-height="2em" background-color="white" color="black"
			     text-align="left">
					<xsl:text>Please keep this confirmation for your records.</xsl:text>
				</fo:block>
				<fo:block id="{generate-id(.)}"/>
			</fo:flow>
  		</fo:page-sequence>
	</xsl:template>
	<xsl:template match="CONF__Notice__ReportEntry">
		<fo:table-row>
			<fo:table-cell border="solid black 1px">
				<fo:block font-size="8pt" text-align="left" padding="1pt">
					<xsl:variable name="month" select="substring(date, 6, 2)"/>
					<xsl:variable name="day" select="substring(date, 9)"/>
					<xsl:variable name="year" select="substring(date, 1, 4)"/>
					<xsl:variable name="date" select="concat($month, '-', $day, '-', $year)" />
					<xsl:value-of select="$date" />	
				</fo:block>
			</fo:table-cell>
			<fo:table-cell border="solid black 1px">
				<fo:block font-size="8pt" text-align="left" padding="1pt">
					<xsl:value-of select="transCode" />
				</fo:block>
			</fo:table-cell>
			<fo:table-cell border="solid black 1px">
				<fo:block font-size="8pt" text-align="left" padding="1pt">
					<xsl:value-of select="tranDescription" />
				</fo:block>
			</fo:table-cell>
			<fo:table-cell border="solid black 1px">
				<fo:block font-size="8pt" text-align="left" padding="1pt">
					<xsl:value-of select="irsDistCode" />
				</fo:block>
			</fo:table-cell>
			<fo:table-cell border="solid black 1px">
				<fo:block font-size="8pt" text-align="left" padding="1pt">
					<xsl:value-of select="accountType" />
				</fo:block>
			</fo:table-cell>
			<fo:table-cell border="solid black 1px">
				<fo:block font-size="8pt" text-align="right" padding="1pt">
					<xsl:value-of select="format-number(grossAmount, '$##,###,###,##0.00')" />
					<xsl:value-of select="sign" />
				</fo:block>
			</fo:table-cell>
			<fo:table-cell border="solid black 1px">
				<fo:block font-size="8pt" text-align="right" padding="1pt">
					<xsl:value-of select="format-number(taxableAmount, '$##,###,###,##0.00')" />
				</fo:block>
			</fo:table-cell>
			<fo:table-cell border="solid black 1px">
				<fo:block font-size="8pt" text-align="right" padding="1pt">
					<xsl:value-of select="format-number(expenses, '$##,###,###,##0.00')" />
				</fo:block>
			</fo:table-cell>
			<xsl:for-each select="reportSubEntrySet/CONF__Notice__ReportSubEntry">
				<xsl:if test="count(preceding-sibling::CONF__Notice__ReportSubEntry) = 0">
					<fo:table-cell border="solid black 1px">
						<fo:block font-size="8pt" text-align="left" padding="1pt">
							<xsl:value-of select="accountId" />
						</fo:block>
					</fo:table-cell>
					<fo:table-cell border="solid black 1px">
						<fo:block font-size="8pt" text-align="left" padding="1pt">
							<xsl:value-of select="classCode" />
						</fo:block>
					</fo:table-cell>
					<fo:table-cell border="solid black 1px">
						<fo:block font-size="8pt" text-align="right" padding="1pt">
							<xsl:value-of select="format-number(dollarAmount, '$##,###,###,##0.00')" />
						</fo:block>
					</fo:table-cell>
					<xsl:choose>
						<xsl:when test="__SEGMENT__TYPE__CODE != 'F'">
							<fo:table-cell border="solid black 1px">
								<fo:block font-size="8pt" text-align="right" padding="1pt">
									<xsl:value-of select="format-number(price, '##,##0.000000')" />
								</fo:block>
							</fo:table-cell>
						</xsl:when>
						<xsl:otherwise>
							<fo:table-cell border="solid black 1px">
								<fo:block font-size="8pt" text-align="left" padding="1pt">
									<xsl:text> </xsl:text>
								</fo:block>
							</fo:table-cell>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:choose>
						<xsl:when test="__SEGMENT__TYPE__CODE != 'F'">
							<fo:table-cell border="solid black 1px">
								<fo:block font-size="8pt" text-align="right" padding="1pt">
									<xsl:value-of select="format-number(upDownValue, '#,###,##0.000000')" />
								</fo:block>
							</fo:table-cell>
						</xsl:when>
						<xsl:otherwise>
							<fo:table-cell border="solid black 1px">
								<fo:block font-size="8pt" text-align="left" padding="1pt">
									<xsl:text> </xsl:text>
								</fo:block>
							</fo:table-cell>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:choose>
						<xsl:when test="__SEGMENT__TYPE__CODE != 'F'">
							<fo:table-cell border="solid black 1px">
								<fo:block font-size="8pt" text-align="right" padding="1pt">
									<xsl:value-of select="format-number(shares, '#,###,##0.000000')" />
								</fo:block>
							</fo:table-cell>
						</xsl:when>
						<xsl:otherwise>
							<fo:table-cell border="solid black 1px">
								<fo:block font-size="8pt" text-align="left" padding="1pt">
									<xsl:text> </xsl:text>
								</fo:block>
							</fo:table-cell>
						</xsl:otherwise>
					</xsl:choose>
					<fo:table-cell border="solid black 1px">
						<fo:block font-size="8pt" text-align="right" padding="1pt">
							<xsl:value-of select="format-number(remain, '$#,###,##0.00')" />
						</fo:block>
					</fo:table-cell>
				</xsl:if>
			</xsl:for-each>
		</fo:table-row>
		<xsl:apply-templates select="reportSubEntrySet/CONF__Notice__ReportSubEntry"/>
	</xsl:template>
	<xsl:template match="CONF__Notice__ReportSubEntry">
		<xsl:if test="count(preceding-sibling::CONF__Notice__ReportSubEntry) > 0">
			<fo:table-row>
				<fo:table-cell>
					<fo:block>
						<xsl:text> </xsl:text>
					</fo:block>
				</fo:table-cell>
				<fo:table-cell>
					<fo:block>
						<xsl:text> </xsl:text>
					</fo:block>
				</fo:table-cell>
				<fo:table-cell>
					<fo:block>
						<xsl:text> </xsl:text>
					</fo:block>
				</fo:table-cell>
				<fo:table-cell>
					<fo:block>
						<xsl:text> </xsl:text>
					</fo:block>
				</fo:table-cell>
				<fo:table-cell>
					<fo:block>
						<xsl:text> </xsl:text>
					</fo:block>
				</fo:table-cell>
				<fo:table-cell>
					<fo:block>
						<xsl:text> </xsl:text>
					</fo:block>
				</fo:table-cell>
				<fo:table-cell>
					<fo:block>
						<xsl:text> </xsl:text>
					</fo:block>
				</fo:table-cell>
				<fo:table-cell>
					<fo:block>
						<xsl:text> </xsl:text>
					</fo:block>
				</fo:table-cell>
				<fo:table-cell border="solid black 1px">
					<fo:block font-size="8pt" text-align="left" padding="1pt">
						<xsl:value-of select="accountId" />
					</fo:block>
				</fo:table-cell>
				<fo:table-cell border="solid black 1px">
					<fo:block font-size="8pt" text-align="left" padding="1pt">
						<xsl:value-of select="classCode" />
					</fo:block>
				</fo:table-cell>
				<fo:table-cell border="solid black 1px">
					<fo:block font-size="8pt" text-align="right" padding="1pt">
						<xsl:value-of select="format-number(dollarAmount, '$##,###,###,##0.00')" />
					</fo:block>
				</fo:table-cell>
				<xsl:choose>
					<xsl:when test="__SEGMENT__TYPE__CODE != 'F'">
						<fo:table-cell border="solid black 1px">
							<fo:block font-size="8pt" text-align="right" padding="1pt">
								<xsl:value-of select="format-number(price, '##,##0.000000')" />
							</fo:block>
						</fo:table-cell>
					</xsl:when>
					<xsl:otherwise>
						<fo:table-cell border="solid black 1px">
							<fo:block font-size="8pt" text-align="left" padding="1pt">
								<xsl:text> </xsl:text>
							</fo:block>
						</fo:table-cell>
					</xsl:otherwise>
				</xsl:choose>
				<xsl:choose>
					<xsl:when test="__SEGMENT__TYPE__CODE != 'F'">
						<fo:table-cell border="solid black 1px">
							<fo:block font-size="8pt" text-align="right" padding="1pt">
								<xsl:value-of select="format-number(upDownValue, '#,###,##0.000000')" />
							</fo:block>
						</fo:table-cell>
					</xsl:when>
					<xsl:otherwise>
						<fo:table-cell border="solid black 1px">
							<fo:block font-size="8pt" text-align="left" padding="1pt">
								<xsl:text> </xsl:text>
							</fo:block>
						</fo:table-cell>
					</xsl:otherwise>
				</xsl:choose>
				<xsl:choose>
					<xsl:when test="__SEGMENT__TYPE__CODE != 'F'">
						<fo:table-cell border="solid black 1px">
							<fo:block font-size="8pt" text-align="right" padding="1pt">
								<xsl:value-of select="format-number(shares, '#,###,##0.000000')" />
							</fo:block>
						</fo:table-cell>
					</xsl:when>
					<xsl:otherwise>
						<fo:table-cell border="solid black 1px">
							<fo:block font-size="8pt" text-align="left" padding="1pt">
								<xsl:text> </xsl:text>
							</fo:block>
						</fo:table-cell>
					</xsl:otherwise>
				</xsl:choose>
				<fo:table-cell border="solid black 1px">
					<fo:block font-size="8pt" text-align="right" padding="1pt">
						<xsl:value-of select="format-number(remain, '$#,###,##0.00')" />
					</fo:block>
				</fo:table-cell>
			</fo:table-row>
		</xsl:if>
	</xsl:template>
	<xsl:template match="CONF__AccountDetailEntry">
		<xsl:if test="accountIndicator = '1'">
			<fo:table-row>
				<fo:table-cell>
					<fo:block font-size="8pt" text-align="left" padding="1pt">
						<xsl:value-of select="accountName" />
					</fo:block>
				</fo:table-cell>
			</fo:table-row>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
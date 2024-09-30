<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:output method="xml" indent="yes" />

	<!-- Support PEPS CSV XSL Transformation Process -->

	<xsl:template match="XML__ReportExtract">
		<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">

			<fo:layout-master-set>
				<fo:simple-page-master master-name="reportPage"
					page-height="8.5in" page-width="11in" margin-top="0.25in"
					margin-bottom="0.1in" margin-left=".2in" margin-right=".2in">
					<fo:region-body margin-top=".65in" margin-bottom=".1in" />
					<fo:region-before extent="5.2in" />
				</fo:simple-page-master>
			</fo:layout-master-set>

			<fo:page-sequence master-reference="reportPage">
				<fo:static-content flow-name="xsl-region-before">
					<fo:table width="100%">
						<fo:table-column column-width="30%" />
						<fo:table-column column-width="40%" />
						<fo:table-column column-width="30%" />
						<fo:table-body>

							<fo:table-row>
								<fo:table-cell>
									<fo:block text-align="left" font-size="8pt"
										font-family="serif" font-weight="bold">
										<xsl:text>Company: </xsl:text>
										<xsl:text>&#xA0;&#xA0;</xsl:text>
										<xsl:value-of select="companyCode" />
										<xsl:text>&#xA0;&#xA0;</xsl:text>
										<xsl:text> Report ID: </xsl:text>
										<xsl:text>&#xA0;&#xA0;</xsl:text>
										<xsl:value-of select="reportID" />
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block text-align="center" font-size="8pt"
										font-family="sans-serif" font-weight="bold">
										<xsl:value-of select="companyName" />
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block text-align="right" font-size="8pt"
										font-family="serif" font-weight="bold">
										<fo:block>
											Page
											<fo:page-number />
											of
											<fo:page-number-citation ref-id="theEnd" />
										</fo:block>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>

							<fo:table-row>
								<fo:table-cell>
									<fo:block text-align="left" font-size="8pt"
										font-family="serif" font-weight="bold">
										<xsl:text>From:</xsl:text>
										<xsl:text>&#xA0;&#xA0;</xsl:text>
										<xsl:variable name="month" select="substring(fromDate, 6, 2)" />
										<xsl:variable name="day" select="substring(fromDate, 9)" />
										<xsl:variable name="year" select="substring(fromDate, 1, 4)" />
										<xsl:variable name="date"
											select="concat($month, '-', $day, '-', $year)" />
										<xsl:value-of select="$date" />
										<xsl:text>&#xA0;&#xA0;&#xA0;</xsl:text>
										<xsl:text>Thru:</xsl:text>
										<xsl:text>&#xA0;&#xA0;</xsl:text>
										<xsl:variable name="month2" select="substring(thruDate, 6, 2)" />
										<xsl:variable name="day2" select="substring(thruDate, 9)" />
										<xsl:variable name="year2" select="substring(thruDate, 1, 4)" />
										<xsl:variable name="date2"
											select="concat($month2, '-', $day2, '-', $year2)" />
										<xsl:value-of select="$date2" />
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block text-align="center" font-size="8pt"
										font-family="serif" font-weight="bold">
										<xsl:text> </xsl:text>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block text-align="center" font-size="8pt"
										font-family="serif" font-weight="bold">
										<xsl:text> </xsl:text>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>

							<fo:table-row>
								<fo:table-cell>
									<fo:block text-align="left" font-size="8pt"
										font-family="serif" font-weight="bold">
										<xsl:text>Date:</xsl:text>
										<xsl:text>&#xA0;&#xA0;</xsl:text>
										<xsl:variable name="month" select="substring(reportDate, 6, 2)" />
										<xsl:variable name="day" select="substring(reportDate, 9)" />
										<xsl:variable name="year" select="substring(reportDate, 1, 4)" />
										<xsl:variable name="date"
											select="concat($month, '-', $day, '-', $year)" />
										<xsl:value-of select="$date" />
										<xsl:text>&#xA0;&#xA0;&#xA0;</xsl:text>
										<xsl:text>Time:</xsl:text>
										<xsl:value-of select="reportTime" />
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block text-align="center" font-size="8pt"
										font-family="sans-serif" font-weight="bold">
										<xsl:value-of select="reportDescription" />
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block text-align="right" font-size="8pt"
										font-family="serif" font-weight="bold">
										<xsl:text>Printed By:</xsl:text>
										<xsl:value-of select="printedBy" />
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-body>
					</fo:table>
					
					<fo:table width="100%">
						<fo:table-column column-width="25%" />
						<fo:table-column column-width="25%" />
						<fo:table-column column-width="25%" />
						<fo:table-column column-width="25%" />
						<fo:table-body>		
												
							<fo:table-row>
								<fo:table-cell>	
									<fo:block>
            							&#x00A0;
            						</fo:block>
            					</fo:table-cell>
							</fo:table-row>
										
							<fo:table-row>
								<fo:table-cell>
									<fo:block text-align="left" font-size="12pt"
										font-family="sans-serif" font-weight="bold" line-height="1.5em">
										<xsl:text> REPORTING STATE</xsl:text>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block text-align="right" font-size="12pt"
										font-family="sans-serif" font-weight="bold" line-height="1.5em">
										<xsl:text>COUNT</xsl:text>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block text-align="right" font-size="12pt"
										font-family="sans-serif" font-weight="bold" line-height="1.5em">
										<xsl:text>AMOUNT</xsl:text>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
												
							<fo:table-row>
								<fo:table-cell>	
									<fo:block>
            							&#x00A0;
            						</fo:block>
            					</fo:table-cell>
							</fo:table-row>
						</fo:table-body>
					</fo:table>
				</fo:static-content>

				<fo:flow flow-name="xsl-region-body">
					<xsl:apply-templates
						select="reportExtractSet/REPT__PEPS__InforceByState__Extract" />
					<xsl:apply-templates select="totals" />
					<fo:block id="theEnd" />
				</fo:flow>

			</fo:page-sequence>
		</fo:root>
	</xsl:template>

	<xsl:template match="REPT__PEPS__InforceByState__Extract">
		<xsl:apply-templates select="__REPT__PEPS__EntrySet/REPT__PEPS__Entry" />
	</xsl:template>

	<xsl:template match="REPT__PEPS__Entry">

		<xsl:if
			test="count(preceding-sibling::REPT__PEPS__Entry) mod 4 = 0 and
		              count(preceding-sibling::REPT__PEPS__Entry) > 0">
			<fo:block page-break-before="always" />
		</xsl:if>

		<fo:table width="100%">
			<fo:table-column column-width="25%" />
			<fo:table-column column-width="25%" />
			<fo:table-column column-width="25%" />
			<fo:table-column column-width="25%" />
			<fo:table-body>
				
				<fo:table-row>
					<fo:table-cell>	
						<fo:block>
            				&#x00A0;
            			</fo:block>
            		</fo:table-cell>
				</fo:table-row>
				
				<fo:table-row>
					<fo:table-cell>
						<fo:block font-size="10pt" text-align="left" padding="2pt">
							<xsl:value-of select="reportingState" />
							<xsl:text>&#xA0;&#xA0;</xsl:text>
							<xsl:value-of select="stateName" />
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block text-align="right" font-size="10pt">
							<xsl:text> </xsl:text>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block text-align="right" font-size="10pt">
							<xsl:text> </xsl:text>
						</fo:block>
					</fo:table-cell>
				</fo:table-row>

				<fo:table-row>
					<fo:table-cell>
						<fo:block text-align="right" font-size="10pt">
							<xsl:text>Beginning Total:</xsl:text>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block text-align="right" font-size="10pt">
							<xsl:value-of select="format-number(begin, '##,###,##0')" />
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block text-align="right" font-size="10pt">
							<xsl:value-of
								select="format-number(beginAmount, '$##,###,###,###,##0.00')" />
						</fo:block>
					</fo:table-cell>
				</fo:table-row>

				<fo:table-row>
					<fo:table-cell>
						<fo:block text-align="right" font-size="10pt">
							<xsl:text>Issued During Period:</xsl:text>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block text-align="right" font-size="10pt">
							<xsl:value-of select="format-number(issued, '##,###,##0')" />
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block text-align="right" font-size="10pt">
							<xsl:value-of
								select="format-number(issuedAmount, '$##,###,###,###,##0.00')" />
						</fo:block>
					</fo:table-cell>
				</fo:table-row>

				<fo:table-row>
					<fo:table-cell>
						<fo:block text-align="right" font-size="10pt">
							<xsl:text>Increase In Period:</xsl:text>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block text-align="right" font-size="10pt">
							<xsl:value-of select="format-number(increase, '##,###,##0')" />
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block text-align="right" font-size="10pt">
							<xsl:value-of
								select="format-number(increAmount, '$##,###,###,###,##0.00')" />
						</fo:block>
					</fo:table-cell>
				</fo:table-row>

				<fo:table-row>
					<fo:table-cell>
						<fo:block text-align="right" font-size="10pt">
							<xsl:text>Ceased During Period:</xsl:text>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block text-align="right" font-size="10pt">
							<xsl:value-of select="format-number(ceased, '##,###,##0')" />
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block text-align="right" font-size="10pt">
							<xsl:value-of
								select="format-number(ceasedAmount, '$##,###,###,###,##0.00')" />
						</fo:block>
					</fo:table-cell>
				</fo:table-row>

				<fo:table-row>
					<fo:table-cell>
						<fo:block text-align="right" font-size="10pt">
							<xsl:text>Decrease In Period:</xsl:text>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block text-align="right" font-size="10pt">
							<xsl:value-of select="format-number(decrease, '##,###,##0')" />
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block text-align="right" font-size="10pt">
							<xsl:value-of
								select="format-number(decreAmount, '$##,###,###,###,##0.00')" />
						</fo:block>
					</fo:table-cell>
				</fo:table-row>

				<fo:table-row>
					<fo:table-cell>
						<fo:block text-align="right" font-size="10pt">
							<xsl:text>Line 20 PEIF Total In Force:</xsl:text>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block text-align="right" font-size="10pt">
							<xsl:value-of select="format-number(line22, '##,###,##0')" />
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block text-align="right" font-size="10pt">
							<xsl:value-of
								select="format-number(line22Amount, '$##,###,###,###,##0.00')" />
						</fo:block>
					</fo:table-cell>
				</fo:table-row>

				<fo:table-row>
					<fo:table-cell>
						<fo:block text-align="right" font-size="10pt">
							<xsl:text>Actual Total In Force:</xsl:text>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block text-align="right" font-size="10pt">
							<xsl:value-of select="format-number(line31d, '##,###,##0')" />
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block text-align="right" font-size="10pt">
							<xsl:value-of
								select="format-number(line31dAmount, '$##,###,###,###,##0.00')" />
						</fo:block>
					</fo:table-cell>
				</fo:table-row>

				<fo:table-row>
					<fo:table-cell>
						<fo:block text-align="center" font-size="10pt">
							<xsl:text> </xsl:text>
						</fo:block>
					</fo:table-cell>
				</fo:table-row>
			</fo:table-body>
		</fo:table>

	</xsl:template>

	<xsl:template match="totals">
		<fo:table width="100%">
			<fo:table-column column-width="25%" />
			<fo:table-column column-width="25%" />
			<fo:table-column column-width="25%" />
			<fo:table-column column-width="25%" />
			<fo:table-body>
												
				<fo:table-row>
					<fo:table-cell>	
						<fo:block>
            				&#x00A0;
            			</fo:block>
            		</fo:table-cell>
				</fo:table-row>

				<fo:table-row>
					<fo:table-cell>
						<fo:block font-size="10pt" text-align="left" padding="2pt"
							font-weight="bold">
							<xsl:text>TOTALS:</xsl:text>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block text-align="right" font-size="10pt">
							<xsl:text> </xsl:text>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block text-align="right" font-size="10pt">
							<xsl:text> </xsl:text>
						</fo:block>
					</fo:table-cell>
				</fo:table-row>

				<fo:table-row>
					<fo:table-cell>
						<fo:block text-align="right" font-size="10pt">
							<xsl:text>Beginning Total:</xsl:text>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block text-align="right" font-size="10pt">
							<xsl:value-of select="format-number(begin, '##,###,##0')" />
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block text-align="right" font-size="10pt">
							<xsl:value-of
								select="format-number(beginAmount, '$##,###,###,###,##0.00')" />
						</fo:block>
					</fo:table-cell>
				</fo:table-row>

				<fo:table-row>
					<fo:table-cell>
						<fo:block text-align="right" font-size="10pt">
							<xsl:text>Issued During Period:</xsl:text>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block text-align="right" font-size="10pt">
							<xsl:value-of select="format-number(issued, '##,###,##0')" />
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block text-align="right" font-size="10pt">
							<xsl:value-of
								select="format-number(issuedAmount, '$##,###,###,###,##0.00')" />
						</fo:block>
					</fo:table-cell>
				</fo:table-row>

				<fo:table-row>
					<fo:table-cell>
						<fo:block text-align="right" font-size="10pt">
							<xsl:text>Increase In Period:</xsl:text>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block text-align="right" font-size="10pt">
							<xsl:value-of select="format-number(increase, '##,###,##0')" />
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block text-align="right" font-size="10pt">
							<xsl:value-of
								select="format-number(increAmount, '$##,###,###,###,##0.00')" />
						</fo:block>
					</fo:table-cell>
				</fo:table-row>

				<fo:table-row>
					<fo:table-cell>
						<fo:block text-align="right" font-size="10pt">
							<xsl:text>Ceased During Period:</xsl:text>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block text-align="right" font-size="10pt">
							<xsl:value-of select="format-number(ceased, '##,###,##0')" />
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block text-align="right" font-size="10pt">
							<xsl:value-of
								select="format-number(ceasedAmount, '$##,###,###,###,##0.00')" />
						</fo:block>
					</fo:table-cell>
				</fo:table-row>

				<fo:table-row>
					<fo:table-cell>
						<fo:block text-align="right" font-size="10pt">
							<xsl:text>Decrease In Period:</xsl:text>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block text-align="right" font-size="10pt">
							<xsl:value-of select="format-number(decrease, '##,###,##0')" />
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block text-align="right" font-size="10pt">
							<xsl:value-of
								select="format-number(decreAmount, '$##,###,###,###,##0.00')" />
						</fo:block>
					</fo:table-cell>
				</fo:table-row>

				<fo:table-row>
					<fo:table-cell>
						<fo:block text-align="right" font-size="10pt">
							<xsl:text>Line 20 PEIF Total In Force:</xsl:text>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block text-align="right" font-size="10pt">
							<xsl:value-of select="format-number(line22, '##,###,##0')" />
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block text-align="right" font-size="10pt">
							<xsl:value-of
								select="format-number(line22Amount, '$##,###,###,###,##0.00')" />
						</fo:block>
					</fo:table-cell>
				</fo:table-row>

				<fo:table-row>
					<fo:table-cell>
						<fo:block text-align="right" font-size="10pt">
							<xsl:text>Actual Total In Force:</xsl:text>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block text-align="right" font-size="10pt">
							<xsl:value-of select="format-number(line31d, '##,###,##0')" />
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block text-align="right" font-size="10pt">
							<xsl:value-of
								select="format-number(line31dAmount, '$##,###,###,###,##0.00')" />
						</fo:block>
					</fo:table-cell>
				</fo:table-row>

			</fo:table-body>
		</fo:table>
	</xsl:template>
</xsl:stylesheet>
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
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
		<xsl:apply-templates select="REPT__PROP__GenerageExtract" />
	</xsl:template>
		
	<xsl:template match="REPT__PROP__GenerageExtract">
  		<fo:page-sequence master-reference="report" initial-page-number="1" force-page-count="no-force">
			<fo:static-content flow-name="xsl-region-before">
				
				<fo:table width="100%">
					<fo:table-column column-width="25%" />
					<fo:table-column column-width="50%" />
					<fo:table-column column-width="25%" />
						<fo:table-body>

							<fo:table-row>
								<fo:table-cell>	
									<fo:block text-align="left" font-size="9pt" font-family="serif" font-weight="bold">
            							&#x00A0;
            						</fo:block>
            					</fo:table-cell>
							
								<fo:table-cell>
									<fo:block text-align="center" font-size="9pt" font-family="serif" font-weight="bold">
										<xsl:value-of select="header/heading1" />
									</fo:block>
								</fo:table-cell>
							
								<fo:table-cell>
									<fo:block text-align="center" font-size="9pt" font-family="serif" font-weight="bold">
										Page <fo:page-number/> of <fo:page-number-citation-last ref-id="{generate-id(.)}"/>
									</fo:block>															
								</fo:table-cell>
							</fo:table-row>
							
							<fo:table-row>
								<fo:table-cell>	
									<fo:block text-align="left" font-size="9pt" font-family="serif" font-weight="bold">
            							&#x00A0;
            						</fo:block>
            					</fo:table-cell>
            					
								<fo:table-cell>
									<fo:block text-align="center" font-size="9pt" font-family="serif" font-weight="bold">
										<xsl:value-of select="header/heading2" />
									</fo:block>
								</fo:table-cell>
								
								<fo:table-cell>	
									<fo:block text-align="right" font-size="9pt" font-family="serif" font-weight="bold">
            							&#x00A0;
            						</fo:block>
            					</fo:table-cell>
							</fo:table-row>

							<xsl:if test="header/valuesType = 'A' or header/valuesType = 'B'">
								<fo:table-row>
									<fo:table-cell>	
										<fo:block text-align="left" font-size="9pt" font-family="serif" font-weight="bold">
            								&#x00A0;
            							</fo:block>
            						</fo:table-cell>
            						
									<fo:table-cell>
										<fo:block text-align="center" font-size="9pt" font-family="serif" font-weight="bold">
											<xsl:value-of select="header/reportHeading" />
										</fo:block>
									</fo:table-cell>
									
									<fo:table-cell>	
										<fo:block text-align="right" font-size="9pt" font-family="serif" font-weight="bold">
            								&#x00A0;
            							</fo:block>
            						</fo:table-cell>
								</fo:table-row>
							</xsl:if>

							<fo:table-row>
								<fo:table-cell>	
									<fo:block text-align="left" font-size="9pt" font-family="serif" font-weight="bold">
            							&#x00A0;
            						</fo:block>
            					</fo:table-cell>
            					
								<fo:table-cell>
									<fo:block text-align="center" font-size="9pt" font-family="serif" font-weight="bold">
										&#x00A0;
									</fo:block>
								</fo:table-cell>
								
								<fo:table-cell>	
									<fo:block text-align="right" font-size="9pt" font-family="serif" font-weight="bold">
            							&#x00A0;
            						</fo:block>
            					</fo:table-cell>
							</fo:table-row>
					</fo:table-body>
				</fo:table>
				
				<fo:table width="100%">
					<fo:table-column column-width="15%" />
					<fo:table-column column-width="25%" />
					<fo:table-column column-width="25%" />
					<fo:table-column column-width="35%" />
						<fo:table-body>

							<fo:table-row>
								<fo:table-cell>
									<fo:block text-align="right" font-size="9pt" font-family="serif" font-weight="bold">
										<xsl:value-of select="header/propNumDesc" />
										<xsl:text>:&#xA0;&#xA0;</xsl:text>
									</fo:block>
								</fo:table-cell>
							
								<fo:table-cell>
									<fo:block text-align="left" font-size="9pt" font-family="serif" font-weight="bold">
										<xsl:value-of select="header/propNumber" />
									</fo:block>
								</fo:table-cell>
							
								<fo:table-cell>
									<fo:block text-align="right" font-size="9pt" font-family="serif" font-weight="bold">
										<xsl:text>Prepared Date:&#xA0;&#xA0;</xsl:text>
									</fo:block>
								</fo:table-cell>
						
								<fo:table-cell>
									<fo:block text-align="left" font-size="9pt" font-family="serif" font-weight="bold">
										<xsl:variable name="month1" select="substring(header/reportDate, 6, 2)"/>
										<xsl:variable name="day1" select="substring(header/reportDate, 9)"/>
										<xsl:variable name="year1" select="substring(header/reportDate, 1, 4)"/>
										<xsl:variable name="date1" select="concat($month1, '-', $day1, '-', $year1)" />
										<xsl:value-of select="$date1" />	
									</fo:block>						
								</fo:table-cell>
							</fo:table-row>
							
							<fo:table-row>
								<fo:table-cell>
									<fo:block text-align="right" font-size="9pt" font-family="serif" font-weight="bold">
										<xsl:text>Insured Name:&#xA0;&#xA0;</xsl:text>
									</fo:block>
								</fo:table-cell>
							
								<fo:table-cell>
									<fo:block text-align="left" font-size="9pt" font-family="serif" font-weight="bold">
										<xsl:value-of select="header/insuredName" />
									</fo:block>
								</fo:table-cell>
							
								<fo:table-cell>
									<fo:block text-align="right" font-size="9pt" font-family="serif" font-weight="bold">
										<xsl:value-of select="header/amountLit" />
										<xsl:text>&#xA0;&#xA0;</xsl:text>
									</fo:block>
								</fo:table-cell>
						
								<fo:table-cell>
									<fo:block text-align="left" font-size="9pt" font-family="serif" font-weight="bold">
										<xsl:value-of select="format-number(header/initialAmount, '$##,###,###,##0.00')" />
									</fo:block>						
								</fo:table-cell>
							</fo:table-row>
							
							<fo:table-row>
								<fo:table-cell>
									<fo:block text-align="right" font-size="9pt" font-family="serif" font-weight="bold">
										<xsl:text>Issue Age:&#xA0;&#xA0;</xsl:text>
									</fo:block>
								</fo:table-cell>
							
								<fo:table-cell>
									<fo:block text-align="left" font-size="9pt" font-family="serif" font-weight="bold">
										<xsl:value-of select="format-number(header/issueAge, '##0')" />
										<xsl:text>&#xA0;&#xA0;</xsl:text>
										<xsl:value-of select="header/sexType" />
										<xsl:text>&#xA0;&#xA0;</xsl:text>
										<xsl:value-of select="header/policyRate" />
									</fo:block>
								</fo:table-cell>
							
								<fo:table-cell>
									<fo:block text-align="right" font-size="9pt" font-family="serif" font-weight="bold">
										<xsl:value-of select="header/projectionDesc" />
										<xsl:text>&#xA0;&#xA0;</xsl:text>
									</fo:block>
								</fo:table-cell>
						
								<fo:table-cell>
									<fo:block text-align="left" font-size="9pt" font-family="serif" font-weight="bold">
										<xsl:value-of select="format-number(header/premiumAmount, '$##,###,###,##0.00')" />
										<xsl:text>&#xA0;&#xA0;</xsl:text>
										<xsl:value-of select="header/projectionMode" />
									</fo:block>						
								</fo:table-cell>
							</fo:table-row>
							
							<fo:table-row>
								<fo:table-cell>
									<fo:block text-align="right" font-size="9pt" font-family="serif" font-weight="bold">
										<xsl:text>Issue Date:&#xA0;&#xA0;</xsl:text>
									</fo:block>
								</fo:table-cell>
							
								<fo:table-cell>
									<fo:block text-align="left" font-size="9pt" font-family="serif" font-weight="bold">
										<xsl:variable name="month2" select="substring(header/issueDate, 6, 2)"/>
										<xsl:variable name="day2" select="substring(header/issueDate, 9)"/>
										<xsl:variable name="year2" select="substring(header/issueDate, 1, 4)"/>
										<xsl:variable name="date2" select="concat($month2, '-', $day2, '-', $year2)" />
										<xsl:value-of select="$date2" />	
									</fo:block>						
								</fo:table-cell>
							
								<fo:table-cell>
									<fo:block text-align="right" font-size="9pt" font-family="serif" font-weight="bold">
										<xsl:text>Lump Sum Payments:&#xA0;&#xA0;</xsl:text>
									</fo:block>
								</fo:table-cell>
						
								<fo:table-cell>
									<fo:block text-align="left" font-size="9pt" font-family="serif" font-weight="bold">
										<xsl:value-of select="format-number(header/dumpIn, '$##,###,###,##0.00')" />
									</fo:block>						
								</fo:table-cell>
							</fo:table-row>
							
							<fo:table-row>
								<fo:table-cell>
									<fo:block text-align="right" font-size="9pt" font-family="serif" font-weight="bold">
										<xsl:text>Death Ben Option:&#xA0;&#xA0;</xsl:text>
									</fo:block>
								</fo:table-cell>
							
								<fo:table-cell>
									<fo:block text-align="left" font-size="9pt" font-family="serif" font-weight="bold">
										<xsl:value-of select="header/deathBenefitOption" />	
									</fo:block>						
								</fo:table-cell>
							
								<fo:table-cell>
									<fo:block text-align="right" font-size="9pt" font-family="serif" font-weight="bold">
										<xsl:text>Proposal/Reproposal:&#xA0;&#xA0;</xsl:text>
									</fo:block>
								</fo:table-cell>
						
								<fo:table-cell>
									<fo:block text-align="left" font-size="9pt" font-family="serif" font-weight="bold">
										<xsl:value-of select="header/reportType" />	
									</fo:block>						
								</fo:table-cell>
							</fo:table-row>
							
							<!-- //TODO: Header will have more information as PROP expands -->
							
						</fo:table-body>
				</fo:table>
			</fo:static-content>	
				
			<fo:flow flow-name="xsl-region-body">
			
				<fo:block><fo:leader/></fo:block>
				<fo:block><fo:leader/></fo:block>
				<fo:block><fo:leader/></fo:block>
				<fo:block><fo:leader/></fo:block>
				<fo:block><fo:leader/></fo:block>
		
				<xsl:apply-templates select="firstPage" />	
		
				<xsl:apply-templates select="notesPage" />
				
				<xsl:apply-templates select="detailPage2" />
				
				<xsl:apply-templates select="detailPage3" />

				<xsl:apply-templates select="indexLines" />
				
				<fo:block><fo:leader/></fo:block>
				<fo:block><fo:leader/></fo:block>
				
				<!-- TODO: As PROP expands this section will have more output to add -->
				
				<fo:block text-align="left" font-size="9pt" font-family="serif" font-weight="bold">
					<xsl:text>The policy was aged assuming premium payments of </xsl:text>
					<xsl:value-of select="format-number(premiumAmount, '$#,###,###,##0.00')" />	
					<xsl:text> made on a</xsl:text>
					<xsl:value-of select="projectionMode" />	
				</fo:block>
				
				<fo:block text-align="left" font-size="9pt" font-family="serif" font-weight="bold">
					<xsl:text>Guaranteed Values: Based on initial guaranteed interest rate of </xsl:text>
					<xsl:value-of select="format-number(guaranteedInterestRate, '#0.00')" />
					<xsl:text>% and the guaranteed cost of insurance.</xsl:text>	
				</fo:block>
					
				<fo:block text-align="left" font-size="9pt" font-family="serif" font-weight="bold">
					<xsl:text>Midpoint values represent an average of the initial guaranteed and initial disciplined current rates.</xsl:text>	
				</fo:block>
				
				<fo:block text-align="left" font-size="9pt" font-family="serif" font-weight="bold">
					<xsl:text>Non-Guaranteed Values: Based on initial interest rate of </xsl:text>
					<xsl:value-of select="format-number(currentInterestRate, '#0.00')" />
					<xsl:text>% and the current disciplined cost of insurance.</xsl:text>
				</fo:block>
					
				<fo:block text-align="left" font-size="9pt" font-family="serif" font-weight="bold">
					<xsl:text>This projection is an illustration. Interest rates and cost of insurance are subject to change.</xsl:text>	
				</fo:block>
				
				<xsl:if test="borrowInterest > 0.000">
					<fo:block text-align="left" font-size="9pt" font-family="serif" font-weight="bold">
						<xsl:text>Cash values equal to any loan balance will earn interest at a rate of </xsl:text>
						<xsl:value-of select="format-number(borrowInterest, '#0.00')" />
						<xsl:text>%.</xsl:text>	
					</fo:block>
				</xsl:if>
				
				<fo:block text-align="left" font-size="9pt" font-family="serif" font-weight="bold">
					<xsl:text>Any increase in the amount of insurance may require underwriting.</xsl:text>	
				</fo:block>
				
				<fo:block text-align="left" font-size="9pt" font-family="serif" font-weight="bold">
					<xsl:text>This is an illustration, not a contract.</xsl:text>	
				</fo:block>

				<fo:block text-align="left" font-size="9pt" font-family="serif" font-weight="bold">
					<xsl:text>Tamra Premium: </xsl:text>
					<xsl:value-of select="format-number(tamraPremium, '$#,###,###,##0.00')" />	
				</fo:block>
				
				<fo:block id="{generate-id(.)}"/>
			</fo:flow>
		</fo:page-sequence>
	</xsl:template>	
	
	<xsl:template match="firstPage">
			
		<!-- //TODO: Begin first page of output. More output to be added. -->
				
		<fo:table width="100%" >
			<fo:table-column column-width="15%" />
			<fo:table-column column-width="40%" />
			<fo:table-column column-width="50%" />
					
				<fo:table-body>
					
					<fo:table-row>
						<fo:table-cell>
							<fo:block text-align="right" font-size="9pt" font-family="serif" font-weight="bold">
								<xsl:text>Generic Name:&#xA0;&#xA0;</xsl:text>
							</fo:block>
						</fo:table-cell>
								
						<fo:table-cell>
							<fo:block text-align="left" font-size="9pt" font-family="sans-serif" font-weight="bold">
								<xsl:value-of select="genericDescription" />	
							</fo:block>						
						</fo:table-cell>
					</fo:table-row>
							
					<fo:table-row>
						<fo:table-cell>
							<fo:block text-align="right" font-size="9pt" font-family="serif" font-weight="bold">
								<xsl:text>Agent:&#xA0;&#xA0;</xsl:text>
							</fo:block>
						</fo:table-cell>
						
						<fo:table-cell>
							<fo:block text-align="left" font-size="9pt" font-family="serif" font-weight="bold">
								<xsl:value-of select="agentName" />	
							</fo:block>						
						</fo:table-cell>
					</fo:table-row>
							
					<xsl:for-each select="./addressLines">
						<fo:table-row>
							<fo:table-cell>
								<fo:block text-align="right" font-size="9pt" font-family="serif" font-weight="bold">
									&#x00A0;
								</fo:block>
							</fo:table-cell>
						
							<fo:table-cell>
								<fo:block text-align="left" font-size="9pt" font-family="serif" font-weight="bold">
									<xsl:value-of select="string" />	
								</fo:block>						
							</fo:table-cell>
						</fo:table-row>
					</xsl:for-each>
							
					<xsl:choose>
						<xsl:when test="dido1Description != '' or dido2Description != ''">
							<fo:table-row>
								<fo:table-cell>
									<fo:block text-align="right" font-size="9pt" font-family="serif" font-weight="bold">
										&#x00A0;
									</fo:block>
								</fo:table-cell>
								
								<fo:table-cell>
									<fo:block text-align="left" font-size="9pt" font-family="serif" font-weight="bold">
										<xsl:text>Dividend Option:&#xA0;&#xA0;</xsl:text>
										<xsl:value-of select="dido1Description" />	
									</fo:block>						
								</fo:table-cell>
							</fo:table-row>	
									
							<fo:table-row>
								<fo:table-cell>
									<fo:block text-align="right" font-size="9pt" font-family="serif" font-weight="bold">
										&#x00A0;
									</fo:block>
								</fo:table-cell>
								
								<fo:table-cell>
									<fo:block text-align="left" font-size="9pt" font-family="serif" font-weight="bold">
										<xsl:text>Secondary Dividend Option:&#xA0;&#xA0;</xsl:text>
										<xsl:value-of select="dido2Description" />	
									</fo:block>						
								</fo:table-cell>
							</fo:table-row>
						</xsl:when>
								
						<xsl:otherwise>
							<fo:table-row>
								<fo:table-cell>
									<fo:block text-align="right" font-size="9pt" font-family="serif" font-weight="bold">
										&#x00A0;
									</fo:block>
								</fo:table-cell>
						
								<fo:table-cell>
									<fo:block text-align="left" font-size="9pt" font-family="serif" font-weight="bold">
										<xsl:text>Dividend Options:  None</xsl:text>
									</fo:block>						
								</fo:table-cell>
							</fo:table-row>
						</xsl:otherwise>	
					</xsl:choose>	
				</fo:table-body>
		</fo:table>
	</xsl:template>
	
	<xsl:template match="notesPage">
		
		<!-- Notes page begins here -->
		
		<fo:block page-break-before="always" />
		
		<fo:block><fo:leader/></fo:block>
		<fo:block><fo:leader/></fo:block>
		<fo:block><fo:leader/></fo:block>
		<fo:block><fo:leader/></fo:block>
		<fo:block><fo:leader/></fo:block>
		
		<fo:table width="100%">
		<fo:table-column column-width="15%" />
		<fo:table-column column-width="85%" />
			<fo:table-body>
				<xsl:for-each select="notes/string">
					<fo:table-row>
						<fo:table-cell>
							<fo:block text-align="right" font-size="9pt" font-family="serif" font-weight="bold">
								&#x00A0;
							</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block text-align="left" font-size="9pt" font-family="serif" font-weight="bold">
								<xsl:value-of select="." />
							</fo:block>
						</fo:table-cell>
					</fo:table-row>	
				</xsl:for-each>
			</fo:table-body>
		</fo:table>
	</xsl:template>
	
	<xsl:template match="detailPage2">
		<!-- Detail Page 2 begins here -->
		
		<fo:block page-break-before="always" />
		
		<fo:block><fo:leader/></fo:block>
		<fo:block><fo:leader/></fo:block>
		<fo:block><fo:leader/></fo:block>
		<fo:block><fo:leader/></fo:block>
		<fo:block><fo:leader/></fo:block>
		
		<fo:table width="100%">
		
		<fo:table-column column-width="18%" />
		<fo:table-column column-width="25%" />
		<fo:table-column column-width="23%" />
		<fo:table-column column-width="20%" />
			<fo:table-body>
				<fo:table-row>
					<fo:table-cell>
						<fo:block text-align="right" font-size="9pt" font-family="serif" font-weight="bold">
							&#x00A0;
						</fo:block>
					</fo:table-cell>
					
					<fo:table-cell>
						<fo:block text-align="center" font-size="9pt" font-family="serif" font-weight="bold">
							<xsl:choose>
								<xsl:when test="gInterestRate != ''">
									<xsl:text>---------&#xA0;</xsl:text>
									<xsl:value-of select="format-number(gInterestRate, '#0.00')" />
									<xsl:text>%</xsl:text>
									<xsl:text>&#xA0;---------</xsl:text>
								</xsl:when>
								<xsl:otherwise>
									&#x00A0;
								</xsl:otherwise>
							</xsl:choose>
						</fo:block>
					</fo:table-cell>
					
					<fo:table-cell>
						<fo:block text-align="center" font-size="9pt" font-family="serif" font-weight="bold">
							<xsl:choose>
								<xsl:when test="mInterestRate != ''">
									<xsl:text>----------&#xA0;</xsl:text>
									<xsl:value-of select="format-number(mInterestRate, '#0.00')" />
									<xsl:text>%</xsl:text>
									<xsl:text>&#xA0;----------</xsl:text>
								</xsl:when>
								<xsl:otherwise>
									<xsl:text>--------- Midpoint ---------</xsl:text>
								</xsl:otherwise>
							</xsl:choose>
						</fo:block>
					</fo:table-cell>
						
					<fo:table-cell>
						<fo:block text-align="center" font-size="9pt" font-family="serif" font-weight="bold">
							<xsl:choose>
								<xsl:when test="dInterestRate != ''">
									<xsl:text>---------&#xA0;</xsl:text>
									<xsl:value-of select="format-number(dInterestRate, '#0.00')" />
									<xsl:text>%</xsl:text>
									<xsl:text>&#xA0;---------</xsl:text>
								</xsl:when>
								<xsl:otherwise>
									<xsl:text>-------- Current ---------</xsl:text>
								</xsl:otherwise>
							</xsl:choose>
						</fo:block>						
					</fo:table-cell>
					
				</fo:table-row>
				
				<fo:table-row>
					<fo:table-cell>
						<fo:block text-align="right" font-size="9pt" font-family="serif" font-weight="bold">
							<xsl:text>&#xA0; &#xA0;M</xsl:text>
						</fo:block>
					</fo:table-cell>
					
					<fo:table-cell>
						<fo:block text-align="center" font-size="9pt" font-family="serif" font-weight="bold">
							<xsl:text>------- Guaranteed -------</xsl:text>
						</fo:block>
					</fo:table-cell>
					
					<fo:table-cell>
						<fo:block text-align="center" font-size="9pt" font-family="serif" font-weight="bold">
							<xsl:text>------ Non Guaranteed ------</xsl:text>
						</fo:block>
					</fo:table-cell>
						
					<fo:table-cell>
						<fo:block text-align="center" font-size="9pt" font-family="serif" font-weight="bold">
							<xsl:text>----- Non Guaranteed -----</xsl:text>
						</fo:block>
					</fo:table-cell>
				</fo:table-row>
			</fo:table-body>
		</fo:table>
		
		<fo:table width="100%">
		<fo:table-column column-width="6%" />
		<fo:table-column column-width="8%" />
		<fo:table-column column-width="8%" />
		<fo:table-column column-width="6%" />
		<fo:table-column column-width="10%" />
		<fo:table-column column-width="13%" />
		<fo:table-column column-width="10%" />
		<fo:table-column column-width="12%" />
		<fo:table-column column-width="10%" />
		<fo:table-column column-width="8%" />
			<fo:table-body>
				<fo:table-row>
					<fo:table-cell>
						<fo:block text-align="right" font-size="9pt" font-family="serif" font-weight="bold">
							<xsl:text>Attained</xsl:text>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block text-align="right" font-size="9pt" font-family="serif" font-weight="bold">
							<xsl:value-of select="column2Heading1" />
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block text-align="left" font-size="9pt" font-family="serif" font-weight="bold">
							<xsl:text>&#xA0; &#xA0; &#xA0; &#xA0; &#xA0; E</xsl:text>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block text-align="right" font-size="9pt" font-family="serif" font-weight="bold">
							<xsl:text>Net Cash</xsl:text>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block text-align="right" font-size="9pt" font-family="serif" font-weight="bold">
							<xsl:text>Death</xsl:text>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block text-align="right" font-size="9pt" font-family="serif" font-weight="bold">
							<xsl:text>Net Cash</xsl:text>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block text-align="right" font-size="9pt" font-family="serif" font-weight="bold">
							<xsl:text>Death</xsl:text>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block text-align="right" font-size="9pt" font-family="serif" font-weight="bold">
							<xsl:text>Net Cash</xsl:text>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block text-align="right" font-size="9pt" font-family="serif" font-weight="bold">
							<xsl:text>Death</xsl:text>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block text-align="right" font-size="9pt" font-family="serif" font-weight="bold">
							<xsl:text>Loan</xsl:text>
						</fo:block>
					</fo:table-cell>
				</fo:table-row>
				
				<fo:table-row>
					<fo:table-cell>
						<fo:block text-align="right" font-size="9pt" font-family="serif" font-weight="bold">
							<xsl:text>Age</xsl:text>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block text-align="right" font-size="9pt" font-family="serif" font-weight="bold">
							<xsl:value-of select="column2Heading2" />
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block text-align="left" font-size="9pt" font-family="serif" font-weight="bold">
							<xsl:text>&#xA0; &#xA0; &#xA0; &#xA0; &#xA0; C</xsl:text>	
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block text-align="right" font-size="9pt" font-family="serif" font-weight="bold">
							<xsl:text>Value</xsl:text>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block text-align="right" font-size="9pt" font-family="serif" font-weight="bold">
							<xsl:text>Benefit</xsl:text>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block text-align="right" font-size="9pt" font-family="serif" font-weight="bold">
							<xsl:text>Value</xsl:text>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block text-align="right" font-size="9pt" font-family="serif" font-weight="bold">
							<xsl:text>Benefit</xsl:text>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block text-align="right" font-size="9pt" font-family="serif" font-weight="bold">
							<xsl:text>Value</xsl:text>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block text-align="right" font-size="9pt" font-family="serif" font-weight="bold">
							<xsl:text>Benefit</xsl:text>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block text-align="right" font-size="9pt" font-family="serif" font-weight="bold">
							<xsl:text>Payoff</xsl:text>
						</fo:block>
					</fo:table-cell>
				</fo:table-row>
				
				<fo:table-row>
					<fo:table-cell>
						<fo:block text-align="center" font-size="9pt" font-family="serif" font-weight="bold">
							<xsl:text>&#x00A0;</xsl:text>
						</fo:block>
					</fo:table-cell>
				</fo:table-row>
				
			</fo:table-body>
		</fo:table>
		
		<xsl:apply-templates select="__REPT__PROP__DetailLineSet/REPT__PROP__DetailLine" />
		
	</xsl:template>
	
	<xsl:template match="REPT__PROP__DetailLine">
	
		<fo:table width="100%">
		<fo:table-column column-width="6%" />
		<fo:table-column column-width="8%" />
		<fo:table-column column-width="8%" />
		<fo:table-column column-width="6%" />
		<fo:table-column column-width="10%" />
		<fo:table-column column-width="13%" />
		<fo:table-column column-width="10%" />
		<fo:table-column column-width="12%" />
		<fo:table-column column-width="10%" />
		<fo:table-column column-width="8%" />
		<fo:table-body>
				<fo:table-row>
					<fo:table-cell>
						<fo:block text-align="right" font-size="9pt" font-family="serif" font-weight="bold">
							<xsl:value-of select="format-number(attainedAge, '##0')" />
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block text-align="right" font-size="9pt" font-family="serif" font-weight="bold">
							<xsl:value-of select="format-number(totalPremium, '#########0.00')" />
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block text-align="left" font-size="9pt" font-family="serif" font-weight="bold">
							<xsl:text>&#xA0; &#xA0; &#xA0; &#xA0; &#xA0; </xsl:text>
							<xsl:value-of select="mecChar" />
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block text-align="right" font-size="9pt" font-family="serif" font-weight="bold">
							<xsl:value-of select="format-number(surrenderValueGuar, '#########0')" />
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block text-align="right" font-size="9pt" font-family="serif" font-weight="bold">
							<xsl:value-of select="format-number(deathBenefitGuar, '#########0')" />
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block text-align="right" font-size="9pt" font-family="serif" font-weight="bold">
							<xsl:value-of select="format-number(surrenderValueMidp, '#########0')" />
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block text-align="right" font-size="9pt" font-family="serif" font-weight="bold">
							<xsl:value-of select="format-number(deathBenefitMidp, '#########0')" />
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block text-align="right" font-size="9pt" font-family="serif" font-weight="bold">
							<xsl:value-of select="format-number(surrenderValueNonGuar, '#########0')" />
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block text-align="right" font-size="9pt" font-family="serif" font-weight="bold">
							<xsl:value-of select="format-number(deathBenefitNonGuar, '#########0')" />
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block text-align="right" font-size="9pt" font-family="serif" font-weight="bold">
							<xsl:value-of select="format-number(loanPayoff, '#########0.00')" />
						</fo:block>
					</fo:table-cell>
				</fo:table-row>
			</fo:table-body>	
		</fo:table>
		
	</xsl:template>
	
	<xsl:template match="detailPage3">
	
		<!-- Detail Page 3 begins here 
		  TODO: There can be detail output with cash value displayed. Update this xsl when we have the proper data-->
		
		<fo:block page-break-before="always" />
		
		<fo:block><fo:leader/></fo:block>
		<fo:block><fo:leader/></fo:block>
		<fo:block><fo:leader/></fo:block>
		<fo:block><fo:leader/></fo:block>
		<fo:block><fo:leader/></fo:block>
		
		<fo:table width="100%">
		
		<fo:table-column column-width="18%" />
		<fo:table-column column-width="25%" />
		<fo:table-column column-width="23%" />
		<fo:table-column column-width="20%" />
			<fo:table-body>
				<fo:table-row>
					<fo:table-cell>
						<fo:block text-align="right" font-size="9pt" font-family="serif" font-weight="bold">
							&#x00A0;
						</fo:block>
					</fo:table-cell>
					
					<fo:table-cell>
						<fo:block text-align="center" font-size="9pt" font-family="serif" font-weight="bold">
							<xsl:choose>
								<xsl:when test="gInterestRate != ''">
									<xsl:text>---------&#xA0;</xsl:text>
									<xsl:value-of select="format-number(gInterestRate, '#0.00')" />
									<xsl:text>%</xsl:text>
									<xsl:text>&#xA0;---------</xsl:text>
								</xsl:when>
								<xsl:otherwise>
									&#x00A0;
								</xsl:otherwise>
							</xsl:choose>
						</fo:block>
					</fo:table-cell>
					
					<fo:table-cell>
						<fo:block text-align="center" font-size="9pt" font-family="serif" font-weight="bold">
							<xsl:choose>
								<xsl:when test="mInterestRate != ''">
									<xsl:text>----------&#xA0;</xsl:text>
									<xsl:value-of select="format-number(mInterestRate, '#0.00')" />
									<xsl:text>%</xsl:text>
									<xsl:text>&#xA0;----------</xsl:text>
								</xsl:when>
								<xsl:otherwise>
									<xsl:text>--------- Midpoint ---------</xsl:text>
								</xsl:otherwise>
							</xsl:choose>
						</fo:block>
					</fo:table-cell>
						
					<fo:table-cell>
						<fo:block text-align="center" font-size="9pt" font-family="serif" font-weight="bold">
							<xsl:choose>
								<xsl:when test="dInterestRate != ''">
									<xsl:text>---------&#xA0;</xsl:text>
									<xsl:value-of select="format-number(dInterestRate, '#0.00')" />
									<xsl:text>%</xsl:text>
									<xsl:text>&#xA0;---------</xsl:text>
								</xsl:when>
								<xsl:otherwise>
									<xsl:text>-------- Current ---------</xsl:text>
								</xsl:otherwise>
							</xsl:choose>
						</fo:block>						
					</fo:table-cell>
					
				</fo:table-row>
				
				<fo:table-row>
					<fo:table-cell>
						<fo:block text-align="right" font-size="9pt" font-family="serif" font-weight="bold">
							<xsl:text>&#xA0; &#xA0;M</xsl:text>
						</fo:block>
					</fo:table-cell>
					
					<fo:table-cell>
						<fo:block text-align="center" font-size="9pt" font-family="serif" font-weight="bold">
							<xsl:text>--------------------------</xsl:text>
						</fo:block>
					</fo:table-cell>
					
					<fo:table-cell>
						<fo:block text-align="center" font-size="9pt" font-family="serif" font-weight="bold">
							<xsl:text>------ Non Guaranteed ------</xsl:text>
						</fo:block>
					</fo:table-cell>
						
					<fo:table-cell>
						<fo:block text-align="center" font-size="9pt" font-family="serif" font-weight="bold">
							<xsl:text>----- Non Guaranteed -----</xsl:text>
						</fo:block>
					</fo:table-cell>
				</fo:table-row>
			</fo:table-body>
		</fo:table>
		
		<fo:table width="100%">
		<fo:table-column column-width="6%" />
		<fo:table-column column-width="8%" />
		<fo:table-column column-width="8%" />
		<fo:table-column column-width="6%" />
		<fo:table-column column-width="10%" />
		<fo:table-column column-width="13%" />
		<fo:table-column column-width="10%" />
		<fo:table-column column-width="12%" />
		<fo:table-column column-width="10%" />
		<fo:table-column column-width="8%" />
			<fo:table-body>
				<fo:table-row>
					<fo:table-cell>
						<fo:block text-align="right" font-size="9pt" font-family="serif" font-weight="bold">
							<xsl:text>Attained</xsl:text>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block text-align="right" font-size="9pt" font-family="serif" font-weight="bold">
							<xsl:value-of select="column2Heading1" />
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block text-align="left" font-size="9pt" font-family="serif" font-weight="bold">
							<xsl:text>&#xA0; &#xA0; &#xA0; &#xA0; &#xA0; E</xsl:text>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block text-align="right" font-size="9pt" font-family="serif" font-weight="bold">
							<xsl:text>Net Cash</xsl:text>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block text-align="right" font-size="9pt" font-family="serif" font-weight="bold">
							<xsl:text>Death</xsl:text>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block text-align="right" font-size="9pt" font-family="serif" font-weight="bold">
							<xsl:text>Net Cash</xsl:text>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block text-align="right" font-size="9pt" font-family="serif" font-weight="bold">
							<xsl:text>Death</xsl:text>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block text-align="right" font-size="9pt" font-family="serif" font-weight="bold">
							<xsl:text>Net Cash</xsl:text>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block text-align="right" font-size="9pt" font-family="serif" font-weight="bold">
							<xsl:text>Death</xsl:text>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block text-align="right" font-size="9pt" font-family="serif" font-weight="bold">
							<xsl:text>Loan</xsl:text>
						</fo:block>
					</fo:table-cell>
				</fo:table-row>
				
				<fo:table-row>
					<fo:table-cell>
						<fo:block text-align="right" font-size="9pt" font-family="serif" font-weight="bold">
							<xsl:text>Age</xsl:text>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block text-align="right" font-size="9pt" font-family="serif" font-weight="bold">
							<xsl:value-of select="column2Heading2" />
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block text-align="left" font-size="9pt" font-family="serif" font-weight="bold">
							<xsl:text>&#xA0; &#xA0; &#xA0; &#xA0; &#xA0; C</xsl:text>	
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block text-align="right" font-size="9pt" font-family="serif" font-weight="bold">
							<xsl:text>Value</xsl:text>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block text-align="right" font-size="9pt" font-family="serif" font-weight="bold">
							<xsl:text>Benefit</xsl:text>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block text-align="right" font-size="9pt" font-family="serif" font-weight="bold">
							<xsl:text>Value</xsl:text>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block text-align="right" font-size="9pt" font-family="serif" font-weight="bold">
							<xsl:text>Benefit</xsl:text>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block text-align="right" font-size="9pt" font-family="serif" font-weight="bold">
							<xsl:text>Value</xsl:text>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block text-align="right" font-size="9pt" font-family="serif" font-weight="bold">
							<xsl:text>Benefit</xsl:text>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block text-align="right" font-size="9pt" font-family="serif" font-weight="bold">
							<xsl:text>Payoff</xsl:text>
						</fo:block>
					</fo:table-cell>
				</fo:table-row>
				
				<fo:table-row>
					<fo:table-cell>
						<fo:block text-align="center" font-size="9pt" font-family="serif" font-weight="bold">
							<xsl:text>&#x00A0;</xsl:text>
						</fo:block>
					</fo:table-cell>
				</fo:table-row>
				
			</fo:table-body>
		</fo:table>
		
		<xsl:apply-templates select="__REPT__PROP__DetailLineSet/REPT__PROP__DetailLine" />
		
	</xsl:template>
	
	<xsl:template match="indexLines">
		<fo:block page-break-before="always" />
		
		<fo:block><fo:leader/></fo:block>
		<fo:block><fo:leader/></fo:block>
		<fo:block><fo:leader/></fo:block>
		<fo:block><fo:leader/></fo:block>
		<fo:block><fo:leader/></fo:block>
		
		<fo:table width="100%">
		<fo:table-column column-width="100%" />
			<fo:table-body>
				<fo:table-row>
					<fo:table-cell>
						<fo:block text-align="center" font-size="9pt" font-family="serif" font-weight="bold">
							<xsl:text>&#xA0; &#xA0; &#xA0; &#xA0; &#xA0; </xsl:text>
							<xsl:text>&#xA0; &#xA0; &#xA0; &#xA0; &#xA0; Life Insurance Cost Indices</xsl:text>
						</fo:block>
					</fo:table-cell>
				</fo:table-row>
			</fo:table-body>
		</fo:table>
		
		<fo:block><fo:leader/></fo:block>
		
		<fo:table width="100%">
		<fo:table-column column-width="20%" />
		<fo:table-column column-width="30%" />
		<fo:table-column column-width="45%" />
			<fo:table-body>
				<fo:table-row>
					<fo:table-cell>
						<fo:block text-align="left" font-size="9pt" font-family="serif" font-weight="bold">
							<xsl:text>&#x00A0;</xsl:text>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block text-align="center" font-size="9pt" font-family="serif" font-weight="bold">
							<xsl:text>              ----------------------- Surrender Cost Index -----------------------</xsl:text>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block text-align="right" font-size="9pt" font-family="serif" font-weight="bold">
							<xsl:text>-------------------- Net Payment Cost Index --------------------           </xsl:text>
						</fo:block>
					</fo:table-cell>
				</fo:table-row>
			</fo:table-body>
		</fo:table>
		
		<fo:block><fo:leader/></fo:block>
		
		<fo:table width="100%">
		<fo:table-column column-width="10%" />
		<fo:table-column column-width="9%" />
		<fo:table-column column-width="9%" />
		<fo:table-column column-width="9%" />
		<fo:table-column column-width="9%" />
		<fo:table-column column-width="9%" />
		<fo:table-column column-width="9%" />
		<fo:table-column column-width="9%" />
		<fo:table-column column-width="9%" />
		<fo:table-column column-width="9%" />
		<fo:table-column column-width="9%" />
			<fo:table-body>
				<fo:table-row>
					<fo:table-cell>
						<fo:block text-align="left" font-size="9pt" font-family="serif" font-weight="bold">
							<xsl:text>&#x00A0;</xsl:text>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block text-align="right" font-size="9pt" font-family="serif" font-weight="bold">
							<xsl:text>End of</xsl:text>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block text-align="right" font-size="9pt" font-family="serif" font-weight="bold">
							<xsl:text>End of</xsl:text>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block text-align="right" font-size="9pt" font-family="serif" font-weight="bold">
							<xsl:text>End of</xsl:text>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block text-align="right" font-size="9pt" font-family="serif" font-weight="bold">
							<xsl:text>At Age</xsl:text>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block text-align="right" font-size="9pt" font-family="serif" font-weight="bold">
							<xsl:text>At Age</xsl:text>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block text-align="right" font-size="9pt" font-family="serif" font-weight="bold">
							<xsl:text>End of</xsl:text>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block text-align="right" font-size="9pt" font-family="serif" font-weight="bold">
							<xsl:text>End of</xsl:text>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block text-align="right" font-size="9pt" font-family="serif" font-weight="bold">
							<xsl:text>End of</xsl:text>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block text-align="right" font-size="9pt" font-family="serif" font-weight="bold">
							<xsl:text>At Age</xsl:text>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block text-align="right" font-size="9pt" font-family="serif" font-weight="bold">
							<xsl:text>At Age</xsl:text>
						</fo:block>
					</fo:table-cell>
				</fo:table-row>
				
				<fo:table-row>
					<fo:table-cell>
						<fo:block text-align="left" font-size="9pt" font-family="serif" font-weight="bold">
							<xsl:text>&#x00A0;</xsl:text>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block text-align="right" font-size="9pt" font-family="serif" font-weight="bold">
							<xsl:text>10 Years</xsl:text>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block text-align="right" font-size="9pt" font-family="serif" font-weight="bold">
							<xsl:text>15 Years</xsl:text>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block text-align="right" font-size="9pt" font-family="serif" font-weight="bold">
							<xsl:text>20 Years</xsl:text>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block text-align="right" font-size="9pt" font-family="serif" font-weight="bold">
							<xsl:text>Sixty-Five</xsl:text>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block text-align="right" font-size="9pt" font-family="serif" font-weight="bold">
							<xsl:text>Seventy</xsl:text>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block text-align="right" font-size="9pt" font-family="serif" font-weight="bold">
							<xsl:text>10 Years</xsl:text>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block text-align="right" font-size="9pt" font-family="serif" font-weight="bold">
							<xsl:text>15 Years</xsl:text>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block text-align="right" font-size="9pt" font-family="serif" font-weight="bold">
							<xsl:text>20 Years</xsl:text>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block text-align="right" font-size="9pt" font-family="serif" font-weight="bold">
							<xsl:text>Sixty-Five</xsl:text>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block text-align="right" font-size="9pt" font-family="serif" font-weight="bold">
							<xsl:text>Seventy</xsl:text>
						</fo:block>
					</fo:table-cell>
				</fo:table-row>
				
				<fo:table-row>
					<fo:table-cell>
						<fo:block text-align="center" font-size="9pt" font-family="serif" font-weight="bold">
							<xsl:text>&#x00A0;</xsl:text>
						</fo:block>
					</fo:table-cell>
				</fo:table-row>
				
			</fo:table-body>
		</fo:table>
		
		<fo:table width="100%">
		<fo:table-column column-width="10%" />
		<fo:table-column column-width="9%" />
		<fo:table-column column-width="9%" />
		<fo:table-column column-width="9%" />
		<fo:table-column column-width="9%" />
		<fo:table-column column-width="9%" />
		<fo:table-column column-width="9%" />
		<fo:table-column column-width="9%" />
		<fo:table-column column-width="9%" />
		<fo:table-column column-width="9%" />
		<fo:table-column column-width="9%" />
			<fo:table-body>
				<xsl:for-each select="REPT__PROP__IndexLine">
				
					<fo:table-row>				
						<fo:table-cell>
							<fo:block text-align="left" font-size="9pt" font-family="serif" font-weight="bold">
								<xsl:value-of select="queueID" />
							</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block text-align="right" font-size="9pt" font-family="serif" font-weight="bold">
								<xsl:value-of select="surrenderIndex10" />
							</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block text-align="right" font-size="9pt" font-family="serif" font-weight="bold">
								<xsl:value-of select="surrenderIndex15" />
							</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block text-align="right" font-size="9pt" font-family="serif" font-weight="bold">
								<xsl:value-of select="surrenderIndex20" />
							</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block text-align="right" font-size="9pt" font-family="serif" font-weight="bold">
								<xsl:value-of select="surrenderIndex61" />
							</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block text-align="right" font-size="9pt" font-family="serif" font-weight="bold">
								<xsl:value-of select="surrenderIndex66" />
							</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block text-align="right" font-size="9pt" font-family="serif" font-weight="bold">
								<xsl:value-of select="netIndex10" />
							</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block text-align="right" font-size="9pt" font-family="serif" font-weight="bold">
								<xsl:value-of select="netIndex15" />
							</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block text-align="right" font-size="9pt" font-family="serif" font-weight="bold">
								<xsl:value-of select="netIndex20" />
							</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block text-align="right" font-size="9pt" font-family="serif" font-weight="bold">
								<xsl:value-of select="netIndex61" />
							</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block text-align="right" font-size="9pt" font-family="serif" font-weight="bold">
								<xsl:value-of select="netIndex66" />
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
			
					<fo:table-row>
						<fo:table-cell>
							<fo:block text-align="center" font-size="9pt" font-family="serif" font-weight="bold">
								<xsl:text>&#x00A0;</xsl:text>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
					
				</xsl:for-each>	
			</fo:table-body>
		</fo:table>
	</xsl:template>
	
</xsl:stylesheet>
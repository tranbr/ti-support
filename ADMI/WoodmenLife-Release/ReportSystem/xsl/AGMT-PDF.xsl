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
		<xsl:apply-templates select="REPT__RAGM__Extract" />
	</xsl:template>
		
	<xsl:template match="REPT__RAGM__Extract">
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
            							<xsl:text>CO.</xsl:text><xsl:value-of select="companyCode" /><xsl:text> REPORT </xsl:text><xsl:value-of select="//reportID" />
            						</fo:block>
            					</fo:table-cell>
							
								<fo:table-cell>
									<fo:block text-align="center" font-size="9pt" font-family="serif" font-weight="bold">
										<xsl:value-of select="heading1" />
									</fo:block>
								</fo:table-cell>
							
								<fo:table-cell>
									<fo:block text-align="right" font-size="9pt" font-family="serif" font-weight="bold">
										Page <fo:page-number/> of <fo:page-number-citation-last ref-id="{generate-id(.)}"/>
									</fo:block>															
								</fo:table-cell>
							</fo:table-row>
							
							<fo:table-row>
								<fo:table-cell>	
									<fo:block text-align="left" font-size="9pt" font-family="serif" font-weight="bold">
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

							<fo:table-row>
								<fo:table-cell>	
									<fo:block text-align="left" font-size="9pt" font-family="serif" font-weight="bold" border-bottom-style="solid">
            							<xsl:variable name="rept_Month" select="substring(//reportDate, 6, 2)"/>
										<xsl:variable name="rept_Day" select="substring(//reportDate, 9)"/>
										<xsl:variable name="rept_Year" select="substring(//reportDate, 1, 4)"/>
										<xsl:variable name="rept_Date" select="concat($rept_Month, '-', $rept_Day, '-', $rept_Year)" />
										<xsl:text>Date </xsl:text><xsl:value-of select="$rept_Date" />
										<xsl:text> Time </xsl:text><xsl:value-of select="//reportTime" />
            						</fo:block>
            					</fo:table-cell>
            					
								<fo:table-cell>
									<fo:block text-align="center" font-size="9pt" font-family="serif" font-weight="bold" border-bottom-style="solid">
										<xsl:value-of select="heading2" />
									</fo:block>
								</fo:table-cell>
								
								<fo:table-cell>	
									<fo:block text-align="right" font-size="9pt" font-family="serif" font-weight="bold" border-bottom-style="solid">
            							<xsl:text>Printed By </xsl:text><xsl:value-of select="//printedBy" />
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
										&#x00A0;
									</fo:block>
								</fo:table-cell>
								
								<fo:table-cell>	
									<fo:block text-align="right" font-size="9pt" font-family="serif" font-weight="bold">
            							&#x00A0;
            						</fo:block>
            					</fo:table-cell>
							</fo:table-row>
							
							<fo:table-row>
								<fo:table-cell>	
									<fo:block text-align="left" font-size="9pt" font-family="serif" font-weight="bold" border-bottom-style="solid">
            							&#x00A0;
            						</fo:block>
            					</fo:table-cell>
            					
								<fo:table-cell>
									<fo:block text-align="center" font-size="9pt" font-family="serif" font-weight="bold" border-bottom-style="solid">
										<xsl:text>Originated By: </xsl:text><xsl:value-of select="operatorName" />
									</fo:block>
								</fo:table-cell>
								
								<fo:table-cell>	
									<fo:block text-align="right" font-size="9pt" font-family="serif" font-weight="bold" border-bottom-style="solid">
            							&#x00A0;
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
		
			<fo:table-column column-width="6%" />
			<fo:table-column column-width="6%" />
			<fo:table-column column-width="10%" />
			<fo:table-column column-width="10%" />
			<fo:table-column column-width="6%" />
			<fo:table-column column-width="10%" />
			<fo:table-column column-width="10%" />
			<fo:table-column column-width="6%" />
			<fo:table-column column-width="10%" />
			<fo:table-column column-width="6%" />
			<fo:table-column column-width="6%" />
			<fo:table-column column-width="14%" />
					
						<fo:table-body>

							<fo:table-row>
								<fo:table-cell>
									<fo:block text-align="left" font-size="9pt" font-family="serif" font-weight="bold">
										&#x00A0;
									</fo:block>
								</fo:table-cell>
							
								<fo:table-cell>
									<fo:block text-align="left" font-size="9pt" font-family="serif" font-weight="bold">
										&#x00A0;
									</fo:block>
								</fo:table-cell>
							
								<fo:table-cell>
									<fo:block text-align="left" font-size="9pt" font-family="serif" font-weight="bold">
										&#x00A0;
									</fo:block>
								</fo:table-cell>
															
								<fo:table-cell>
									<fo:block text-align="left" font-size="9pt" font-family="serif" font-weight="bold">
										<xsl:text>FROM: </xsl:text>
									</fo:block>
								</fo:table-cell>
															
								<fo:table-cell>
									<fo:block text-align="left" font-size="9pt" font-family="serif" font-weight="bold">
										&#x00A0;
									</fo:block>
								</fo:table-cell>
																							
								<fo:table-cell>
									<fo:block text-align="left" font-size="9pt" font-family="serif" font-weight="bold">
										&#x00A0;
									</fo:block>
								</fo:table-cell>
																															
								<fo:table-cell>
									<fo:block text-align="left" font-size="9pt" font-family="serif" font-weight="bold">
										<xsl:text>TO: </xsl:text>
									</fo:block>
								</fo:table-cell>
																							
								<fo:table-cell>
									<fo:block text-align="left" font-size="9pt" font-family="serif" font-weight="bold">
										&#x00A0;
									</fo:block>
								</fo:table-cell>
																															
								<fo:table-cell>
									<fo:block text-align="left" font-size="9pt" font-family="serif" font-weight="bold">
										&#x00A0;
									</fo:block>
								</fo:table-cell>
																															
								<fo:table-cell>
									<fo:block text-align="left" font-size="9pt" font-family="serif" font-weight="bold">
										&#x00A0;
									</fo:block>
								</fo:table-cell>
																																							
								<fo:table-cell>
									<fo:block text-align="left" font-size="9pt" font-family="serif" font-weight="bold">
										<xsl:text>ERROR</xsl:text>
									</fo:block>
								</fo:table-cell>
																																															
								<fo:table-cell>
									<fo:block text-align="left" font-size="9pt" font-family="serif" font-weight="bold">
										&#x00A0;
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							
							<fo:table-row>
								<fo:table-cell>
									<fo:block>
										<fo:leader />	
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							
							<fo:table-row>
								<fo:table-cell>
									<fo:block text-align="left" font-size="9pt" font-family="serif" font-weight="bold">
										<xsl:text>Transfer</xsl:text>
									</fo:block>
								</fo:table-cell>
							
								<fo:table-cell>
									<fo:block text-align="left" font-size="9pt" font-family="serif" font-weight="bold">
										<xsl:text>Company</xsl:text>
									</fo:block>
								</fo:table-cell>
							
								<fo:table-cell>
									<fo:block text-align="left" font-size="9pt" font-family="serif" font-weight="bold">
										<xsl:text>Policy</xsl:text>
									</fo:block>
								</fo:table-cell>
															
								<fo:table-cell>
									<fo:block text-align="left" font-size="9pt" font-family="serif" font-weight="bold">
										<xsl:text>Agent</xsl:text>
									</fo:block>
								</fo:table-cell>
															
								<fo:table-cell>
									<fo:block text-align="left" font-size="9pt" font-family="serif" font-weight="bold">
										<xsl:text>Situation</xsl:text>
									</fo:block>
								</fo:table-cell>
																							
								<fo:table-cell>
									<fo:block text-align="left" font-size="9pt" font-family="serif" font-weight="bold">
										<xsl:text>Office Number /</xsl:text>
									</fo:block>
								</fo:table-cell>
																															
								<fo:table-cell>
									<fo:block text-align="left" font-size="9pt" font-family="serif" font-weight="bold">
										<xsl:text>Agent</xsl:text>
									</fo:block>
								</fo:table-cell>
																							
								<fo:table-cell>
									<fo:block text-align="left" font-size="9pt" font-family="serif" font-weight="bold">
										<xsl:text>Situation</xsl:text>
									</fo:block>
								</fo:table-cell>
																															
								<fo:table-cell>
									<fo:block text-align="left" font-size="9pt" font-family="serif" font-weight="bold">
										<xsl:text>Office Number /</xsl:text>
									</fo:block>
								</fo:table-cell>
																															
								<fo:table-cell>
									<fo:block text-align="left" font-size="9pt" font-family="serif" font-weight="bold">
										<xsl:text>Error</xsl:text>
									</fo:block>
								</fo:table-cell>
																																							
								<fo:table-cell>
									<fo:block text-align="left" font-size="9pt" font-family="serif" font-weight="bold">
										<xsl:text>Error</xsl:text>
									</fo:block>
								</fo:table-cell>
																																															
								<fo:table-cell>
									<fo:block text-align="left" font-size="9pt" font-family="serif" font-weight="bold">
										<xsl:text>Description</xsl:text>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
														
							<fo:table-row>
								<fo:table-cell>
									<fo:block text-align="left" font-size="9pt" font-family="serif" font-weight="bold">
										<xsl:text>Type</xsl:text>
									</fo:block>
								</fo:table-cell>
							
								<fo:table-cell>
									<fo:block text-align="left" font-size="9pt" font-family="serif" font-weight="bold">
										<xsl:text>Code</xsl:text>
									</fo:block>
								</fo:table-cell>
							
								<fo:table-cell>
									<fo:block text-align="left" font-size="9pt" font-family="serif" font-weight="bold">
										<xsl:text>Number</xsl:text>
									</fo:block>
								</fo:table-cell>
															
								<fo:table-cell>
									<fo:block text-align="left" font-size="9pt" font-family="serif" font-weight="bold">
										<xsl:text>Number</xsl:text>
									</fo:block>
								</fo:table-cell>
															
								<fo:table-cell>
									<fo:block text-align="left" font-size="9pt" font-family="serif" font-weight="bold">
										&#x00A0;
									</fo:block>
								</fo:table-cell>
																							
								<fo:table-cell>
									<fo:block text-align="left" font-size="9pt" font-family="serif" font-weight="bold">
										<xsl:text>Pct Comm</xsl:text>
									</fo:block>
								</fo:table-cell>
																															
								<fo:table-cell>
									<fo:block text-align="left" font-size="9pt" font-family="serif" font-weight="bold">
										<xsl:text>Number</xsl:text>
									</fo:block>
								</fo:table-cell>
																							
								<fo:table-cell>
									<fo:block text-align="left" font-size="9pt" font-family="serif" font-weight="bold">
										&#x00A0;
									</fo:block>
								</fo:table-cell>
																															
								<fo:table-cell>
									<fo:block text-align="left" font-size="9pt" font-family="serif" font-weight="bold">
										<xsl:text>Pct Comm</xsl:text>
									</fo:block>
								</fo:table-cell>
																															
								<fo:table-cell>
									<fo:block text-align="left" font-size="9pt" font-family="serif" font-weight="bold">
										<xsl:text>Code</xsl:text>
									</fo:block>
								</fo:table-cell>
																																							
								<fo:table-cell>
									<fo:block text-align="left" font-size="9pt" font-family="serif" font-weight="bold">
										<xsl:text>Connector</xsl:text>
									</fo:block>
								</fo:table-cell>
																																															
								<fo:table-cell>
									<fo:block text-align="left" font-size="9pt" font-family="serif" font-weight="bold">
										&#x00A0;
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-body>
				</fo:table>
			</fo:static-content>	
				
			<fo:flow flow-name="xsl-region-body">
			
				<fo:block><fo:leader/></fo:block>
				<fo:block><fo:leader/></fo:block>
				<fo:block><fo:leader/></fo:block>
				<fo:block><fo:leader/></fo:block>
				<fo:block><fo:leader/></fo:block>
		
				<xsl:apply-templates select="__REPT__RAGM__DetailLineSet/REPT__RAGM__DetailLine" />	
				
				<fo:block><fo:leader/></fo:block>
				<fo:block><fo:leader/></fo:block>
				
				<fo:block id="{generate-id(.)}"/>
			</fo:flow>
		</fo:page-sequence>
	</xsl:template>	
	
	<xsl:template match="REPT__RAGM__DetailLine">
			
		<fo:table width="100%" >
		
			<fo:table-column column-width="6%" />
			<fo:table-column column-width="6%" />
			<fo:table-column column-width="10%" />
			<fo:table-column column-width="10%" />
			<fo:table-column column-width="6%" />
			<fo:table-column column-width="10%" />
			<fo:table-column column-width="10%" />
			<fo:table-column column-width="6%" />
			<fo:table-column column-width="10%" />
			<fo:table-column column-width="6%" />
			<fo:table-column column-width="6%" />
			<fo:table-column column-width="14%" />
					
				<fo:table-body>

					<fo:table-row>
						<fo:table-cell>
							<fo:block text-align="left" font-size="9pt" font-family="serif" font-weight="bold">
								<xsl:value-of select="transferType" />
							</fo:block>
						</fo:table-cell>
					
						<fo:table-cell>
							<fo:block text-align="left" font-size="9pt" font-family="serif" font-weight="bold">
								<xsl:value-of select="companyCode" />
							</fo:block>
						</fo:table-cell>
						
						<fo:table-cell>
							<fo:block text-align="left" font-size="9pt" font-family="serif" font-weight="bold">
								<xsl:value-of select="policyNumber" />
							</fo:block>
						</fo:table-cell>
															
						<fo:table-cell>
							<fo:block text-align="left" font-size="9pt" font-family="serif" font-weight="bold">
								<xsl:value-of select="agent1" />
							</fo:block>
						</fo:table-cell>
														
						<fo:table-cell>
							<fo:block text-align="left" font-size="9pt" font-family="serif" font-weight="bold">		
								<xsl:choose>
									<xsl:when test="situation1 != ''">
										<xsl:value-of select="format-number(situation1, '00')" />
									</xsl:when>
									<xsl:otherwise>
										&#x00A0;
									</xsl:otherwise>
								</xsl:choose>
							</fo:block>
						</fo:table-cell>
																							
						<fo:table-cell>
							<fo:block text-align="left" font-size="9pt" font-family="serif" font-weight="bold">
								<xsl:value-of select="office1" />
							</fo:block>
						</fo:table-cell>
																													
						<fo:table-cell>
							<fo:block text-align="left" font-size="9pt" font-family="serif" font-weight="bold">
								<xsl:value-of select="agent2" />
							</fo:block>
						</fo:table-cell>
														
						<fo:table-cell>
							<fo:block text-align="left" font-size="9pt" font-family="serif" font-weight="bold">		
								<xsl:choose>
									<xsl:when test="situation2 != ''">
										<xsl:value-of select="format-number(situation2, '00')" />
									</xsl:when>
									<xsl:otherwise>
										&#x00A0;
									</xsl:otherwise>
								</xsl:choose>
							</fo:block>
						</fo:table-cell>
																															
						<fo:table-cell>
							<fo:block text-align="left" font-size="9pt" font-family="serif" font-weight="bold">
								<xsl:value-of select="office2" />
							</fo:block>
						</fo:table-cell>
																															
						<fo:table-cell>
							<fo:block text-align="left" font-size="9pt" font-family="serif" font-weight="bold">
								<xsl:value-of select="errorCode" />
							</fo:block>
						</fo:table-cell>
																																						
						<fo:table-cell>
							<fo:block text-align="left" font-size="9pt" font-family="serif" font-weight="bold">
								<xsl:value-of select="errorConnector" />
							</fo:block>
						</fo:table-cell>
																																															
						<fo:table-cell>
							<fo:block text-align="left" font-size="9pt" font-family="serif" font-weight="bold">
								<xsl:value-of select="errorDescription" />
							</fo:block>
						</fo:table-cell>
						
					</fo:table-row>	
				</fo:table-body>
		</fo:table>
	</xsl:template>
</xsl:stylesheet>
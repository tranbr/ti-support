<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:output method="xml" indent="yes" />

	<!-- Support PEPD CSV XSL Transformation Process -->
	
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
		<xsl:apply-templates select="REPT__PEDR__Generate__Extract" />
	</xsl:template>	
  			
	<xsl:template match="REPT__PEDR__Generate__Extract">
  		<fo:page-sequence master-reference="report" initial-page-number="1" force-page-count="no-force">
			<fo:static-content flow-name="xsl-region-before">
				
				<fo:table width="100%">
					<fo:table-column column-width="30%" />
					<fo:table-column column-width="40%" />
					<fo:table-column column-width="30%" />
					<fo:table-body>
					
						<fo:table-row>
						
							<fo:table-cell>
								<fo:block text-align="left" font-size="10pt" font-family="serif" font-weight="bold">
									<xsl:text>Company: </xsl:text><xsl:text>&#xA0;&#xA0;</xsl:text>
									<xsl:value-of select="companyCode" /><xsl:text>&#xA0;&#xA0;</xsl:text>
									<xsl:text> Report ID: </xsl:text><xsl:text>&#xA0;&#xA0;</xsl:text>
									<xsl:value-of select="//reportID" />
								</fo:block>
							</fo:table-cell>
							
							<fo:table-cell>
								<fo:block text-align="center" font-size="10pt" font-family="sans-serif" font-weight="bold">
									<xsl:value-of select="//companyName" />
								</fo:block>
							</fo:table-cell>
							
							<fo:table-cell>
								<fo:block text-align="right" font-size="10pt" font-family="serif" font-weight="bold">
									<fo:block>Page <fo:page-number/> of <fo:page-number-citation-last ref-id="{generate-id(.)}"/>
									</fo:block>										
								</fo:block>						
							</fo:table-cell>
							
						</fo:table-row>
							
						<fo:table-row>
						
							<fo:table-cell>
								<fo:block text-align="left" font-size="10pt" font-family="serif" font-weight="bold">
									<xsl:text>From:</xsl:text>
									<xsl:text>&#xA0;&#xA0;</xsl:text>
									<xsl:variable name="month1" select="substring(fromDate, 6, 2)"/>
									<xsl:variable name="day1" select="substring(fromDate, 9)"/>
									<xsl:variable name="year1" select="substring(fromDate, 1, 4)"/>
									<xsl:variable name="date1" select="concat($month1, '-', $day1, '-', $year1)" />
									<xsl:value-of select="$date1" />										
									<xsl:text>&#xA0;&#xA0;&#xA0;</xsl:text>
									<xsl:text>Thru:</xsl:text>
									<xsl:text>&#xA0;&#xA0;</xsl:text>
									<xsl:variable name="month2" select="substring(thruDate, 6, 2)"/>
									<xsl:variable name="day2" select="substring(thruDate, 9)"/>
									<xsl:variable name="year2" select="substring(thruDate, 1, 4)"/>
									<xsl:variable name="date2" select="concat($month2, '-', $day2, '-', $year2)" />
									<xsl:value-of select="$date2" />
								</fo:block>
							</fo:table-cell>
							
							<fo:table-cell>
								<fo:block text-align="center" font-size="10pt" font-family="serif" font-weight="bold">
									<xsl:text> </xsl:text>
								</fo:block>
							</fo:table-cell>
							
							<fo:table-cell>
								<fo:block text-align="center" font-size="10pt" font-family="serif" font-weight="bold">
									<xsl:text> </xsl:text>
								</fo:block>
							</fo:table-cell>
							
						</fo:table-row>
							
						<fo:table-row>
						
							<fo:table-cell>
								<fo:block text-align="left" font-size="10pt" font-family="serif" font-weight="bold">
									<xsl:text>Date:</xsl:text>
									<xsl:text>&#xA0;&#xA0;</xsl:text>
									<xsl:variable name="month" select="substring(//reportDate, 6, 2)"/>
									<xsl:variable name="day" select="substring(//reportDate, 9)"/>
									<xsl:variable name="year" select="substring(//reportDate, 1, 4)"/>
									<xsl:variable name="date" select="concat($month, '-', $day, '-', $year)" />
									<xsl:value-of select="$date" />	
									<xsl:text>&#xA0;&#xA0;&#xA0;</xsl:text>
									<xsl:text>Time:</xsl:text><xsl:value-of select="//reportTime" />
								</fo:block>
							</fo:table-cell>
							
							<fo:table-cell>
								<fo:block text-align="center" font-size="10pt" font-family="sans-serif" font-weight="bold">
									<xsl:value-of select="//reportDescription" />
								</fo:block>
							</fo:table-cell>
						
							<fo:table-cell>
								<fo:block text-align="right" font-size="10pt" font-family="serif" font-weight="bold">
									<xsl:text>Printed By:</xsl:text><xsl:value-of select="//printedBy" />
								</fo:block>						
							</fo:table-cell>
							
						</fo:table-row>
					</fo:table-body>
				</fo:table>
				
				<fo:table width="100%">
					<fo:table-column column-width="10%" />
					<fo:table-column column-width="7%" />
					<fo:table-column column-width="7%" />
					<fo:table-column column-width="7%" />
					<fo:table-column column-width="3%" />
					<fo:table-column column-width="7%" />
					<fo:table-column column-width="6%" />
					<fo:table-column column-width="5%" />
					<fo:table-column column-width="8%" />
					<fo:table-column column-width="9%" />
					<fo:table-column column-width="9%" />
					<fo:table-column column-width="13%" />
					<fo:table-column column-width="9%" />
					<fo:table-body>
						<fo:table-row>
						
							<fo:table-cell>
								<fo:block text-align="left" font-size="8pt" font-family="sans-serif" font-weight="bold"
								  	      line-height="1.5em" background-color="black" color="white">
									<xsl:text>Policy Number</xsl:text>  	      
								</fo:block>
							</fo:table-cell>
							
							<fo:table-cell>
								<fo:block text-align="left" font-size="8pt" font-family="sans-serif" font-weight="bold"
								  	      line-height="1.5em" background-color="black" color="white">
									<xsl:text>Print Type</xsl:text>  	      
								</fo:block>
							</fo:table-cell>
														
							<fo:table-cell>
								<fo:block text-align="center" font-size="8pt" font-family="sans-serif" font-weight="bold"
								  	      line-height="1.5em" background-color="black" color="white">
									<xsl:text>AH Status</xsl:text>  	      
								</fo:block>
							</fo:table-cell>
														
							<fo:table-cell>
								<fo:block text-align="center" font-size="8pt" font-family="sans-serif" font-weight="bold"
								  	      line-height="1.5em" background-color="black" color="white">
									<xsl:text>Report State</xsl:text>  	      
								</fo:block>
							</fo:table-cell>
														
							<fo:table-cell>
								<fo:block text-align="center" font-size="8pt" font-family="sans-serif" font-weight="bold"
								  	      line-height="1.5em" background-color="black" color="white">
									<xsl:text>DBO</xsl:text>  	      
								</fo:block>
							</fo:table-cell>
														
							<fo:table-cell>
								<fo:block text-align="center" font-size="8pt" font-family="sans-serif" font-weight="bold"
								  	      line-height="1.5em" background-color="black" color="white">
									<xsl:text>Cov Num</xsl:text>  	      
								</fo:block>
							</fo:table-cell>
																					
							<fo:table-cell>
								<fo:block text-align="left" font-size="8pt" font-family="sans-serif" font-weight="bold"
								  	      line-height="1.5em" background-color="black" color="white">
									<xsl:text>Plan Code</xsl:text>  	      
								</fo:block>
							</fo:table-cell>
																					
							<fo:table-cell>
								<fo:block text-align="left" font-size="8pt" font-family="sans-serif" font-weight="bold"
								  	      line-height="1.5em" background-color="black" color="white">
									<xsl:text>Issue Age</xsl:text>  	      
								</fo:block>
							</fo:table-cell>
																					
							<fo:table-cell>
								<fo:block text-align="right" font-size="8pt" font-family="sans-serif" font-weight="bold"
								  	      line-height="1.5em" background-color="black" color="white">
									<xsl:text>Issue Date</xsl:text>  	      
								</fo:block>
							</fo:table-cell>
																					
							<fo:table-cell>
								<fo:block text-align="center" font-size="8pt" font-family="sans-serif" font-weight="bold"
								  	      line-height="1.5em" background-color="black" color="white">
									<xsl:text>Cov Status</xsl:text>  	      
								</fo:block>
							</fo:table-cell>
																					
							<fo:table-cell>
								<fo:block text-align="right" font-size="8pt" font-family="sans-serif" font-weight="bold"
								  	      line-height="1.5em" background-color="black" color="white">
									<xsl:text>Face Amount</xsl:text>  	      
								</fo:block>
							</fo:table-cell>
																					
							<fo:table-cell>
								<fo:block text-align="right" font-size="8pt" font-family="sans-serif" font-weight="bold"
								  	      line-height="1.5em" background-color="black" color="white">
									<xsl:text>Cash Value/Net Premium</xsl:text>  	      
								</fo:block>
							</fo:table-cell>
																					
							<fo:table-cell>
								<fo:block text-align="right" font-size="8pt" font-family="sans-serif" font-weight="bold"
								  	      line-height="1.5em" background-color="black" color="white">
									<xsl:text>Corridor Amount</xsl:text>  	      
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
			
				<xsl:apply-templates select="__REPT__PEDR__Generate__EntrySet/REPT__PEDR__Generate__Entry" />
							
				<fo:block page-break-before="always" />			
				
				<fo:block text-align="center" font-size="16pt" font-family="sans-serif" line-height="1.5em">
					<xsl:text>Inforce Policy Exhibit Policy Detail Report Totals</xsl:text>		
				</fo:block>
				
				<xsl:apply-templates select="__REPT__PEDR__Generate__TotalEntrySet/REPT__PEDR__Generate__TotalEntry" />
				
				<fo:block id="{generate-id(.)}"/>
			</fo:flow>		
			
		</fo:page-sequence>
	</xsl:template>

	<xsl:template match="REPT__PEDR__Generate__Entry">
		<fo:table width="100%">
					<fo:table-column column-width="10%" />
					<fo:table-column column-width="7%" />
					<fo:table-column column-width="7%" />
					<fo:table-column column-width="7%" />
					<fo:table-column column-width="3%" />
					<fo:table-column column-width="7%" />
					<fo:table-column column-width="6%" />
					<fo:table-column column-width="5%" />
					<fo:table-column column-width="8%" />
					<fo:table-column column-width="9%" />
					<fo:table-column column-width="9%" />
					<fo:table-column column-width="13%" />
					<fo:table-column column-width="9%" />
			<fo:table-body>
				<fo:table-row>
				
					<fo:table-cell>
						<fo:block font-size="8pt" text-align="left" padding="2pt">
							<xsl:value-of select="policyNumber" />
						</fo:block>
					</fo:table-cell>
									
					<fo:table-cell>
						<fo:block font-size="8pt" text-align="left" padding="2pt">
							<xsl:value-of select="type" />
						</fo:block>
					</fo:table-cell>
														
					<fo:table-cell>
						<fo:block font-size="8pt" text-align="center" padding="2pt">
							<xsl:value-of select="ahStatus" />
						</fo:block>
					</fo:table-cell>
														
					<fo:table-cell>
						<fo:block font-size="8pt" text-align="center" padding="2pt">
							<xsl:value-of select="state" />
						</fo:block>
					</fo:table-cell>
														
					<fo:table-cell>
						<fo:block font-size="8pt" text-align="center" padding="2pt">
							<xsl:value-of select="deathBenefitOption" />
						</fo:block>
					</fo:table-cell>
														
					<fo:table-cell>
						<fo:block font-size="8pt" text-align="center" padding="2pt">
							<xsl:value-of select="coverage" /><xsl:value-of select="subCoverage" />
						</fo:block>
					</fo:table-cell>
														
					<fo:table-cell>
						<fo:block font-size="8pt" text-align="left" padding="2pt">
							<xsl:value-of select="planCode" />
						</fo:block>
					</fo:table-cell>
														
					<fo:table-cell>
						<fo:block font-size="8pt" text-align="right" padding="2pt">
							<xsl:value-of select="format-number(issueAge, '###0')" />
						</fo:block>
					</fo:table-cell>
														
					<fo:table-cell>
						<fo:block font-size="8pt" text-align="right" padding="2pt">
							<xsl:variable name="issMonth" select="substring(issueDate, 6, 2)"/>
							<xsl:variable name="issDay" select="substring(issueDate, 9)"/>
							<xsl:variable name="issYear" select="substring(issueDate, 1, 4)"/>
							<xsl:variable name="issDate" select="concat($issMonth, '/', $issDay, '/', $issYear)" />
							<xsl:value-of select="$issDate" />	
						</fo:block>
					</fo:table-cell>
														
					<fo:table-cell>
						<fo:block font-size="8pt" text-align="center" padding="2pt">
							<xsl:value-of select="status" />
						</fo:block>
					</fo:table-cell>
														
					<fo:table-cell>
						<fo:block font-size="8pt" text-align="right" padding="2pt">
							<xsl:value-of select="format-number(faceAmount, '#,###,###,##0.000')" />
						</fo:block>
					</fo:table-cell>
														
					<fo:table-cell>
						<fo:block font-size="8pt" text-align="right" padding="2pt">
							<xsl:value-of select="format-number(cashValue, '##,###,###,##0.00')" />
						</fo:block>
					</fo:table-cell>
														
					<fo:table-cell>
						<fo:block font-size="8pt" text-align="right" padding="2pt">
							<xsl:value-of select="format-number(corridor, '##,###,###,##0.00')" />
						</fo:block>
					</fo:table-cell>
					
				</fo:table-row>
			</fo:table-body>
		</fo:table>
	</xsl:template>

	<xsl:template match="REPT__PEDR__Generate__TotalEntry">
		
		<fo:block>
        	&#x00A0;
   		</fo:block>
   		
   		<fo:block text-align="center" font-size="16pt" font-family="sans-serif" line-height="1.5em">
			<xsl:value-of select="totalMessage" />		
		</fo:block>
				
		<fo:block>
        	&#x00A0;
   		</fo:block>
   		
   		<fo:block text-align="center" font-size="16pt" font-family="sans-serif" line-height="1.5em">
			<xsl:text>Face Amount: </xsl:text>
			<xsl:value-of select="format-number(faceAmountOut, '###,###,###,###,##0.000')" />		
		</fo:block>
						
		<fo:block>
        	&#x00A0;
   		</fo:block>
   		
   		<fo:block text-align="center" font-size="16pt" font-family="sans-serif" line-height="1.5em">
			<xsl:text>Cash Value: </xsl:text>
			<xsl:value-of select="format-number(cashValueOut, '#,###,###,###,###,##0.00')" />		
		</fo:block>
								
		<fo:block>
        	&#x00A0;
   		</fo:block>
   		
   		<fo:block text-align="center" font-size="16pt" font-family="sans-serif" line-height="1.5em">
			<xsl:text>Corridor Amount: </xsl:text>
			<xsl:value-of select="format-number(corridorOut, '#,###,###,###,###,##0.00')" />		
		</fo:block>
		
	</xsl:template>
</xsl:stylesheet>
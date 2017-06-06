# Connect to O365

Connect-MsolService


# View O365 License SKU's
#
#Example results from Connect O365 Tenant
#
#AccountSkuId                             ActiveUnits WarningUnits ConsumedUnits
#------------                             ----------- ------------ -------------
#ucsbconnect:POWER_BI_STANDARD_FACULTY    20000       0            14           
#ucsbconnect:STANDARDWOFFPACK_STUDENT     1000000     0            0            
#ucsbconnect:STANDARDWOFFPACK_IW_STUDENT  1000000     0            0            
#ucsbconnect:PROJECTONLINE_PLAN_1_FACULTY 20000       0            5            
#ucsbconnect:OFFICESUBSCRIPTION_FACULTY   20000       0            47           
#ucsbconnect:STANDARDWOFFPACK_FACULTY     20000       0            3716   

Get-MSolAccountSku


# Configure user account properties
#
#-City "<city name>"
#-Country "<country name>"
#-Department "<department name>"
#-DisplayName "<full user name>"
#-Fax "<fax number>"
#-FirstName "<user first name>"
#-LastName "<user last name>"
#-MobilePhone "<mobile phone number>"
#-Office "<office location>"
#-PhoneNumber "<office phone number>"
#-PostalCode "<postal code>"
#-PreferredLanguage "<language>"
#-State "<state name>"
#-StreetAddress "<street address>"
#-Title "<title name>"
#-UsageLocation "<2-character country or region code>"

Set-MsolUser -UserPrincipalName "BelindaN@litwareinc.onmicosoft.com" -UsageLocation "FR"

# Create multiple user accounts
#
# Create a CSV file that contains the required user account information.
# Example: 
# Import-Csv -Path "C:\My Documents\NewAccounts.csv" | foreach {New-MsolUser -DisplayName $_.DisplayName -FirstName $_.FirstName -LastName $_.LastName -UserPrincipalName $_.UserPrincipalName -UsageLocation $_.UsageLocation -LicenseAssignment $_.AccountSkuId} | Export-Csv -Path "C:\My Documents\NewAccountResults.csv"
#
Import-Csv -Path <InputCSVFile> | foreach {New-MsolUser -DisplayName $_.DisplayName -FirstName $_.FirstName -LastName $_.LastName -UserPrincipalName $_.UserPrincipalName -UsageLocation $_.UsageLocation -LicenseAssignment $_.AccountSkuId [-Password $_.Password]} | Export-Csv -Path <OutputCSVFile>

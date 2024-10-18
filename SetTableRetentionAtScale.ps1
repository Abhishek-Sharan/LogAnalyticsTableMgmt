# **Disclaimer:**

# The author of this script provides it "as is" without any guarantees or warranties of any kind. 
# By using this script, you acknowledge that you are solely responsible for any damage, data loss, or other issues that may arise from its execution. 
# It is your responsibility to thoroughly test the script in a controlled environment before deploying it in a production setting. 
# The author will not be held liable for any consequences resulting from the use of this script. Use at your own risk.
 
 # Function to set retention for a Log Analytics table
function Set-LogAnalyticsRetention {
    param (
        [string]$ResourceGroupName,
        [string]$WorkspaceName,
        [string]$TableName,
        [int]$TotalRetentionInDays
    )

    Update-AzOperationalInsightsTable -ResourceGroupName $ResourceGroupName -WorkspaceName $WorkspaceName -TableName $TableName -TotalRetentionInDays $TotalRetentionInDays
}

# Prompt for user input
$resourceGroupName = Read-Host "Enter the Resource Group Name"
$workspaceName = Read-Host "Enter the Workspace Name"
# Prompt for multiple table names
$TableName = Read-Host "Enter the Table Names (comma-separated)"

# Split the table names into an array
$TableNameArray = $TableName -split ","

$TotalRetentionInDays = Read-Host "Enter the Total Retention Period in Days"

# Loop through each table name and set the retention period
foreach ($TableName in $TableNameArray) {
    Set-LogAnalyticsRetention -ResourceGroupName $resourceGroupName -WorkspaceName $workspaceName -TableName $TableName.Trim() -TotalRetentionInDays $TotalRetentionInDays
    Write-Host "Retention period set successfully for table $TableName in workspace $workspaceName."
}

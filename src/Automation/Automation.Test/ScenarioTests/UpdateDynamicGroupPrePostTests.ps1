# ----------------------------------------------------------------------------------
#
# Copyright Microsoft Corporation
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# http://www.apache.org/licenses/LICENSE-2.0
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# ----------------------------------------------------------------------------------

$rg = "mms-wcus"
$aa = "JemalOMSAutomation"
$azureVMIdsW = @(
        "/subscriptions/cd45f23b-b832-4fa4-a434-1bf7e6f14a5a/resourceGroups/mms-wcus/providers/Microsoft.Compute/virtualMachines/JemalCmdlet1",
        "/subscriptions/cd45f23b-b832-4fa4-a434-1bf7e6f14a5a/resourceGroups/mms-wcus/providers/Microsoft.Compute/virtualMachines/JemalCmdlet2"
    )

$azureVMIdsL = @(
        "/subscriptions/cd45f23b-b832-4fa4-a434-1bf7e6f14a5a/resourceGroups/JemalNcusRg/providers/Microsoft.Compute/virtualMachines/JemalUbuntu"
    )

$nonAzurecomputers = @("server-01", "server-02")

<#
WaitForProvisioningState
#>
function WaitForProvisioningState() {
    param([string] $Name, [string] $ExpectedState)
    $state = ""
    $timeoutInSeconds = 120
    $retries = $timeoutInSeconds / 5
    while($state -ne $ExpectedState -and $retries -gt 0) {
        $suc = Get-AzAutomationSoftwareUpdateConfiguration -ResourceGroupName $rg `
                                                                -AutomationAccountName $aa `
                                                                -Name $Name
        $state = $suc.ProvisioningState
        Write-Output "SoftwareUpdateConfiguration Provisioning state: $state"
        sleep -Seconds 5
        $retries = $retries - 1
    } 

    Assert-True {$retries -gt 0} "Timout waiting for provisioning state to reach '$ExpectedState'"
}


 function Test-CreateAndGetSoftwareUpdateConfigurationWithPrePost
{
    $name = "DG-suc-03"
    $startTime = ([DateTime]::Now).AddMinutes(10)
    $s = New-AzAutomationSchedule -ResourceGroupName $rg `
                                       -AutomationAccountName $aa `
                                       -Name $name `
                                       -Description test-OneTime `
                                       -OneTime `
                                       -StartTime $startTime `
                                       -ForUpdate

    $params = @{"param1"= "we made it!"}

    $suc = New-AzAutomationSoftwareUpdateConfiguration  -ResourceGroupName $rg `
                                                             -AutomationAccountName $aa `
                                                             -Schedule $s `
                                                             -Window `
                                                             -AzureVMResourceId $azureVMIdsL `
                                                             -Duration (New-TimeSpan -Hours 2) `
                                                             -IncludedUpdateClassification Security,Critical `
                                                             -PreTaskRunbookName "preTask" `
                                                             -PostTaskRunbookName "postTask" `
                                                             -PostTaskRunbookParameter $params `
                                                             -RebootSetting "Never"


    Assert-NotNull $suc "New-AzureRmAutomationSoftwareUpdateConfiguration returned null"
    Assert-AreEqual $suc.Name $name "Name of created software update configuration didn't match given name"

    $sucGet = Get-AzAutomationSoftwareUpdateConfiguration -ResourceGroupName $rg `
                                                                -AutomationAccountName $aa `
                                                                -Name $name

    Assert-NotNull $sucGet "Get-AzureRmAutomationSoftwareUpdateConfiguration returned null"
    Assert-AreEqual $sucGet.Name $name "Name of created software update configuration didn't match given name"
    Assert-NotNull $sucGet.Tasks "UpdateConfiguration of the software update configuration object is null"
    Assert-NotNull $sucGet.Tasks.PreTask "PreTask is null"
    Assert-NotNull $sucGet.Tasks.PostTask "PostTask is null"
    Assert-AreEqual $sucGet.Tasks.PostTask.source "postTask" "Post task didn't have the correct name"
    Assert-AreEqual $sucGet.Tasks.PostTask.parameters.Count 1 "Post task didn't have the correct number of parameters"
    Assert-AreEqual $sucGet.Tasks.PreTask.source "preTask" "Pre task didn't have the correct name"
    Assert-AreEqual $sucGet.UpdateConfiguration.Windows.RebootSetting "Never" "Reboot setting is not set to Never"
}

function Test-CreateAndGetSoftwareUpdateConfigurationWithRebootOnly
{
    $name = "DG-suc-03"
    $startTime = ([DateTime]::Now).AddMinutes(10)
    $s = New-AzAutomationSchedule -ResourceGroupName $rg `
                                       -AutomationAccountName $aa `
                                       -Name $name `
                                       -Description test-OneTime `
                                       -OneTime `
                                       -StartTime $startTime `
                                       -ForUpdate

    $suc = New-AzAutomationSoftwareUpdateConfiguration  -ResourceGroupName $rg `
                                                             -AutomationAccountName $aa `
                                                             -Schedule $s `
                                                             -Window `
                                                             -AzureVMResourceId $azureVMIdsW `
                                                             -Duration (New-TimeSpan -Hours 2) `
                                                             -RebootOnly

    Assert-NotNull $suc "New-AzureRmAutomationSoftwareUpdateConfiguration returned null"
    Assert-AreEqual $suc.Name $name "Name of created software update configuration didn't match given name"

    $sucGet = Get-AzAutomationSoftwareUpdateConfiguration -ResourceGroupName $rg `
                                                                -AutomationAccountName $aa `
                                                                -Name $name

    Assert-NotNull $sucGet "Get-AzureRmAutomationSoftwareUpdateConfiguration returned null"
    Assert-AreEqual $sucGet.Name $name "Name of created software update configuration didn't match given name"    
    Assert-AreEqual $sucGet.UpdateConfiguration.Windows.RebootSetting "RebootOnly" "Reboot setting is not set to Never"
}

function Test-GetSoftwareUpdateConfigurationRunWithPrePost
{
    $sucName = 'JemalUDWithPrepost'
    $sucrId = '63f2a659-2cce-4830-afd8-dcd8b6a0a737'

    $sucr = Get-AzAutomationSoftwareUpdateRun  -ResourceGroupName $rg `
                                                             -AutomationAccountName $aa `
                                                             -Id $sucrId


    Assert-NotNull $sucr "Get-SoftwareUpdateConfigurationRun returned null"
    Assert-AreEqual $sucr.SoftwareUpdateConfigurationName $sucName "Name of created software update configuration run didn't match given name"

    Assert-NotNull $sucr.Tasks.PreTask "PreTask is null"
    Assert-NotNull $sucr.Tasks.PostTask "PostTask is null"
    Assert-NotNull $sucr.Tasks.PreTask.JobId "PreTask jobId is null"
    Assert-NotNull $sucr.Tasks.PostTask.JobId "PostTask jobId is null"
    Assert-AreEqual $sucr.Tasks.PostTask.source "preTask" "Post task didn't have the correct source name"
    Assert-AreEqual $sucr.Tasks.PostTask.Status "Completed" "Post task didn't have the correct status"
    Assert-AreEqual $sucr.Tasks.PreTask.source "preTask" "Pre task didn't have the correct source name"
    Assert-AreEqual $sucr.Tasks.PreTask.Status "Completed" "Pre task didn't have the correct status"
}

<#
.SYNOPSIS
Tests create new automation variable with string value.
#>
function Test-CreateAndGetSoftwareUpdateConfigurationWithDynamicGroups
{
    $name = "DG-suc-04"
    $startTime = ([DateTime]::Now).AddMinutes(10)
    $s = New-AzAutomationSchedule -ResourceGroupName $rg `
                                       -AutomationAccountName $aa `
                                       -Name $name `
                                       -Description test-OneTime `
                                       -OneTime `
                                       -StartTime $startTime `
                                       -ForUpdate

$query1Scope = @(
        "/subscriptions/cd45f23b-b832-4fa4-a434-1bf7e6f14a5a/resourceGroups/mms-wcus"
    )

    $query1Location =@("Japan East", "UK South")
    $query1FilterOperator = "All"

    $tag1 = @{"tag1"= @("tag1Value1", "tag1Value2")}
    $tag1.add("tag2", "tag2Value")
    $azq = New-AzAutomationUpdateManagementAzureQuery -ResourceGroupName $rg `
                                       -AutomationAccountName $aa `
                                       -Scope $query1Scope `
                                       -Locaton $query1Location `
                                       -Tag $tag1


   $AzureQueries = @($azq)

    $nonAzureQuery1 = @{
        FunctionAlias = "SavedSearch1";
       WorkspaceResourceId = "/subscriptions/cd45f23b-b832-4fa4-a434-1bf7e6f14a5a/resourcegroups/mms-wcus/providers/microsoft.operationalinsights/workspaces/jemalwcus2"
    }

    $nonAzureQuery2 = @{
        FunctionAlias = "SavedSearch2";
       WorkspaceResourceId = "/subscriptions/cd45f23b-b832-4fa4-a434-1bf7e6f14a5a/resourcegroups/mms-wcus/providers/microsoft.operationalinsights/workspaces/jemalwcus2"
    }

    $NonAzureQueries = @($nonAzureQuery1, $nonAzureQuery2)

    $suc = New-AzAutomationSoftwareUpdateConfiguration  -ResourceGroupName $rg `
                                                             -AutomationAccountName $aa `
                                                             -Schedule $s `
                                                             -Window `
                                                             -AzureVMResourceId $azureVMIdsL `
                                                             -Duration (New-TimeSpan -Hours 2) `
                                                             -AzureQuery $AzureQueries `
                                                             -NonAzureQuery $NonAzureQueries `
                                                             -IncludedUpdateClassification Security,Critical 


    Assert-NotNull $suc "New-AzureRmAutomationSoftwareUpdateConfiguration returned null"
    Assert-AreEqual $suc.Name $name "Name of created software update configuration didn't match given name"

    $sucGet = Get-AzAutomationSoftwareUpdateConfiguration -ResourceGroupName $rg `
                                                                -AutomationAccountName $aa `
                                                                -Name $name
  
    Assert-NotNull $sucGet "Get-AzureRmAutomationSoftwareUpdateConfiguration returned null"
    Assert-AreEqual $sucGet.Name $name "Name of created software update configuration didn't match given name"
    Assert-NotNull $sucGet.UpdateConfiguration "UpdateConfiguration of the software update configuration object is null"
    Assert-NotNull $sucGet.UpdateConfiguration.Targets "Update targets object is null"
    Assert-NotNull $sucGet.UpdateConfiguration.Targets.AzureQueries "Update targets  azureQueries list  null"
    Assert-AreEqual $sucGet.UpdateConfiguration.Targets.AzureQueries.Count  1 "Update targets  doesn't have the correct number of azure queries"
   
 }
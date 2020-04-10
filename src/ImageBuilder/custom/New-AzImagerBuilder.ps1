
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

function New-AzImageBuilder {
    [OutputType([Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Models.Api20200214.IImageTemplate])]
    [CmdletBinding(PositionalBinding=$false, SupportsShouldProcess, ConfirmImpact='Medium')]
    param(
        [Parameter(Mandatory)]
        [Alias('Name')]
        [Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Category('Path')]
        [System.String]
        # The name of the image Template
        ${ImageTemplateName},
    
        [Parameter(Mandatory)]
        [Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Category('Path')]
        [System.String]
        # The name of the resource group.
        ${ResourceGroupName},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Category('Path')]
        [Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Runtime.DefaultInfo(Script='(Get-AzContext).Subscription.Id')]
        [System.String]
        # Subscription credentials which uniquely identify Microsoft Azure subscription.
        # The subscription Id forms part of the URI for every service call.
        ${SubscriptionId},
    
        [Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Category('Body')]
        [System.String]
        # Resource location
        ${Location},
    
        [Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Category('Body')]
        [System.Int32]
        # Maximum duration to wait while building the image template.
        # Omit or specify 0 to use the default (4 hours).
        ${BuildTimeoutInMinute},

        [Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Category('Body')]
        [Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Models.Api20200214.IImageTemplateCustomizer[]]
        # Specifies the properties used to describe the customization steps of the image, like Image source etc
        # To construct, see NOTES section for CUSTOMIZE properties and create a hash table.
        ${Customize},

        [Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Category('Body')]
        [Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Models.Api20200214.IImageTemplateDistributor[]]
        # The distribution targets where the image output needs to go to.
        # To construct, see NOTES section for DISTRIBUTE properties and create a hash table.
        ${Distribute},

        [ArgumentCompleter([Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Support.ResourceIdentityType])]
        [Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Category('Body')]
        [Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Support.ResourceIdentityType]
        # The type of identity used for the image template.
        # The type 'None' will remove any identities from the image template.
        ${IdentityType},
    
        [Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Category('Body')]
        [Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Runtime.Info(PossibleTypes=([Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Models.Api20200214.IImageTemplateIdentityUserAssignedIdentities]))]
        [System.Collections.Hashtable]
        # The list of user identities associated with the image template.
        # The user identity dictionary key references will be ARM resource ids in the form: '/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.ManagedIdentity/userAssignedIdentities/{identityName}'.
        ${IdentityUserAssignedIdentity},
    
        [Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Category('Body')]
        [System.DateTime]
        # End time of the last run (UTC)
        ${LastRunStatusEndTime},
    
        [Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Category('Body')]
        [System.String]
        # Verbose information about the last run state
        ${LastRunStatusMessage},
    
        [ArgumentCompleter([Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Support.RunState])]
        [Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Category('Body')]
        [Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Support.RunState]
        # State of the last run
        ${LastRunStatusRunState},
    
        [ArgumentCompleter([Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Support.RunSubState])]
        [Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Category('Body')]
        [Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Support.RunSubState]
        # Sub-state of the last run
        ${LastRunStatusRunSubState},
    
        [Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Category('Body')]
        [System.DateTime]
        # Start time of the last run (UTC)
        ${LastRunStatusStartTime},
    
        [ArgumentCompleter([Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Support.ProvisioningErrorCode])]
        [Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Category('Body')]
        [Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Support.ProvisioningErrorCode]
        # Error code of the provisioning failure
        ${ProvisioningErrorCode},
    
        [Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Category('Body')]
        [System.String]
        # Verbose error message about the provisioning failure
        ${ProvisioningErrorMessage},

        #region SourceType-PlatformImage
        [Parameter(ParameterSetName='PlatformImage', Mandatory)]
        [Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Category('Body')]
        [Switch]
        ${SourceTypePlatformImage},
        [Parameter(ParameterSetName='PlatformImage')]
        [Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Category('Body')]
        [string]
        ${Offer},
        [Parameter(ParameterSetName='PlatformImage')]
        [Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Category('Body')]
        [string]
        ${PlanInfoPlanName},
        [Parameter(ParameterSetName='PlatformImage')]
        [Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Category('Body')]
        [string]
        ${PlanInfoPlanProduct},
        [Parameter(ParameterSetName='PlatformImage')]
        [Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Category('Body')]
        [string]
        ${PlanInfoPlanPublisher},
        [Parameter(ParameterSetName='PlatformImage')]
        [Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Category('Body')]
        [string]
        ${Publisher},
        [Parameter(ParameterSetName='PlatformImage')]
        [Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Category('Body')]
        [string]
        ${Sku},
        [Parameter(ParameterSetName='PlatformImage')]
        [Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Category('Body')]
        [string]
        ${Version},
        #endregion SourceType-PlatformImage

        #region SourceType-ManagedImage
        [Parameter(ParameterSetName='ManagedImage', Mandatory)]
        [Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Category('Body')]
        [Switch]
        ${SourceTypeManagedImage},
        [Parameter(ParameterSetName='ManagedImage')]
        [Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Category('Body')]
        [string]
        ${ImageId},
        #endregion SourceType-ManagedImage

        #region SourceType-SharedImageVersion
        [Parameter(ParameterSetName='SharedImageVersion', Mandatory)]
        [Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Category('Body')]
        [Switch]
        ${SourceTypeSharedImageVersion},
        [Parameter(ParameterSetName='SharedImageVersion')]
        [Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Category('Body')]
        [string]
        ${ImageVersionId},
        #endregion SourceType-SharedImageVersion
    
        [Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Category('Body')]
        [Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Runtime.Info(PossibleTypes=([Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Models.Api20200214.IResourceTags]))]
        [System.Collections.Hashtable]
        # Resource tags
        ${Tag},
    
        [Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Category('Body')]
        [System.Int32]
        # Size of the OS disk in GB.
        # Omit or specify 0 to use Azure's default OS disk size.
        ${VMProfileOsdiskSizeInGb},
    
        [Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Category('Body')]
        [System.String]
        # Size of the virtual machine used to build, customize and capture images.
        # Omit or specify empty string to use the default (Standard_D1_v2).
        ${VMProfileVmSize},
    
        [Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Category('Body')]
        [System.String]
        # Resource id of a pre-existing subnet.
        ${VnetConfigSubnetId},
    
        #region HideParameter
        [Parameter()]
        [Alias('AzureRMContext', 'AzureCredential')]
        [ValidateNotNull()]
        [Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Category('Azure')]
        [System.Management.Automation.PSObject]
        # The credentials, account, tenant, and subscription used for communication with Azure.
        ${DefaultProfile},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Category('Runtime')]
        [System.Management.Automation.SwitchParameter]
        # Run the command as a job
        ${AsJob},
    
        [Parameter(DontShow)]
        [Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Category('Runtime')]
        [System.Management.Automation.SwitchParameter]
        # Wait for .NET debugger to attach
        ${Break},
    
        [Parameter(DontShow)]
        [ValidateNotNull()]
        [Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Category('Runtime')]
        [Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Runtime.SendAsyncStep[]]
        # SendAsync Pipeline Steps to be appended to the front of the pipeline
        ${HttpPipelineAppend},
    
        [Parameter(DontShow)]
        [ValidateNotNull()]
        [Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Category('Runtime')]
        [Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Runtime.SendAsyncStep[]]
        # SendAsync Pipeline Steps to be prepended to the front of the pipeline
        ${HttpPipelinePrepend},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Category('Runtime')]
        [System.Management.Automation.SwitchParameter]
        # Run the command asynchronously
        ${NoWait},
    
        [Parameter(DontShow)]
        [Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Category('Runtime')]
        [System.Uri]
        # The URI for the proxy server to use
        ${Proxy},
    
        [Parameter(DontShow)]
        [ValidateNotNull()]
        [Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Category('Runtime')]
        [System.Management.Automation.PSCredential]
        # Credentials for a proxy server to use for the remote call
        ${ProxyCredential},
    
        [Parameter(DontShow)]
        [Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Category('Runtime')]
        [System.Management.Automation.SwitchParameter]
        # Use the default credentials for the proxy
        ${ProxyUseDefaultCredentials}
        #endregion HideParameter
    )
    
    process {
        try {
            if ($PSBoundParameters.ContainsKey('VMProfileOsdiskSizeInGb')) {
                $PSBoundParameters.Add('VMProfileOsdiskSizeGb', $PSBoundParameters['VMProfileOsdiskSizeInGb'])
                $null = $PSBoundParameters.Remove('VMProfileOsdiskSizeInGb')
            }
            if ($PSBoundParameters.ContainsKey('SourceTypePlatformImage')) {
                $Source = [Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Models.Api20200214.ImageTemplatePlatformImageSource]::New()
                $Source.Type = "PlatformImage"
                $Source.Offer = $Offer
                $Source.PlanInfoPlanName = $PlanInfoPlanName
                $Source.PlanInfoPlanProduct = $PlanInfoPlanProduct
                $Source.PlanInfoPlanPublisher = $PlanInfoPlanPublisher
                $Source.Publisher = $Publisher
                $Source.Sku = $Sku
                $Source.Version = $Version
                $null = $PSBoundParameters.Remove('SourceTypePlatformImage')
                $null = $PSBoundParameters.Remove('Offer')
                $null = $PSBoundParameters.Remove('PlanInfoPlanName')
                $null = $PSBoundParameters.Remove('PlanInfoPlanProduct')
                $null = $PSBoundParameters.Remove('PlanInfoPlanPublisher')
                $null = $PSBoundParameters.Remove('Publisher')
                $null = $PSBoundParameters.Remove('Sku')
                $null = $PSBoundParameters.Remove('Version')
            } elseif ($PSBoundParameters.ContainsKey('SourceTypeManagedImage')) {
                $Source = [Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Models.Api20200214.ImageTemplateManagedImageSource]::New()
                $Source.Type = "ManagedImage"
                $Source.ImageId = $ImageId
                $null = $PSBoundParameters.Remove('SourceTypeManagedImage')
                $null = $PSBoundParameters.Remove('ImageId')
            } elseif ($PSBoundParameters.ContainsKey('SourceTypeSharedImageVersion')) {
                $Source = [Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Models.Api20200214.ImageTemplateSharedImageVersionSource]::New()
                $Source.Type = "SharedImageVersion"
                $Source.ImageVersionId = $ImageVersionId
                $null = $PSBoundParameters.Remove('SourceTypeSharedImageVersion')
                $null = $PSBoundParameters.Remove('ImageVersionId')
            }
            $PSBoundParameters.Add('Source', $Source)
            # $PSBoundParameters.Add('SourceType', $Source.Type)
            Write-Host $PSBoundParameters
                
            Az.ImageBuilder.internal\New-AzImageBuilder @PSBoundParameters
            return $source
        } catch {
            throw
        }
    }
}
    
---
external help file:
Module Name: Az.ImageBuilder
online version: https://docs.microsoft.com/en-us/powershell/module/az.imagebuilder/update-azimagebuildervirtualmachineimagetemplate
schema: 2.0.0
---

# Update-AzImageBuilderVirtualMachineImageTemplate

## SYNOPSIS
Create or update a virtual machine image template

## SYNTAX

### UpdateExpanded (Default)
```
Update-AzImageBuilderVirtualMachineImageTemplate -ImageTemplateName <String> -ResourceGroupName <String>
 -Location <String> [-SubscriptionId <String>] [-BuildTimeoutInMinute <Int32>]
 [-Customize <IImageTemplateCustomizer[]>] [-Distribute <IImageTemplateDistributor[]>]
 [-IdentityType <ResourceIdentityType>] [-IdentityUserAssignedIdentity <Hashtable>]
 [-LastRunStatusEndTime <DateTime>] [-LastRunStatusMessage <String>] [-LastRunStatusRunState <RunState>]
 [-LastRunStatusRunSubState <RunSubState>] [-LastRunStatusStartTime <DateTime>]
 [-ProvisioningErrorCode <ProvisioningErrorCode>] [-ProvisioningErrorMessage <String>] [-SourceType <String>]
 [-Tag <Hashtable>] [-VMProfileOsdiskSizeGb <Int32>] [-VMProfileVmsize <String>]
 [-VnetConfigSubnetId <String>] [-DefaultProfile <PSObject>] [-AsJob] [-NoWait] [-Confirm] [-WhatIf]
 [<CommonParameters>]
```

### Update
```
Update-AzImageBuilderVirtualMachineImageTemplate -ImageTemplateName <String> -ResourceGroupName <String>
 -Parameter <IImageTemplate> [-SubscriptionId <String>] [-DefaultProfile <PSObject>] [-AsJob] [-NoWait]
 [-Confirm] [-WhatIf] [<CommonParameters>]
```

### UpdateViaIdentity
```
Update-AzImageBuilderVirtualMachineImageTemplate -InputObject <IImageBuilderIdentity>
 -Parameter <IImageTemplate> [-DefaultProfile <PSObject>] [-AsJob] [-NoWait] [-Confirm] [-WhatIf]
 [<CommonParameters>]
```

### UpdateViaIdentityExpanded
```
Update-AzImageBuilderVirtualMachineImageTemplate -InputObject <IImageBuilderIdentity> -Location <String>
 [-BuildTimeoutInMinute <Int32>] [-Customize <IImageTemplateCustomizer[]>]
 [-Distribute <IImageTemplateDistributor[]>] [-IdentityType <ResourceIdentityType>]
 [-IdentityUserAssignedIdentity <Hashtable>] [-LastRunStatusEndTime <DateTime>]
 [-LastRunStatusMessage <String>] [-LastRunStatusRunState <RunState>]
 [-LastRunStatusRunSubState <RunSubState>] [-LastRunStatusStartTime <DateTime>]
 [-ProvisioningErrorCode <ProvisioningErrorCode>] [-ProvisioningErrorMessage <String>] [-SourceType <String>]
 [-Tag <Hashtable>] [-VMProfileOsdiskSizeGb <Int32>] [-VMProfileVmsize <String>]
 [-VnetConfigSubnetId <String>] [-DefaultProfile <PSObject>] [-AsJob] [-NoWait] [-Confirm] [-WhatIf]
 [<CommonParameters>]
```

## DESCRIPTION
Create or update a virtual machine image template

## EXAMPLES

### Example 1: {{ Add title here }}
```powershell
PS C:\> {{ Add code here }}

{{ Add output here }}
```

{{ Add description here }}

### Example 2: {{ Add title here }}
```powershell
PS C:\> {{ Add code here }}

{{ Add output here }}
```

{{ Add description here }}

## PARAMETERS

### -AsJob
Run the command as a job

```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -BuildTimeoutInMinute
Maximum duration to wait while building the image template.
Omit or specify 0 to use the default (4 hours).

```yaml
Type: System.Int32
Parameter Sets: UpdateExpanded, UpdateViaIdentityExpanded
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -Customize
Specifies the properties used to describe the customization steps of the image, like Image source etc
To construct, see NOTES section for CUSTOMIZE properties and create a hash table.

```yaml
Type: Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Models.Api20200214.IImageTemplateCustomizer[]
Parameter Sets: UpdateExpanded, UpdateViaIdentityExpanded
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -DefaultProfile
The credentials, account, tenant, and subscription used for communication with Azure.

```yaml
Type: System.Management.Automation.PSObject
Parameter Sets: (All)
Aliases: AzureRMContext, AzureCredential

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -Distribute
The distribution targets where the image output needs to go to.
To construct, see NOTES section for DISTRIBUTE properties and create a hash table.

```yaml
Type: Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Models.Api20200214.IImageTemplateDistributor[]
Parameter Sets: UpdateExpanded, UpdateViaIdentityExpanded
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -IdentityType
The type of identity used for the image template.
The type 'None' will remove any identities from the image template.

```yaml
Type: Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Support.ResourceIdentityType
Parameter Sets: UpdateExpanded, UpdateViaIdentityExpanded
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -IdentityUserAssignedIdentity
The list of user identities associated with the image template.
The user identity dictionary key references will be ARM resource ids in the form: '/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.ManagedIdentity/userAssignedIdentities/{identityName}'.

```yaml
Type: System.Collections.Hashtable
Parameter Sets: UpdateExpanded, UpdateViaIdentityExpanded
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -ImageTemplateName
The name of the image Template

```yaml
Type: System.String
Parameter Sets: Update, UpdateExpanded
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -InputObject
Identity Parameter
To construct, see NOTES section for INPUTOBJECT properties and create a hash table.

```yaml
Type: Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Models.IImageBuilderIdentity
Parameter Sets: UpdateViaIdentity, UpdateViaIdentityExpanded
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
Dynamic: False
```

### -LastRunStatusEndTime
End time of the last run (UTC)

```yaml
Type: System.DateTime
Parameter Sets: UpdateExpanded, UpdateViaIdentityExpanded
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -LastRunStatusMessage
Verbose information about the last run state

```yaml
Type: System.String
Parameter Sets: UpdateExpanded, UpdateViaIdentityExpanded
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -LastRunStatusRunState
State of the last run

```yaml
Type: Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Support.RunState
Parameter Sets: UpdateExpanded, UpdateViaIdentityExpanded
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -LastRunStatusRunSubState
Sub-state of the last run

```yaml
Type: Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Support.RunSubState
Parameter Sets: UpdateExpanded, UpdateViaIdentityExpanded
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -LastRunStatusStartTime
Start time of the last run (UTC)

```yaml
Type: System.DateTime
Parameter Sets: UpdateExpanded, UpdateViaIdentityExpanded
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -Location
Resource location

```yaml
Type: System.String
Parameter Sets: UpdateExpanded, UpdateViaIdentityExpanded
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -NoWait
Run the command asynchronously

```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -Parameter
Image template is an ARM resource managed by Microsoft.VirtualMachineImages provider
To construct, see NOTES section for PARAMETER properties and create a hash table.

```yaml
Type: Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Models.Api20200214.IImageTemplate
Parameter Sets: Update, UpdateViaIdentity
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
Dynamic: False
```

### -ProvisioningErrorCode
Error code of the provisioning failure

```yaml
Type: Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Support.ProvisioningErrorCode
Parameter Sets: UpdateExpanded, UpdateViaIdentityExpanded
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -ProvisioningErrorMessage
Verbose error message about the provisioning failure

```yaml
Type: System.String
Parameter Sets: UpdateExpanded, UpdateViaIdentityExpanded
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -ResourceGroupName
The name of the resource group.

```yaml
Type: System.String
Parameter Sets: Update, UpdateExpanded
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -SourceType
Specifies the type of source image you want to start with.

```yaml
Type: System.String
Parameter Sets: UpdateExpanded, UpdateViaIdentityExpanded
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -SubscriptionId
Subscription credentials which uniquely identify Microsoft Azure subscription.
The subscription Id forms part of the URI for every service call.

```yaml
Type: System.String
Parameter Sets: Update, UpdateExpanded
Aliases:

Required: False
Position: Named
Default value: (Get-AzContext).Subscription.Id
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -Tag
Resource tags

```yaml
Type: System.Collections.Hashtable
Parameter Sets: UpdateExpanded, UpdateViaIdentityExpanded
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -VMProfileOsdiskSizeGb
Size of the OS disk in GB.
Omit or specify 0 to use Azure's default OS disk size.

```yaml
Type: System.Int32
Parameter Sets: UpdateExpanded, UpdateViaIdentityExpanded
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -VMProfileVmsize
Size of the virtual machine used to build, customize and capture images.
Omit or specify empty string to use the default (Standard_D1_v2).

```yaml
Type: System.String
Parameter Sets: UpdateExpanded, UpdateViaIdentityExpanded
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -VnetConfigSubnetId
Resource id of a pre-existing subnet.

```yaml
Type: System.String
Parameter Sets: UpdateExpanded, UpdateViaIdentityExpanded
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -Confirm
Prompts you for confirmation before running the cmdlet.

```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -WhatIf
Shows what would happen if the cmdlet runs.
The cmdlet is not run.

```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Models.Api20200214.IImageTemplate

### Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Models.IImageBuilderIdentity

## OUTPUTS

### Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Models.Api20200214.IImageTemplate

## ALIASES

## NOTES

### COMPLEX PARAMETER PROPERTIES
To create the parameters described below, construct a hash table containing the appropriate properties. For information on hash tables, run Get-Help about_Hash_Tables.

#### CUSTOMIZE <IImageTemplateCustomizer[]>: Specifies the properties used to describe the customization steps of the image, like Image source etc
  - `Type <String>`: The type of customization tool you want to use on the Image. For example, "Shell" can be shell customizer
  - `[Name <String>]`: Friendly Name to provide context on what this customization step does

#### DISTRIBUTE <IImageTemplateDistributor[]>: The distribution targets where the image output needs to go to.
  - `RunOutputName <String>`: The name to be used for the associated RunOutput.
  - `Type <String>`: Type of distribution.
  - `[ArtifactTag <IImageTemplateDistributorArtifactTags>]`: Tags that will be applied to the artifact once it has been created/updated by the distributor.
    - `[(Any) <String>]`: This indicates any property can be added to this object.

#### INPUTOBJECT <IImageBuilderIdentity>: Identity Parameter
  - `[Id <String>]`: Resource identity path
  - `[ImageTemplateName <String>]`: The name of the image Template
  - `[ResourceGroupName <String>]`: The name of the resource group.
  - `[RunOutputName <String>]`: The name of the run output
  - `[SubscriptionId <String>]`: Subscription credentials which uniquely identify Microsoft Azure subscription. The subscription Id forms part of the URI for every service call.

#### PARAMETER <IImageTemplate>: Image template is an ARM resource managed by Microsoft.VirtualMachineImages provider
  - `Location <String>`: Resource location
  - `Distribute <IImageTemplateDistributor[]>`: The distribution targets where the image output needs to go to.
    - `RunOutputName <String>`: The name to be used for the associated RunOutput.
    - `Type <String>`: Type of distribution.
    - `ImageId <String>`: Resource Id of the Managed Disk Image
    - `Location <String>`: Azure location for the image, should match if image already exists
    - `GalleryImageId <String>`: Resource Id of the Shared Image Gallery image
    - `ReplicationRegion <String[]>`: A list of regions that the image will be replicated to
    - `[ArtifactTag <IImageTemplateDistributorArtifactTags>]`: Tags that will be applied to the artifact once it has been created/updated by the distributor.
      - `[(Any) <String>]`: This indicates any property can be added to this object.
    - `[ExcludeFromLatest <Boolean?>]`: Flag that indicates whether created image version should be excluded from latest. Omit to use the default (false).
    - `[StorageAccountType <SharedImageStorageAccountType?>]`: Storage account type to be used to store the shared image. Omit to use the default (Standard_LRS).
  - `SourceType <String>`: Specifies the type of source image you want to start with.
  - `[Tag <IResourceTags>]`: Resource tags
    - `[(Any) <String>]`: This indicates any property can be added to this object.
  - `[BuildTimeoutInMinute <Int32?>]`: Maximum duration to wait while building the image template. Omit or specify 0 to use the default (4 hours).
  - `[Customize <IImageTemplateCustomizer[]>]`: Specifies the properties used to describe the customization steps of the image, like Image source etc
    - `Type <String>`: The type of customization tool you want to use on the Image. For example, "Shell" can be shell customizer
    - `[Name <String>]`: Friendly Name to provide context on what this customization step does
    - `[Inline <String[]>]`: Array of shell commands to execute
    - `[ScriptUri <String>]`: URI of the shell script to be run for customizing. It can be a github link, SAS URI for Azure Storage, etc
    - `[Sha256Checksum <String>]`: SHA256 checksum of the shell script provided in the scriptUri field
    - `[RestartCheckCommand <String>]`: Command to check if restart succeeded [Default: '']
    - `[RestartCommand <String>]`: Command to execute the restart [Default: 'shutdown /r /f /t 0 /c "packer restart"']
    - `[RestartTimeout <String>]`: Restart timeout specified as a string of magnitude and unit, e.g. '5m' (5 minutes) or '2h' (2 hours) [Default: '5m']
    - `[Filter <String[]>]`: Array of filters to select updates to apply. Omit or specify empty array to use the default (no filter). Refer to above link for examples and detailed description of this field.
    - `[SearchCriterion <String>]`: Criteria to search updates. Omit or specify empty string to use the default (search all). Refer to above link for examples and detailed description of this field.
    - `[UpdateLimit <Int32?>]`: Maximum number of updates to apply at a time. Omit or specify 0 to use the default (1000)
    - `[Inline <String[]>]`: Array of PowerShell commands to execute
    - `[RunElevated <Boolean?>]`: If specified, the PowerShell script will be run with elevated privileges
    - `[ScriptUri <String>]`: URI of the PowerShell script to be run for customizing. It can be a github link, SAS URI for Azure Storage, etc
    - `[Sha256Checksum <String>]`: SHA256 checksum of the power shell script provided in the scriptUri field above
    - `[ValidExitCode <Int32[]>]`: Valid exit codes for the PowerShell script. [Default: 0]
    - `[Destination <String>]`: The absolute path to a file (with nested directory structures already created) where the file (from sourceUri) will be uploaded to in the VM
    - `[Sha256Checksum <String>]`: SHA256 checksum of the file provided in the sourceUri field above
    - `[SourceUri <String>]`: The URI of the file to be uploaded for customizing the VM. It can be a github link, SAS URI for Azure Storage, etc
  - `[IdentityType <ResourceIdentityType?>]`: The type of identity used for the image template. The type 'None' will remove any identities from the image template.
  - `[IdentityUserAssignedIdentity <IImageTemplateIdentityUserAssignedIdentities>]`: The list of user identities associated with the image template. The user identity dictionary key references will be ARM resource ids in the form: '/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.ManagedIdentity/userAssignedIdentities/{identityName}'.
    - `[(Any) <IComponentsVrq145SchemasImagetemplateidentityPropertiesUserassignedidentitiesAdditionalproperties>]`: This indicates any property can be added to this object.
  - `[LastRunStatusEndTime <DateTime?>]`: End time of the last run (UTC)
  - `[LastRunStatusMessage <String>]`: Verbose information about the last run state
  - `[LastRunStatusRunState <RunState?>]`: State of the last run
  - `[LastRunStatusRunSubState <RunSubState?>]`: Sub-state of the last run
  - `[LastRunStatusStartTime <DateTime?>]`: Start time of the last run (UTC)
  - `[ProvisioningErrorCode <ProvisioningErrorCode?>]`: Error code of the provisioning failure
  - `[ProvisioningErrorMessage <String>]`: Verbose error message about the provisioning failure
  - `[VMProfileOsdiskSizeGb <Int32?>]`: Size of the OS disk in GB. Omit or specify 0 to use Azure's default OS disk size.
  - `[VMProfileVmsize <String>]`: Size of the virtual machine used to build, customize and capture images. Omit or specify empty string to use the default (Standard_D1_v2).
  - `[VnetConfigSubnetId <String>]`: Resource id of a pre-existing subnet.

## RELATED LINKS


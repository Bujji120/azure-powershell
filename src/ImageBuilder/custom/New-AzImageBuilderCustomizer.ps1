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

function New-AzImageBuilderCustomizer {
    [OutputType('Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Models.Api20200214.IImageTemplateCustomizer')]
    [CmdletBinding(PositionalBinding=$false, SupportsShouldProcess, ConfirmImpact='Medium')]
    Param(
        #region CustomizerCommon
        [Parameter(Mandatory)]
        [Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Category('Body')]
        [string]
        ${CustomizerName},
        #endregion CustomizerCommon
    
        #region FileCustomizer
        [Parameter(ParameterSetName='FileCustomizer', Mandatory)]
        [Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Category('Body')]
        [Switch]
        ${FileCustomizer},
        [Parameter(ParameterSetName='FileCustomizer')]
        [Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Category('Body')]
        [string]
        ${FileCustomizerDestination},
        [Parameter(ParameterSetName='FileCustomizer')]
        [Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Category('Body')]
        [string]
        ${FileCustomizerSha256Checksum},
        [Parameter(ParameterSetName='FileCustomizer')]
        [Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Category('Body')]
        [string]
        ${FileCustomizerSourceUri},
        #endregion FileCustomizer
    
        #region PowerShellCustomizer
        [Parameter(ParameterSetName='PowerShellCustomizer', Mandatory)]
        [Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Category('Body')]
        [Switch]
        ${PowerShellCustomizer},
        [Parameter(ParameterSetName='PowerShellCustomizer')]
        [Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Category('Body')]
        [string[]]
        ${PowerShellCustomizerInline},
        [Parameter(ParameterSetName='PowerShellCustomizer')]
        [Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Category('Body')]
        [Boolean]
        ${PowerShellCustomizerRunElevated},
        [Parameter(ParameterSetName='PowerShellCustomizer')]
        [Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Category('Body')]
        [string]
        ${PowerShellCustomizerScriptUri},
        [Parameter(ParameterSetName='PowerShellCustomizer')]
        [Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Category('Body')]
        [string]
        ${PowerShellCustomizerSha256Checksum},
        [Parameter(ParameterSetName='PowerShellCustomizer')]
        [Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Category('Body')]
        [int[]]
        ${PowerShellCustomizerValidExitCode},
        #endregion PowerShellCustomizer
    
        #region WindowsUpdateCustomizer
        [Parameter(ParameterSetName='WindowsUpdateCustomizer', Mandatory)]
        [Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Category('Body')]
        [Switch]
        ${WindowsUpdateCustomizer},
        [Parameter(ParameterSetName='WindowsUpdateCustomizer')]
        [Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Category('Body')]
        [string[]]
        ${WindowsUpdateCustomizerFilter},
        [Parameter(ParameterSetName='WindowsUpdateCustomizer')]
        [Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Category('Body')]
        [string]
        ${WindowsUpdateCustomizerSearchCriterion},
        [Parameter(ParameterSetName='WindowsUpdateCustomizer')]
        [Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Category('Body')]
        [int]
        ${WindowsUpdateCustomizerUpdateLimit},
        #endregion WindowsUpdateCustomizer
    
        #region RestartCustomizer
        [Parameter(ParameterSetName='RestartCustomizer', Mandatory)]
        [Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Category('Body')]
        [Switch]
        ${RestartCustomizer},
        [Parameter(ParameterSetName='RestartCustomizer')]
        [Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Category('Body')]
        [string]
        ${RestartCheckCommand},
        [Parameter(ParameterSetName='RestartCustomizer')]
        [Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Category('Body')]
        [string]
        ${RestartCommand},
        [Parameter(ParameterSetName='RestartCustomizer')]
        [Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Category('Body')]
        [string]
        ${RestartTimeout},
        #endregion RestartCustomizer
    
        #region ShellCustomizer
        [Parameter(ParameterSetName='ShellCustomizer', Mandatory)]
        [Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Category('Body')]
        [Switch]
        ${ShellCustomizer},
        [Parameter(ParameterSetName='ShellCustomizer')]
        [Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Category('Body')]
        [string[]]
        ${ShellCustomizerInline},
        [Parameter(ParameterSetName='ShellCustomizer')]
        [Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Category('Body')]
        [string]
        ${ShellCustomizerScriptUri},
        [Parameter(ParameterSetName='ShellCustomizer')]
        [Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Category('Body')]
        [string]
        ${ShellCustomizerSha256Checksum}
        #endregion ShellCustomizer
    )
    
    process {
        if ($PSBoundParameters.ContainsKey('PowerShellCustomizer')) {
            $Customizer = [Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Models.Api20200214.ImageTemplatePowerShellCustomizer]::New()
            $Customizer.Type = "PowerShell"
            $Customizer.Inline = $PowerShellCustomizerInline
            $Customizer.RunElevated = $PowerShellCustomizerRunElevated
            $Customizer.ScriptUri = $PowerShellCustomizerScriptUri
            $Customizer.Sha256Checksum = $PowerShellCustomizerSha256Checksum
            $Customizer.ValidExitCode = $PowerShellCustomizerValidExitCode
        } elseif ($PSBoundParameters.ContainsKey('WindowsRestartCustomizer')) {
            $Customizer = [Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Models.Api20200214.ImageTemplateRestartCustomizer]::New()
            $Customizer.Type = "WindowsRestart"
            $Customizer.RestartCheckCommand = $RestartCheckCommand
            $Customizer.RestartCommand = $RestartCommand
            $Customizer.RestartTimeout = $RestartTimeout
        } elseif ($PSBoundParameters.ContainsKey('WindowsUpdateCustomizer')) {
            $Customizer = [Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Models.Api20200214.ImageTemplateWindowsUpdateCustomizer]::New()
            $Customizer.Type = "WindowsUpdate"
            $Customizer.Filter = $WindowsUpdateCustomizerFilter
            $Customizer.SearchCriterion = $WindowsUpdateCustomizerSearchCriterion
            $Customizer.UpdateLimit = $WindowsUpdateCustomizerUpdateLimit
        } elseif ($PSBoundParameters.ContainsKey('ShellCustomizer')) {
            $Customizer = [Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Models.Api20200214.ImageTemplateShellCustomizer]::New()
            $Customizer.Type = "Shell"
            $Customizer.Inline = $ShellCustomizerInline
            $Customizer.ScriptUri = $ShellCustomizerScriptUri
            $Customizer.Sha256Checksum = $ShellCustomizerSha256Checksum
        } elseif ($PSBoundParameters.ContainsKey('FileCustomizer')) {
            $Customizer = [Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Models.Api20200214.ImageTemplateFileCustomizer]::New()
            $Customizer.Type = "File"
            $Customizer.Destination = $FileCustomizerDestination
            $Customizer.Sha256Checksum = $FileCustomizerSha256Checksum
            $Customizer.SourceUri = $FileCustomizerSourceUri
        }
        $Customizer.Name = $CustomizerName

        return $Customizer
    }
}
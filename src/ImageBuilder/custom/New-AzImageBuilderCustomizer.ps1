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
    [CmdletBinding(DefaultParameterSetName='Name', PositionalBinding=$false, SupportsShouldProcess, ConfirmImpact='Medium')]
    Param(
        #region CustomizerCommon
        [Parameter(Mandatory)]
        [Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Category('Body')]
        [string]
        ${CustomizerName},
        [Parameter(Mandatory)]
        [ValidateSet('PowerShell', 'WindowsRestart', 'WindowsUpdate', 'Shell', 'File')]
        [Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Category('Body')]
        [string]
        ${CustomizerType},
        #endregion CustomizerCommon
    
        #region FileCustomizer
        [Parameter(ParameterSetName='ManagerdImage')]
        [Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Category('Body')]
        [string]
        ${FileCustomizerDestination},
        [Parameter(ParameterSetName='ManagerdImage')]
        [Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Category('Body')]
        [string]
        ${FileCustomizerSha256Checksum},
        [Parameter(ParameterSetName='ManagerdImage')]
        [Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Category('Body')]
        [string]
        ${FileCustomizerSourceUri},
        #endregion FileCustomizer
    
        #region PowerShellCustomizer
        [Parameter(ParameterSetName='ManagerdImage')]
        [Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Category('Body')]
        [string[]]
        ${PowerShellCustomizerInline},
        [Parameter(ParameterSetName='ManagerdImage')]
        [Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Category('Body')]
        [Boolean]
        ${PowerShellCustomizerRunElevated},
        [Parameter(ParameterSetName='ManagerdImage')]
        [Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Category('Body')]
        [string]
        ${PowerShellCustomizerScriptUri},
        [Parameter(ParameterSetName='ManagerdImage')]
        [Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Category('Body')]
        [string]
        ${PowerShellCustomizerSha256Checksum},
        [Parameter(ParameterSetName='ManagerdImage')]
        [Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Category('Body')]
        [int[]]
        ${PowerShellCustomizerValidExitCode},
        #endregion PowerShellCustomizer
    
        #region WindowsUpdateCustomizer
        [Parameter(ParameterSetName='ManagerdImage')]
        [Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Category('Body')]
        [string[]]
        ${WindowsUpdateCustomizerFilter},
        [Parameter(ParameterSetName='ManagerdImage')]
        [Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Category('Body')]
        [string]
        ${WindowsUpdateCustomizerSearchCriterion},
        [Parameter(ParameterSetName='ManagerdImage')]
        [Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Category('Body')]
        [int]
        ${WindowsUpdateCustomizerUpdateLimit},
        #endregion WindowsUpdateCustomizer
    
        #region RestartCustomizer
        [Parameter(ParameterSetName='ManagerdImage')]
        [Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Category('Body')]
        [string]
        ${RestartCheckCommand},
        [Parameter(ParameterSetName='ManagerdImage')]
        [Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Category('Body')]
        [string]
        ${RestartCommand},
        [Parameter(ParameterSetName='ManagerdImage')]
        [Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Category('Body')]
        [string]
        ${RestartTimeout},
        #endregion RestartCustomizer
    
        #region ShellCustomizer
        [Parameter(ParameterSetName='ManagerdImage')]
        [Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Category('Body')]
        [string[]]
        ${ShellCustomizerInline},
        [Parameter(ParameterSetName='ManagerdImage')]
        [Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Category('Body')]
        [string]
        ${ShellCustomizerScriptUri},
        [Parameter(ParameterSetName='ManagerdImage')]
        [Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Category('Body')]
        [string]
        ${ShellCustomizerSha256Checksum}
        #endregion ShellCustomizer
    )
    
    process {
        if ($CustomizerType -eq 'PowerShell') {
            $Customizer = [Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Models.Api20200214.ImageTemplatePowerShellCustomizer]::New()

        } elseif ($CustomizerType -eq 'WindowsRestart') {
            $Customizer = [Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Models.Api20200214.ImageTemplateRestartCustomizer]::New()
        } elseif ($CustomizerType -eq 'WindowsUpdate') {
            $Customizer = [Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Models.Api20200214.ImageTemplateWindowsUpdateCustomizer]::New()
        } elseif ($CustomizerType -eq 'Shell') {
            $Customizer = [Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Models.Api20200214.ImageTemplateShellCustomizer]::New()
        } elseif ($CustomizerType -eq 'File') {
            $Customizer = [Microsoft.Azure.PowerShell.Cmdlets.ImageBuilder.Models.Api20200214.ImageTemplateFileCustomizer]::New()
        }

        return $Customizer
    }
}
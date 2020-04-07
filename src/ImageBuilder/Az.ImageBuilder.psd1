@{
  GUID = '186f57da-9c08-42c0-b8bf-a470abe59ab3'
  RootModule = './Az.ImageBuilder.psm1'
  ModuleVersion = '4.0.0'
  CompatiblePSEditions = 'Core', 'Desktop'
  Author = 'Microsoft Corporation'
  CompanyName = 'Microsoft Corporation'
  Copyright = 'Microsoft Corporation. All rights reserved.'
  Description = 'Microsoft Azure PowerShell: ImageBuilder cmdlets'
  PowerShellVersion = '5.1'
  DotNetFrameworkVersion = '4.7.2'
  RequiredAssemblies = './bin/Az.ImageBuilder.private.dll'
  FormatsToProcess = './Az.ImageBuilder.format.ps1xml'
  FunctionsToExport = 'Get-AzImageBuilderImageBuilder', 'Get-AzImageBuilderRunOutput', 'New-AzImageBuilder', 'New-AzImageBuilderImageBuilder', 'Remove-AzImageBuilderImageBuilder', 'Start-AzImageBuilderImageBuilder', 'Stop-AzImageBuilderImageBuilder', 'Update-AzImageBuilder', '*'
  AliasesToExport = '*'
  PrivateData = @{
    PSData = @{
      Tags = 'Azure', 'ResourceManager', 'ARM', 'PSModule', 'ImageBuilder'
      LicenseUri = 'https://aka.ms/azps-license'
      ProjectUri = 'https://github.com/Azure/azure-powershell'
      ReleaseNotes = ''
    }
  }
}

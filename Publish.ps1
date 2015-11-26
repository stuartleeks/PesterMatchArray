Param(
	[Parameter(Mandatory=$true)]
	[string]$powershellGalleryKey
)
Publish-Module -NuGetApiKey $powershellGalleryKey -Path ./
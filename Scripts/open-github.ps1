﻿<#
.SYNOPSIS
	Opens GitHub's website
.DESCRIPTION
	This script launches the Web browser with the GitHub website.
.EXAMPLE
	PS> ./open-github
.NOTES
	Author: Markus Fleschutz · License: CC0
.LINK
	https://github.com/fleschutz/PowerShell
#>

& "$PSScriptRoot/open-browser.ps1" "https://github.com"
exit 0 # success
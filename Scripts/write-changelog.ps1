﻿<#
.SYNOPSIS
        Writes a changelog
.DESCRIPTION
        This PowerShell script writes an automated changelog to the console in Markdown format by using the Git commits.
	NOTE: You may also redirect the output into a file for later use.
.EXAMPLE
        PS> ./write-changelog.ps1
	  
	Changelog of PowerShell
	=======================
	...
.LINK
        https://github.com/fleschutz/PowerShell
.NOTES
        Author: Markus Fleschutz | License: CC0
#>

param([string]$RepoDir = "$PWD")
 
try {
	[system.threading.thread]::currentthread.currentculture = [system.globalization.cultureinfo]"en-US"

	Write-Progress "⏳ (1/6) Searching for Git executable..."
        $null = (git --version)
        if ($lastExitCode -ne "0") { throw "Can't execute 'git' - make sure Git is installed and available" }

	Write-Progress "⏳ (2/6) Checking local repository..."
        if (!(Test-Path "$RepoDir" -pathType container)) { throw "Can't access folder: $RepoDir" }
	$RepoDirName = (Get-Item "$RepoDir").Name

	Write-Progress "⏳ (3/6) Fetching the latest commits..."
        & git -C "$RepoDir" fetch --all --force --quiet
        if ($lastExitCode -ne "0") { throw "'git fetch --all' failed with exit code $lastExitCode" }

	Write-Progress "⏳ (4/6) Listing all Git commit messages..."
	$commits = (git -C "$RepoDir" log --boundary --pretty=oneline --pretty=format:%s | sort -u)

	Write-Progress "⏳ (5/6) Sorting the Git commit messages..."
	$features = @()
	$fixes = @()
	$updates = @()
	$various = @()
	foreach($commit in $commits) {
 		if ($commit -like "New*") {
 			$features += $commit
		} elseif ($commit -like "Add*") {
 			$features += $commit
		} elseif ($commit -like "Create*") {
 			$features += $commit
		} elseif ($commit -like "Fix*") {
 			$fixes += $commit
 		} elseif ($commit -like "Hotfix*") {
 			$fixes += $commit
 		} elseif ($commit -like "Bugfix*") {
 			$fixes += $commit
		} elseif ($commit -like "Update*") {
 			$updates += $commit
		} elseif ($commit -like "Updating*") {
 			$updates += $commit
		} elseif ($commit -like "Updaate*") {
 			$updates += $commit
		} elseif ($commit -like "Adapt*") {
 			$updates += $commit
		} elseif ($commit -like "Improve*") {
 			$updates += $commit
		} elseif ($commit -like "Change*") {
 			$updates += $commit
		} elseif ($commit -like "Changing*") {
 			$updates += $commit
 		} else {
			$various += $commit
		}
 	}
	Write-Progress "⏳ (6/6) Listing all contributors..."
	$contributors = (git -C "$RepoDir" log --format='%aN' | sort -u)
	Write-Progress -completed " "

        $Today = (Get-Date).ToShortDateString()
	Write-Output " "
	Write-Output "Changelog of $RepoDirName as of $Today"
	Write-Output "======================================"
	Write-Output " "
	Write-Output "🚀 New Features"
	Write-Output "---------------"
 	foreach($c in $features) {
 		Write-Output "* $c"
	}
	Write-Output " "
 	Write-Output "⚠️ Bug Fixes"
	Write-Output "------------"
 	foreach($c in $fixes) {
 		Write-Output "* $c"
 	}
	Write-Output " "
	Write-Output "🎉 Updates"
	Write-Output "----------"
	foreach($c in $updates) {
		Write-Output "* $c"
	}
	Write-Output " "
	Write-Output "🔦 Various"
	Write-Output "----------"
	foreach($c in $various) {
		Write-Output "* $c"
	}
	Write-Output " "
	Write-Output "🥇 Contributors"
	Write-Output "---------------"
	foreach($c in $contributors) {
		Write-Output "* $c"
	}
	exit 0 # success
} catch {
	Write-Error $_.Exception.ToString()
	exit 1
}
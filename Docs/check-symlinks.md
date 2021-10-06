# check-symlinks.ps1 - Checks every symlink in a folder (including subfolders)

check-symlinks.ps1 [<folder>]
Returns the number of broken symlinks as exit value.

## Parameters
```powershell
check-symlinks.ps1 [[-folder] <String>] [<CommonParameters>]

-folder <String>
    
    Required?                    false
    Position?                    1
    Default value                
    Accept pipeline input?       false
    Accept wildcard characters?  false

[<CommonParameters>]
    This cmdlet supports the common parameters: Verbose, Debug, ErrorAction, ErrorVariable, WarningAction, 
    WarningVariable, OutBuffer, PipelineVariable, and OutVariable.
```

## Example
```powershell
PS>./check-symlinks .
✔️ 0 out of 10 symlinks are broken in 📂/home/markus
```


## Notes
Author: Markus Fleschutz · License: CC0

## Related Links
https://github.com/fleschutz/PowerShell

*Generated by convert-ps2md.ps1 using the comment-based help of check-symlinks.ps1*
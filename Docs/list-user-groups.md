# list-user-groups.ps1 - Lists the user groups on the local computer

list-user-groups.ps1

## Parameters
```powershell
list-user-groups.ps1 [<CommonParameters>]

[<CommonParameters>]
    This cmdlet supports the common parameters: Verbose, Debug, ErrorAction, ErrorVariable, WarningAction, 
    WarningVariable, OutBuffer, PipelineVariable, and OutVariable.
```

## Example
```powershell
PS>./list-user-groups



Name            Description
----            -----------
HomeUsers       HomeUsers Security Group
Ssh Users       Members of this group can remotely access this computer over SSH protocol.
...
```


## Notes
Author: Markus Fleschutz · License: CC0

## Related Links
https://github.com/fleschutz/PowerShell

*Generated by convert-ps2md.ps1 using the comment-based help of list-user-groups.ps1*
***This repo is now archived as the functionality exists directly in Pester: https://pester.dev/docs/usage/assertions#be***

# PesterMatchArray
This module provides additional assertions for [Pester](https://github.com/pester/Pester) to help with testing array contents

Also see [PesterMatchHashtable](https://github.com/stuartleeks/PesterMatchHashtable) for hashtable assertions.

[![Build status](https://ci.appveyor.com/api/projects/status/6huvvr4ujptbkk52/branch/master?svg=true)](https://ci.appveyor.com/project/stuartleeks/pestermatcharray/branch/master)

## Installation

### PowerShell Gallery

You can install [PesterMatchArray](https://www.powershellgallery.com/packages/PesterMatchArray/) via the [PowerShell Gallery](https://www.powershellgallery.com/)

```powershell
Install-Module -Name PesterMatchArray
```

## Examples
Because Pester works with the pipeline to give a nice syntax for tests, 
and PowerShell uses the pipeline to pass sequences through functions/cmdlets, 
the syntax for assertions of arrays with Pester is a little bit unintuitive.
In particular, note the comma at the start of the assertion examples below.

### MatchArrayOrdered
MatchArrayOrdered compares two arrays. They are deemed to match if they have the same contents in the same order.

```powershell
Describe "MatchArrayOrdered examples" {
	It "single item arrays match" {
       ,@("a") | Should MatchArrayOrdered @("a")
    }
    It "arrays with the same contents match" {
        ,@("a", 1) | Should MatchArrayOrdered @("a",1)
    }
    It "arrays with the same contents in different orders do not match" {
        ,@("a", 1) | Should Not MatchArrayOrdered @(1,"a")
    }
}
```

### MatchArrayUnordered
MatchArrayUnordered compares two arrays. They are deemed to match if they have the same contents regardless of the order of the items.

```powershell
Describe "MatchArrayUnordered examples" {
	It "single item arrays match" {
       ,@("a") | Should MatchArrayUnordered @("a")
    }
    It "arrays with the same contents match" {
        ,@("a", 1) | Should MatchArrayUnordered @("a",1)
    }
    It "arrays with the same contents in different orders match" {
        ,@("a", 1) | Should MatchArrayUnordered @(1,"a")
    }
}
```

## Release Notes

### Version 0.3.1 31st July 2017
Pushed to PowerShell Gallery

Fix #4 (BUG: arrays with the same items in different quantities do not fail unordered assertion)

### Version 0.3.0 27th July 2017
Pushed to PowerShell Gallery

Updated to work with Pester v4 (tested on 4.0.5 pre-release)

### Version 0.2.1 26th November 2015
Pushed to PowerShell Gallery

Initial version of PesterMatchArray that is split out from other projects

## Future
* Wrap up to publish to chocolatey, psget

$here = Split-Path -Parent $MyInvocation.MyCommand.Path
Import-Module "$here\PesterMatchArray.psm1" -Force

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

function parse_git_branch() {
	git branch 2> $null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

function prompt {
	Write-Host ($env:UserName) -nonewline -foregroundcolor Red
	Write-Host ("┬") -nonewline -foregroundcolor Blue
	Write-Host ($env:UserDomain) -nonewline -foregroundcolor Green
	Write-Host (" " + $pwd) -nonewline -foregroundcolor Green
	Write-Host (" " + (parse_git_branch)) -nonewline -foregroundcolor Yellow 
	Write-Host (" ")
	$me="$env:UserName"
	for ( $i=0; $i -lt $me.Length; $i++) {
		Write-Host (" ") -nonewline
	}
	Write-Host ("└") -nonewline -foregroundcolor Blue
	Write-Host (" " + "$") -nonewline -foregroundcolor Blue
	return " "
}

#Alias

Set-Alias -Name neofetch -Value winfetch

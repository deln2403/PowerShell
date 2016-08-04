# http://blogs.msdn.com/b/luc/archive/2011/01/21/powershell-getting-the-hash-value-for-a-string.aspx

function Get-Hash($textToHash)
{
    $hasher = new-object System.Security.Cryptography.SHA256Managed
    $toHash = [System.Text.Encoding]::UTF8.GetBytes($textToHash)
    $hashByteArray = $hasher.ComputeHash($toHash)
    foreach($byte in $hashByteArray)
    {
         $res += $byte.ToString()
    }
    return $res;
}

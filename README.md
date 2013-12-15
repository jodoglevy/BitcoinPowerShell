BitcoinPowerShell
=================

Access live Bitcoin market data from the Windows Powershell command line.

##Use

### Import

Open up the PowerShell console, navigate to the downloaded GitHub repository, then do the following:

    cd .\BitcoinPowerShell
    import-module .\Bitcoin

If you want this PowerShell module to be avaiable in all your PowerShell sessions without having to explicitly import it as described above, simply place the Bitcoin folder within the BitcoinPowerShell project under C:\Windows\System32\WindowsPowerShell\v1.0\Modules 

### Use

Use the Get-BitcoinPrices cmdlet to get the current Bitcoin prices at various exchanges:

    Get-BitcoinPrices
    
    Exchange                                SellPrice                               BuyPrice
    --------                                ---------                               --------
    Bitstamp                                857.32                                  860.00
    BTC-E                                   856.739                                 858.4
    Camp BX                                 850.00                                  865.00
    Coinbase                                848.35                                  869.76
    Mt. Gox                                 907.00000                               902.00000

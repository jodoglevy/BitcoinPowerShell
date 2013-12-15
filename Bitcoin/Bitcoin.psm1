function Get-BitcoinPrices {
    $exchanges = @()

    $exchanges += getBitstampPrices
    $exchanges += getBtc-ePrices
    $exchanges += getCampBxPrices
    $exchanges += getCoinbasePrices
    $exchanges += getGoxPrices

    $exchanges
}

function getBitstampPrices() {
    $request = Invoke-WebRequest -Uri https://www.bitstamp.net/api/ticker/
    $json = ConvertFrom-Json $request.Content
    new-object psobject -property  @{BuyPrice = $json.Ask; SellPrice = $json.Bid; Exchange = "Bitstamp"}
}

function getBtc-ePrices() {
    $request = Invoke-WebRequest -Uri https://btc-e.com/api/2/btc_usd/ticker
    $json = ConvertFrom-Json $request.Content
    new-object psobject -property  @{BuyPrice = $json.ticker.buy; SellPrice = $json.ticker.sell; Exchange = "BTC-E"}
}

function getCampBxPrices() {
    $request = Invoke-WebRequest -Uri http://campbx.com/api/xticker.php
    $json = ConvertFrom-Json $request.Content
    new-object psobject -property  @{BuyPrice = $json."Best Ask"; SellPrice =  $json."Best Bid"; Exchange = "Camp BX"}
}

function getCoinbasePrices() {
    $buy = Invoke-WebRequest -Uri https://coinbase.com/api/v1/prices/buy
    $sell = Invoke-WebRequest -Uri https://coinbase.com/api/v1/prices/sell
    $jsonBuy = ConvertFrom-Json $buy.Content
    $jsonSell = ConvertFrom-Json $sell.Content
    new-object psobject -property  @{BuyPrice = $jsonBuy.total.amount; SellPrice = $jsonSell.total.amount; Exchange = "Coinbase"}
}

function getGoxPrices() {
    $request = Invoke-WebRequest -Uri http://data.mtgox.com/api/2/BTCUSD/money/ticker_fast
    $json = ConvertFrom-Json $request.Content
    new-object psobject -property  @{BuyPrice = $json.data.buy.value; SellPrice = $json.data.sell.value; Exchange = "Mt. Gox"}
}

Export-ModuleMember Get-BitcoinPrices
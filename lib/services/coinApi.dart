import 'package:bitcoin_ticker/price_screen.dart';
import 'networking.dart';

const apiKey = '1C10DAD6-2948-4AF4-BE81-646181E4F920';
const baseUrl = 'https://rest.coinapi.io/v1/exchangerate/';
double actualPrice = 0.0;
double actualPriceBTC = 0.0;
double actualPriceETH = 0.0;
double actualPriceBNB = 0.0;

class getCoinPrice {
  Future<dynamic> getPrice(String coin, String fiat) async {
    NetworkHelper networkHelper =
        NetworkHelper('$baseUrl$coin/$fiat?apikey=$apiKey');

    var priceCoin = await networkHelper.getData();
    print(priceCoin);
    if (priceCoin != null && priceCoin['rate'] != null) {
      //actualPrice = priceCoin['rate'].toDouble();
    } else {
      print('Не вдалося отримати ціну.');
    }
   // print(actualPrice.toDouble());
    if (priceCoin['asset_id_base']=='BTC'){
      actualPriceBTC = priceCoin['rate'].toDouble();
    }else if (priceCoin['asset_id_base']=='ETH'){
      actualPriceETH = priceCoin['rate'].toDouble();
    }else {
      actualPriceBNB = priceCoin['rate'].toDouble();
    }

    return priceCoin;
  }
}

// curl -L 'https://rest.coinapi.io/v1/exchangerate/BTC/USD?apikey=1C10DAD6-2948-4AF4-BE81-646181E4F920'
//              https://rest.coinapi.io/v1/exchangerate/ETH/USD?apikey=1C10DAD6-2948-4AF4-BE81-646181E4F920
// -H 'Accept: text/plain' \
// -H 'X-CoinAPI-Key: <API_KEY_VALUE>'/

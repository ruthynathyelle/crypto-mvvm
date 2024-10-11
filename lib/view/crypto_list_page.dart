import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cryptoinfo/view/crypto_detalhes.dart';
import '../viewModel/crypto_controller.dart';

class CryptoListPage extends StatelessWidget {
  CryptoListPage({Key? key}) : super(key: key);

  final cryptoController = Get.find<CryptoController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preços de Criptomoedas'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: cryptoController.fetchCryptos,
          ),
        ],
      ),
      body: Obx(() {
        if (cryptoController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (cryptoController.cryptos.isEmpty) {
          return Center(child: Text('Nenhuma criptomoeda encontrada.'));
        } else {
          return ListView.builder(
            itemCount: cryptoController.cryptos.length,
            itemBuilder: (context, index) {
              var crypto = cryptoController.cryptos[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2), // Cor da sombra
                          spreadRadius: 2, // Espalhamento da sombra
                          blurRadius: 8, // Borrão da sombra
                          offset: Offset(4, 4), // Deslocamento da sombra (x, y)
                        ),
                      ],
                    ),
                    width: MediaQuery.of(context).size.width * 0.80,
                    height: 70,
                    child: ListTile(
                      leading: Image.network(
                        crypto.image,
                        width: 40,
                        height: 40,
                      ),
                      title: Text(
                        crypto.cryptoName,
                        style: TextStyle(fontSize: 20),
                      ),
                      subtitle: Text(
                        crypto.symbol.toUpperCase(),
                        style: TextStyle(fontSize: 16),
                      ),
                      trailing: Text(
                        'R\$ ${crypto.price.toStringAsFixed(2)}',
                        style: TextStyle(fontSize: 18),
                      ),
                      onTap: () {
                        Get.to(() => CryptoDetailPage(crypto: crypto));
                      },
                    )),
              );
            },
          );
        }
      }),
    );
  }
}

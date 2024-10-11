import 'package:flutter/material.dart';
import '../model/crypto_model.dart';
//import 'package:cryptoinfo/viewModel/crypto_controller.dart';
//import 'package:get/get.dart';

class CryptoDetailPage extends StatelessWidget {
  final CryptoModel crypto;


  CryptoDetailPage({required this.crypto, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${crypto.cryptoName} Detalhes'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                crypto.image,
                width: 100,
                height: 100,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Nome: ${crypto.cryptoName}',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Símbolo: ${crypto.symbol.toUpperCase()}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Preço: R\$ ${crypto.price.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'capitalização de mercado: R\$ ${crypto.marketcap.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'total de transações: R\$ ${crypto.volume.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Bitcoin em circulação: ${crypto.circulating.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}

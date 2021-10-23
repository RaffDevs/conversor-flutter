import 'package:conversor/modules/conversor/components/utils/conversor_field.dart';
import 'package:conversor/modules/conversor/components/utils/get_data_message.dart';
import 'package:conversor/modules/conversor/controllers/conversor_controller.dart';
import 'package:conversor/modules/conversor/models/currencies.dart';
import 'package:flutter/material.dart';

class ConversorPage extends StatefulWidget {
  const ConversorPage({Key? key}) : super(key: key);

  @override
  State<ConversorPage> createState() => _ConversorPageState();
}

class _ConversorPageState extends State<ConversorPage> {
  final conversorController = ConversorController();
  double dolar = 0.0;
  double euro = 0.0;

  getData() async {
    final data = await conversorController.getData();
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black87,
      child: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return const Center(
                child: GetDataMessage(text: 'Carregando dados...')
              );
            default:
              if (snapshot.hasError) {
                return const GetDataMessage(text: 'Erro ao carregar dados!');
              } 
              else {
                final data = snapshot.data as Map;
                dolar = data["results"]["currencies"]["USD"]["buy"];
                euro = data["results"]["currencies"]["EUR"]["buy"];

                return SizedBox(
                  height: double.infinity,
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: const [
                        Icon(
                          Icons.monetization_on,
                          size: 150,
                          color: Colors.amber
                        ),
                        Divider(),
                        ConversorField(countryCurrency: Currencies.brazil),
                        Divider(),
                        ConversorField(countryCurrency: Currencies.usa),
                        Divider(),
                        ConversorField(countryCurrency: Currencies.europe)
                        
                      ],
                    ),
                  ),
                );
              }
          }
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:proprios/detail/widgets/custom_container.dart';

customListView(List<Map<String, dynamic>> unidades, int index) {
  return ListView(
    children: [
      customContainter(
        "Cod. Unidade: ",
        unidades[index]['unidade'],
      ),
      SizedBox(
        height: 10,
      ),
      customContainter(
        "Nome: ",
        unidades[index]['descricao'],
      ),
      SizedBox(
        height: 10,
      ),
      customContainter(
        "Vlan de Dados: ",
        unidades[index]['vlandados'],
      ),
      SizedBox(
        height: 10,
      ),
      customContainter(
        "Rede de Dados: ",
        unidades[index]['rededados'],
      ),
      SizedBox(
        height: 10,
      ),
      customContainter(
        "Vlan de Voz: ",
        unidades[index]['vlanvoz'],
      ),
      SizedBox(
        height: 10,
      ),
      customContainter(
        "Rede de Voz: ",
        unidades[index]['redevoz'],
      ),
      SizedBox(
        height: 10,
      ),
      customContainter(
        "Vlan WiFi ADM: ",
        unidades[index]['vlanwifiadm'],
      ),
      SizedBox(
        height: 10,
      ),
      customContainter(
        "Rede WiFi ADM: ",
        unidades[index]['redewifiadm'],
      ),
      SizedBox(
        height: 10,
      ),
      customContainter(
        "Gerência Switches: ",
        unidades[index]['ipgerenciaswitch'],
      ),
      SizedBox(
        height: 10,
      ),
      customContainter(
        "Gerência ONU: ",
        unidades[index]['ipgerenciaonu'],
      ),
      SizedBox(
        height: 10,
      ),
      customContainter(
        "Vlan Pedagogica: ",
        unidades[index]['vlanpedagogica'],
      ),
      SizedBox(
        height: 10,
      ),
      customContainter(
        "Rede Pedagogica: ",
        unidades[index]['redepedagogica'],
      ),
      SizedBox(
        height: 10,
      ),
      customContainter(
        "OLT: ",
        unidades[index]['olt'],
      ),
      SizedBox(
        height: 10,
      ),
      customContainter(
        "Observação: ",
        unidades[index]['obs'],
      ),
    ],
  );
}

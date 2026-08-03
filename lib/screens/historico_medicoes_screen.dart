import 'package:flutter/material.dart';
import 'package:guia_voz/utils/servico_voz.dart';

class HistoricoMedicoesScreen extends StatefulWidget {
  const HistoricoMedicoesScreen({super.key});

  @override
  State<HistoricoMedicoesScreen> createState() =>
      _HistoricoMedicoesScreenState();
}

class _HistoricoMedicoesScreenState
    extends State<HistoricoMedicoesScreen> {
  final List<Map<String, String>> _medicoes = [
    {
      "tipo": "Pressão Arterial",
      "valor": "120/80 mmHg",
      "data": "Hoje, 08:30",
      "status": "Normal",
    },
    {
      "tipo": "Glicemia Jejum",
      "valor": "98 mg/dL",
      "data": "Hoje, 07:00",
      "status": "Controlado",
    },
    {
      "tipo": "Pressão Arterial",
      "valor": "135/85 mmHg",
      "data": "Ontem, 14:20",
      "status": "Levemente Alta",
    },
  ];

  final TextEditingController _tipoController =
      TextEditingController(
    text: "Pressão Arterial",
  );

  final TextEditingController _valorController =
      TextEditingController();

String _textoCompletoLeitura(
  Map<String, String> item,
) {
  String valor =
      item["valor"] ?? "";

  valor = valor
      .replaceAll(
        "mg/dL",
        " miligramas por decilitro",
      )
      .replaceAll(
        "mmHg",
        " milímetros de mercúrio",
      );

  return
      "Medição de ${item['tipo']}. "
      "Valor de $valor. "
      "Realizada em ${item['data']}. "
      "Status ${item['status']}.";
}
  
  @override
  void dispose() {
    _tipoController.dispose();
    _valorController.dispose();
    super.dispose();
  }

  void _adicionarMedicao() {
    if (_valorController.text.trim().isEmpty) {
      return;
    }

    setState(() {
      _medicoes.insert(
        0,
        {
          "tipo": _tipoController.text,
          "valor": _valorController.text,
          "data": "Agora mesmo",
          "status": "Registrado",
        },
      );
    });

    ServicoVoz.falar(
      "Medição de ${_tipoController.text} salva com sucesso.",
    );

    _valorController.clear();

    Navigator.pop(context);
  }

  void _mostrarDialogoCadastro() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Nova Medição"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _tipoController,
              decoration: const InputDecoration(
                labelText:
                    "Tipo (ex: Pressão ou Glicemia)",
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _valorController,
              decoration: const InputDecoration(
                labelText:
                    "Valor (ex: 120/80 ou 110 mg/dL)",
              ),
              keyboardType: TextInputType.text,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () =>
                Navigator.pop(context),
            child: const Text("Cancelar"),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  Colors.teal[800],
            ),
            onPressed: _adicionarMedicao,
            child: const Text(
              "Salvar",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Histórico de Medições",
        ),
        backgroundColor: Colors.teal[800],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            const Text(
              "Acompanhe suas pressões e glicemias para apresentar durante as consultas na Unidade Básica de Saúde.",
              style: TextStyle(
                fontSize: 14,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _medicoes.length,
                itemBuilder: (
                  context,
                  index,
                ) {
                  final item =
                      _medicoes[index];

                  final bool isPressao =
                      item["tipo"]!
                          .contains(
                              "Pressão");

                  return InkWell(
  onTap: () {
    ServicoVoz.falar(
      _textoCompletoLeitura(item),
    );
  },
  child: Card(
    margin: const EdgeInsets.only(
      bottom: 12,
    ),
    elevation: 2,
    shape: RoundedRectangleBorder(
      borderRadius:
          BorderRadius.circular(
        12,
      ),
    ),
    child: ListTile(
      leading: CircleAvatar(
        backgroundColor:
            isPressao
                ? Colors.red[100]
                : Colors.blue[100],
        child: Icon(
          isPressao
              ? Icons.favorite
              : Icons.bloodtype,
          color: isPressao
              ? Colors.red[800]
              : Colors.blue[800],
        ),
      ),
      title: Text(
        "${item['tipo']}: ${item['valor']}",
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      subtitle: Text(
        "${item['data']} • Status: ${item['status']}",
      ),
      trailing: IconButton(
        icon: const Icon(
          Icons.volume_up,
          color: Colors.blueGrey,
        ),
        onPressed: () {
          ServicoVoz.falar(
            _textoCompletoLeitura(item),
          );
        },
      ),
    ),
  ),
);
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton:
          FloatingActionButton.extended(
        backgroundColor:
            Colors.teal[800],
        icon: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        label: const Text(
          "Nova Medição",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        onPressed:
            _mostrarDialogoCadastro,
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:guia_voz/utils/servico_voz.dart';

class GravadorConsultaScreen extends StatefulWidget {
  const GravadorConsultaScreen({super.key});

  @override
  State<GravadorConsultaScreen> createState() =>
      _GravadorConsultaScreenState();
}

class _GravadorConsultaScreenState
    extends State<GravadorConsultaScreen> {
  bool _estaGravando = false;

  final List<String> _consultasSalvas = [
    "Consulta Cardiológica (12/05): Aumentar a caminhada para 30 minutos e manter o Losartana de manhã.",
    "Retorno Endocrinologista (02/04): Glicemia melhorou. Continuar dieta e aferir pressão em casa.",
  ];

  Future<void> _alternarGravacao() async {
    setState(() {
      _estaGravando = !_estaGravando;
    });

    await ServicoVoz.inicializar();

    if (_estaGravando) {
      await ServicoVoz.falar(
        "Gravador iniciado. Fale as orientações do médico.",
      );
    } else {
      await ServicoVoz.falar(
        "Gravação pausada e nota gerada com sucesso.",
      );

      setState(() {
        _consultasSalvas.insert(
          0,
          "Nova Consulta Gravada: Orientação médica registrada por voz.",
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Gravador de Consultas",
        ),
        backgroundColor: Colors.indigo,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.indigo.shade50,
                borderRadius:
                    BorderRadius.circular(12),
                border: Border.all(
                  color: Colors.indigo.shade300,
                  width: 1.5,
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    _estaGravando
                        ? Icons.mic
                        : Icons.mic_none,
                    color: _estaGravando
                        ? Colors.red
                        : Colors.indigo,
                    size: 40,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        Text(
                          _estaGravando
                              ? "Gravando Consulta..."
                              : "Toque no botão para gravar",
                          style: TextStyle(
                            fontWeight:
                                FontWeight.bold,
                            color: _estaGravando
                                ? Colors.red.shade800
                                : Colors.indigo
                                    .shade900,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 2),
                        const Text(
                          "Grave as recomendações do médico na UBS para lembrar depois em casa.",
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            Center(
              child: GestureDetector(
                onTap: _alternarGravacao,
                child: Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                    color: _estaGravando
                        ? Colors.red
                        : Colors.indigo,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color:
                            (_estaGravando
                                    ? Colors.red
                                    : Colors.indigo)
                                .withAlpha(100),
                        blurRadius: 10,
                        spreadRadius: 4,
                      ),
                    ],
                  ),
                  child: Icon(
                    _estaGravando
                        ? Icons.stop
                        : Icons.mic,
                    color: Colors.white,
                    size: 45,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Consultas e Anotações Salvas:",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),

            const SizedBox(height: 10),

            Expanded(
              child: ListView.builder(
                itemCount:
                    _consultasSalvas.length,
                itemBuilder:
                    (context, index) {
                  return InkWell(
                    onTap: () async {
                      await ServicoVoz.inicializar();

                      await ServicoVoz.falar(
                        _consultasSalvas[index],
                      );
                    },
                    child: Card(
                      margin: const EdgeInsets.symmetric(
                        vertical: 6,
                      ),
                      elevation: 2,
                      child: ListTile(
                         leading: const Icon(
                             Icons.record_voice_over,
                             color: Colors.indigo,
                           ),
                      title: Text(
                        _consultasSalvas[index],
                        style:
                            const TextStyle(
                          fontSize: 13,
                          color:
                              Colors.black87,
                        ),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.volume_up,
                              color: Colors.blueGrey,
                           ),
                            onPressed: () async {
                              await ServicoVoz.inicializar();

                              await ServicoVoz.falar(
                                _consultasSalvas[index],
                              );
                            },    
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                            onPressed: () async {
                              final confirmar =
                                  await showDialog<bool>(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: const Text(
                                          "Excluir consulta",
                                        ),
                                        content: const Text(
                                          "Deseja excluir esta anotação?",
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(
                                                context,
                                                false,
                                              );
                                            },
                                            child: const Text(
                                              "Cancelar",
                                            ),
                                          ),
                                          ElevatedButton(
                                            onPressed: () {
                                              Navigator.pop(
                                                context,
                                                true,
                                              );
                                            },
                                            child: const Text(
                                              "Excluir",
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                              if (confirmar == true) {
                                setState(() {
                                  _consultasSalvas.removeAt(
                                    index,
                                  );
                                });
                                await ServicoVoz.inicializar();

                                await ServicoVoz.falar(
                                  "Consulta excluída com sucesso.",
                                );  
                              }
                            },
                          ),    
                         ],
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
    );
  }
}
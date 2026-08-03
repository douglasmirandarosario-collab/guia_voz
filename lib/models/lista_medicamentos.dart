class Medicamento {
  final String nome;
  final String bula;
  final String orientacaoDeVoz;

  const Medicamento({
    required this.nome,
    required this.bula,
    required this.orientacaoDeVoz,
  });
}

const List<Medicamento> listaMedicamentos = [
  Medicamento(
    nome: 'Captopril 25mg',
    bula:
        'Indicado para controle da pressão arterial e insuficiência cardíaca. Tomar conforme prescrição médica.',
    orientacaoDeVoz:
        'Captopril 25 miligramas. Indicado para o controle da pressão arterial. Tome conforme a orientação do seu médico no posto de saúde.',
  ),
  Medicamento(
    nome: 'Losartana Potássica 50mg',
    bula:
        'Utilizado para tratamento de hipertensão arterial e proteção renal em pacientes diabéticos.',
    orientacaoDeVoz:
        'Losartana Potássica 50 miligramas. Usado para tratar a pressão alta e proteger os rins. Mantenha o uso diário.',
  ),
  Medicamento(
    nome: 'Hidroclorotiazida 25mg',
    bula:
        'Medicamento diurético auxiliar no controle da hipertensão arterial sistêmica.',
    orientacaoDeVoz:
        'Hidroclorotiazida 25 miligramas. Diurético que ajuda a controlar a pressão arterial.',
  ),
  Medicamento(
    nome: 'Maleato de Enalapril 10mg',
    bula:
        'Indicado para hipertensão e melhoria da função cardíaca.',
    orientacaoDeVoz:
        'Maleato de Enalapril 10 miligramas. Auxilia no controle da pressão e na função do coração.',
  ),
];
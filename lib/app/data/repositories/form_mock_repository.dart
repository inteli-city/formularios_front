class FormMockRepository extends FormRepository {
  @override
  Future<List<FormEnti>> fetchForms() async {
    await Future.delayed(Duration(seconds: 1));
    return [
      
      
    ];
  }
}
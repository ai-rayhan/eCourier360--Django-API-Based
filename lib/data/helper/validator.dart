String? numericValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter a number';
  }
  final double? parsedValue = double.tryParse(value);
  if (parsedValue == null) {
    return 'Please enter a valid number';
  }
  return null;
}

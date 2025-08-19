String? Function(String?) validationNameMethod() {
  return (value) {
    if (value == null || value.trim().isEmpty) {
      return 'Name is required';
    }
    return null;
  };
}

String? Function(String?) validationPhoneMethod() {
  return (value) {
    if (value == null || value.trim().isEmpty) {
      return 'Phone number is required';
    } else if (!RegExp(r'^\d{10,15}$').hasMatch(value.trim())) {
      return 'Invalid phone number';
    }
    return null;
  };
}

String? Function(String?) validationCityMethod() {
  return (value) {
    if (value == null || value.trim().isEmpty) {
      return 'City is required';
    }
    return null;
  };
}

String? Function(String?) validationAgeMethod() {
  return (value) {
    if (value == null || value.trim().isEmpty) {
      return 'Age is required';
    } else if (int.tryParse(value.trim()) == null ||
        int.parse(value.trim()) <= 0) {
      return 'Enter a valid age';
    }
    return null;
  };
}

String? Function(String?) validationGenderMethod() {
  return (value) {
    if (value == null || value.trim().isEmpty) {
      return 'Gender is required';
    } else if (![
      'male',
      'female',
      'other',
    ].contains(value.trim().toLowerCase())) {
      return 'Enter male, female, or other';
    }
    return null;
  };
}

import 'package:vigenere_cipher/constants.dart';
import 'package:vigenere_cipher/utils.dart';

void main() {
  var matrix = createMatrix(tokens: baseCharacters);
  var cipherText = input(label: 'Enter the ciphertext:');
  print("");
  var password = input(label: 'Enter the password:');

  // Call the method that performs the decryption and
  // pass it all the required arguments.
  var plainText = cipher(
    cipherText: cipherText,
    password: password,
    tokens: baseCharacters,
    matrix: matrix,
    validateInputText: baseCharactersValidationRE,
  );

  print("");
  print("Message: $plainText");
}

String cipher({
  required String cipherText,
  required String password,
  required String tokens,
  required String matrix,
  required RegExp validateInputText,
}) {
  // Validate cipherText.
  if (validateInputText.hasMatch(cipherText) == false) {
    throw Exception('Bad input');
  }

  // Get the password pattern.
  var passwordPattern = repeatPattern(
    pattern: password,
    max: cipherText.length,
  );

  var plainText = "";

  for (var i = 0; i < cipherText.length; i++) {
    var y = getPosition(character: passwordPattern[i], tokens: tokens);

    // Get row at matrix[y].
    var row = matrix.substring(y * tokens.length, y * tokens.length + tokens.length);

    // Get the index of cipherText[i] at row.
    var index = row.indexOf(cipherText[i]);

    // Get the value at tokens[index].
    var value = tokens[index];

    plainText += value;
  }

  return plainText;
}

import 'package:vigenere_cipher/constants.dart';
import 'package:vigenere_cipher/utils.dart';

void main() {
  var matrix = createMatrix(tokens: baseCharacters);
  var plainText = input(label: 'Enter the plaintext:');
  print("");
  var password = input(label: 'Enter the password:');

  // Call the method that performs the encryption and
  // pass it all the required arguments.
  var cipherText = cipher(
    plainText: plainText,
    password: password,
    tokens: baseCharacters,
    matrix: matrix,
    validateInputText: baseCharactersValidationRE,
  );

  print("");
  print("Message: $cipherText");
}

String cipher({
  required String plainText,
  required String password,
  required String tokens,
  required String matrix,
  required RegExp validateInputText,
}) {
  // Validate plainText.
  if (validateInputText.hasMatch(plainText) == false) {
    throw Exception('Bad input');
  }

  // Get the password pattern.
  var passwordPattern = repeatPattern(
    pattern: password,
    max: plainText.length,
  );

  var cipherText = "";

  for (var i = 0; i < plainText.length; i++) {
    var x = getPosition(character: plainText[i], tokens: tokens);
    var y = getPosition(character: passwordPattern[i], tokens: tokens);
    var value = getAt(x: x, y: y, matrix: matrix, tokensLength: tokens.length);
    cipherText += value;
  }

  return cipherText;
}

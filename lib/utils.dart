import 'dart:io';

String createMatrix({required String tokens}) {
  var matrix = '';
  var offset = 0;
  var tokensLength = tokens.length;

  for (var i = 0; i < tokensLength; i++) {
    var row = '';

    for (var j = 0; j < tokensLength; j++) {
      var index = (j + offset) % tokensLength;
      row += tokens[index];
    }

    matrix += row;
    offset++;
  }

  return matrix;
}

String getAt({
  required int x,
  required int y,
  required String matrix,
  required int tokensLength,
}) {
  var position = y * tokensLength + x;

  if (position >= matrix.length) {
    return '';
  }

  return matrix[position];
}

int getPosition({
  required String character,
  required String tokens,
}) {
  return tokens.indexOf(character);
}

String repeatPattern({
  required String pattern,
  required int max,
}) {
  var repeatedPattern = "";

  for (var i = 0; i < max; i++) {
    repeatedPattern += pattern[i % pattern.length];
  }

  return repeatedPattern;
}

String input({required String label}) {
  print(label);
  return stdin.readLineSync() ?? '';
}

const baseCharacters =
    '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ!"#%()*+,-./:; ';

var baseCharactersValidationRE = RegExp(
  r'^[0-9a-zA-Z!"#%\()*+,-./:;\s]+$',
);

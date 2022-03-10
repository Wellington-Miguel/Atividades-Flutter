class Strings {
  static const appName = 'Cidades Maravilhosas';
  static const errorLocationPermissionTitle = 'Sem permissão';
  static const errorLocationPermissionDescription =
      'Precisamos de permissão para trabalhar!';
  static const givePermission = 'Dar permissão';
  static const myLocation = 'Minha localização';
  static const errorGpsDisabledTitle = 'GPS Desligado';
  static const errorGpsDisabledDescription =
      'Estamos igual ao meme do Travolta:\nOnde estou?';
  static const enableLocationService = 'Ligar GPS';

  static String distanceFromMe(String distance) =>
      'Distância de mim: $distance';
  static String latitude(double latitude) => 'Latitude: $latitude';
  static String longitude(double longitude) => 'Longitude: $longitude';
}

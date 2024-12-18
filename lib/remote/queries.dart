import 'package:graphql_flutter/graphql_flutter.dart';

class MyQueries {
  static final HttpLink httpLink = HttpLink(
    'https://rickandmortyapi.com/graphql',
  );
  static String getCharacters = """query Query(\$page: Int!) {
  characters(page: \$page) {
    info {
      count
      pages
    }
    results {
      name
      id
      gender
      image
      status
      type
    }
  }
}
""";

  static String fetchCharacterQuery = '''
query Character(\$characterId: ID!) {
  character(id: \$characterId) {
    created
    name
    gender
    image
    species
    status
    type
    episode {
      name
      air_date
      episode
    }
     location {
      type
      name
    }
    origin {
      name
      dimension

    }
  }
}
''';
}

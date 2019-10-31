class ApiRequest {
  final getCharacters = '''
    query (\$page: Int!){
      characters (page: \$page){
        info {
          count,
          pages,
          next,
          prev
        }
        results{
          id,
          name,
          status,
          species,
          type,
          gender,
          origin {
            id,
            name,        
          },
          location {
            id,
            name
          },
          image
        }
      }
    }
  ''';
}

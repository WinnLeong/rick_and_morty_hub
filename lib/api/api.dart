class Api {
  final characters = '''
    query {
      characters {
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

import 'package:graphql/client.dart';

class GQL {
  static missions({int limit = 10, required int offset}) {
    return gql(""" 
{
  missions(limit: $limit, offset: $offset) {
    description
    id
    manufacturers
    name
    wikipedia
    website
    twitter
  }
}
""");
  }

  static capsules({int limit = 10, required int offset}) {
    return gql(""" 
{
  capsules(limit: $limit, offset: $offset) {
      id
      landings
      original_launch
      reuse_count
      status
      type
  }
}
    """);
  }

  static launches({int limit = 10, required int offset}) {
    return gql(""" 
{
  launches(offset: $offset, limit: $limit) {
    id
    launch_year
    launch_success
    mission_name
    upcoming
  }
}
    """);
  }

  static rockets({int limit = 10, required int offset}) {
    return gql(""" 
{
  rockets(limit: $limit, offset: $offset) {
    country
    description
    height {
      meters
    }
    name
    landing_legs {
      number
    }
    id
    company
  }
}

    """);
  }

  static ships({int limit = 10, required int offset}) {
    return gql(""" 
{
  ships(limit: $limit, offset: $offset) {
    id
    image
    missions {
      name
    }
    name
    status
    year_built
  }
}

    """);
  }

  static capsule() {
    return gql(""" 
query SingleCapsule(\$id:ID!){
  capsule(id:\$id) {
      id
      landings
      original_launch
      reuse_count
      status
      type
  }
}
    """);
  }
}

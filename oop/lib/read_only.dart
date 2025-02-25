class Cache {
  late Map<String, String> cache = getCacheFromDB();

  late String? name;

  static Map<String, String> getCacheFromDB() {
    print("Fetching cache from DB");
    return {'key': 'value'};
  }
}

void main() {
  Cache cache = Cache();

  cache.name = null;
  print(cache.name);

  cache.name = "Cache";

  print("Cache object created");

  print(cache.cache['key']);

  try {
    cache.name = "Cache";
  } catch (e) {
    print(e);
  }
  //cache.cache = {};//Error
  cache.cache.clear();
  print(cache.cache);
}

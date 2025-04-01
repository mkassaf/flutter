void main() {
  print('Start');
  displayUserData();
  print('End');
}

Future<void> displayUserData() async {
  try {
    String data = await fetchUserData();
    print(data); // User data loaded
  } catch (error) {
    print(error);
  }
}

Future<String> fetchUserData() {
  return Future.delayed(Duration(seconds: 2), () {
    print('Fetching user data...');
    return 'User data loaded';
  });
}

enum Days { Sunday, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday }

void main() {
  // Days.values: It returns all the values of the enum.
  for (Days day in Days.values) {
    print(day);
  }
}

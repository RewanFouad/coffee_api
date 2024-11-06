void main() {
  bools(5);
}

bool bools(int value, [int min = 0, int max = 0]) {
  return value <= min && value <= max;
}

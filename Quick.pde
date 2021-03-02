
int partition(int[] arr, int lo, int hi) {
  int pivot = arr[hi];
  int i = lo;
  for (int j = lo; j < hi; j++) {
    comp++;
    if (arr[j] < pivot) {
      swap(arr, j, i);
      i++;
    }
  }
  swap(arr, i, hi);
  return i;
}

void quickSort(int[] arr, int lo, int hi) {
  if (lo < hi) {
    int p = partition(arr, lo, hi);
    quickSort(arr, lo, p-1);
    quickSort(arr, p+1, hi);
  }
}
void heapify(int[] arr, int size, int i) {
  int max = i;
  int l = 2 * i + 1;
  int r = 2 * i + 2;

  comp++;
  if (l < size && arr[l] > arr[max]) {
    max = l;
  }

  comp++;
  if (r < size && arr[r] > arr[max]) {
    max = r;
  }

  if (max != i) {
    swap(arr, i, max);
    heapify(arr, size, max);
  }
}

void heapSort(int[] arr) {
  for (int i = arr.length / 2 - 1; i >= 0; i --) {
    heapify(arr, arr.length, i);
  }

  for (int i = arr.length - 1; i >= 0; i --) {
    swap(arr, 0, i);
    heapify(arr, i, 0);
  }
}
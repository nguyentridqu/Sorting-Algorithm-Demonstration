void bubbleSort(int[] arr) {
  boolean swapped = false;
  for (int i = 0; i < arr.length - 1; i++) {
    comp++;
    if (arr[i] > arr[i+1]) {
      swap(arr, i, i+1);
      swapped = true;
    }
  }
  if (swapped) bubbleSort(arr);
}

void selectionSort(int[] arr) {
  for (int i = 0; i < arr.length; i++) {
    int min = i;
    for (int j = i + 1; j < arr.length; j++) {
      comp++;
      if (arr[j] < arr[min]) {
        min = j;
      }
    }
    swap(arr, i, min);
  }
}

void insertionSort(int[] arr) {
  for (int i = 0; i < arr.length - 1; i++) {
    int j = i;
    while (j >= 0 && arr[j] > arr[j+1]) {
      comp++;
      swap(arr, j, j+1);
      j--;
    }
    comp++;
  }
}

void insertionSort(int[] arr, int i1, int i2) {
  for (int i = i1; i <= i2; i++) {
    int j = i;
    while (j > i1 && arr[j-1] > arr[j]) {
      comp++;
      swap(arr, j, j-1);
      j--;
    }
    comp++;
  }
}
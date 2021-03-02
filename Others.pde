void cocktailShakerSort(int[] arr) {
  boolean swapped = false;
  for (int i = 0; i < arr.length - 1; i++) {
    comp++;
    if (arr[i] > arr[i+1]) {
      swap(arr, i, i+1);
      swapped = true;
    }
  }
  for (int i = arr.length - 1; i > 0; i--) {
    comp++;
    if (arr[i] < arr[i-1]) {
      swap(arr, i, i-1);
      swapped = true;
    }
  }
  if (swapped) cocktailShakerSort(arr);
}

void doubleSelectionSort(int[] arr) {
  for (int i = 0; i < arr.length; i++) {
    int min = i;
    for (int j = i + 1; j < arr.length - 1 - i; j++) {
      comp++;
      if (arr[j] < arr[min]) {
        min = j;
      }
    }
    swap(arr, i, min);
    int max = arr.length - 1 - i;
    for (int j = max - 1; j > i; j--) {
      comp++;
      if (arr[j] > arr[max]) {
        max = j;
      }
    }
    swap(arr, arr.length - 1 - i, max);
  }
}

void combSort(int[] arr) {
  int gap = arr.length;
  float shrink = 1.3;
  boolean sorted = false;

  while (!sorted) {
    gap = floor(gap / shrink);
    if (gap > 1) {
      sorted = false;
    } else {
      gap = 1;
      sorted = true;
    }

    for (int i = 0; i + gap < arr.length; i++) {
      comp++;
      if (arr[i] > arr[i + gap]) {
        swap(arr, i, i + gap);
        sorted = false;
      }
    }
  }
}

void shellSort(int[] arr) {
  int[] gaps = new int[(int)(log(arr.length)/log(2))+1];

  for (int i = 0; i < gaps.length; i++) {
    gaps[i] = (int)(pow(2, gaps.length-i))-1;
  }
  for (int gap : gaps) {
    for (int i = gap; i < arr.length; i++) {
      for (int j = i; j >= gap; j-= gap) {
        comp++;
        if (arr[j - gap] > arr[j]) {
          swap(arr, j, j-gap);
        }
      }
    }
  }
}

void slowSort(int[] arr, int i1, int i2) {
  if (i1 < i2) {
    int m = (i1+i2)/2;
    slowSort(arr, i1, m);
    slowSort(arr, m+1, i2);
    comp++;
    if (arr[i2] < arr[m]) {
      swap(arr, i2, m);
      swap++;
    }
    slowSort(arr, i1, i2-1);
  }
}

void bogoSort(int[] arr) {
  while (!isSorted(arr)) {
    shuffleArr(arr);
  }
}

void bitonicSort(int[] arr, int lo, int len, boolean dir)
{
  if (len>1)
  {
    int m=len/2;
    bitonicSort(arr, lo, m, !dir);
    bitonicSort(arr, lo + m, len - m, dir);
    bitonicMerge(arr, lo, len, dir);
  }
}

void bitonicMerge(int[] arr, int lo, int len, boolean dir)
{
  if (len > 1)
  {
    int m = binaryLength(len);
    for (int i = lo; i < lo + len - m; i++) {
      if (dir == (arr[i] > arr[i + m])) {
        swap(arr, i, i + m);
      }
    }
    bitonicMerge(arr, lo, m, dir);
    bitonicMerge(arr, lo + m, len - m, dir);
  }
}

int binaryLength(int len)
{
  int k = 1;
  while (k > 0 && k < len)
    k = k<<1;
  return k>>>1;
}
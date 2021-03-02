int[] merge(int[] arr1, int[] arr2) {
  int[] merged = new int[arr1.length + arr2.length];

  int i1 = 0;
  int i2 = 0;
  int i = 0;

  while (i1 < arr1.length && i2 < arr2.length) {
    comp++;
    if (arr1[i1] < arr2[i2]) {
      merged[i] = arr1[i1];
      i++;
      i1++;
    } else {
      merged[i] = arr2[i2];
      i++;
      i2++;
    }
  }

  while (i1 < arr1.length) {
    merged[i] = arr1[i1];
    i++;
    i1++;
  }

  while (i2 < arr2.length) {
    merged[i] = arr2[i2];
    i++;
    i2++;
  }

  return merged;
}

int[] mergeSort(int[] arr) {

  int[] arr1 = new int[ceil((float)arr.length/2)];
  int[] arr2 = new int[floor((float)arr.length/2)];

  int i = 0;
  while (i < arr1.length) {
    arr1[i] = arr[i];
    i++;
  }

  i = 0;
  while (i < arr2.length) {
    arr2[i] = arr[i + arr1.length];
    i++;
  }
  if (arr1.length > 1) {
    arr1 = mergeSort(arr1);
  }

  if (arr2.length > 1) {
    arr2 = mergeSort(arr2);
  }

  return merge(arr1, arr2);
}

void mergeSortAnimate(int[] arr, int i1, int i2) {
  int mid = (i2+i1)/2;
  int[] arr1 = new int[mid - i1 + 1];
  int[] arr2 = new int[i2 - mid];


  if (arr1.length > 1) {
    mergeSortAnimate(arr, i1, mid);
  }
  if (arr2.length > 1) {
    mergeSortAnimate(arr, mid+1, i2);
  }

  for (int i = i1; i <= mid; i++) {
    arr1[i-i1] = arr[i];
  }

  for (int i = mid + 1; i <= i2; i++) {
    arr2[i-mid-1] = arr[i];
  }


  int a = 0;
  int b = 0;
  int i = i1;

  while (a < arr1.length && b < arr2.length) {
    comp++;
    animation.add(arr.clone());
    swaps.add(new int[]{i, arr[i], i1 + arr1.length  + b, arr[ i1 + arr1.length  + b]});
    if (arr1[a] < arr2[b]) {
      arr[i] = arr1[a];
      i++;
      a++;
    } else {
      arr[i] = arr2[b];
      i++;
      b++;
    }
  }

  while (a < arr1.length) {
    animation.add(arr.clone());
    swaps.add(new int[]{i, arr[i], i1+a, arr[i1+a]});
    arr[i] = arr1[a];
    i++;
    a++;
  }

  while (b < arr2.length) {
    animation.add(arr.clone());
    swaps.add(new int[]{i, arr[i], i1 + arr1.length  + b, arr[ i1 + arr1.length  + b]});
    arr[i] = arr2[b];
    i++;
    b++;
  }
}

void weaveMergeSort(int[] arr, int i1, int i2) {
  int mid = (i2+i1)/2;
  int[] arr1 = new int[mid - i1 + 1];
  int[] arr2 = new int[i2 - mid];


  if (arr1.length > 1) {
    weaveMergeSort(arr, i1, mid);
  }
  if (arr2.length > 1) {
    weaveMergeSort(arr, mid+1, i2);
  }

  for (int i = i1; i <= mid; i++) {
    arr1[i-i1] = arr[i];
  }

  for (int i = mid + 1; i <= i2; i++) {
    arr2[i-mid-1] = arr[i];
  }

  int i = 0;
  int a = 0;
  int b = 0;

  while (a < arr1.length || b < arr2.length) {
    if (i%2 == 0) {
      animation.add(arr.clone());
      arr[i+i1] = arr1[a];
      i++;
      a++;
    } else {
      animation.add(arr.clone());
      arr[i+i1] = arr2[b];
      i++;
      b++;
    }
  }
  
  if (i2 > i1) {
    insertionSort(arr, i1, i2);
  }
}
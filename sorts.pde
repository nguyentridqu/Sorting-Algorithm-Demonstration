int [] list;
long comp;
long swap;

PImage img;

void setup() {
  size(600, 600);
  background(255);
  strokeWeight(4);
  fill(0);

  list = new int[600];
  for (int i = 0; i < list.length; i++) {
    list[i] = i;
  }

  //shuffleArr(list);
  //bubbleSort(list);

  //shuffleArr(list);
  //selectionSort(list);

  //shuffleArr(list);
  //insertionSort(list);

  //shuffleArr(list);
  //list = mergeSort(list);
  
  shuffleArr(list);
  quickSort(list,0,list.length - 1);

  println("Comparisons: " + comp + "\nSwaps: " + swap);
  for (int i = 0; i < list.length; i++) {
    point(i, height-2 - list[i]);
  }



  img = loadImage("sample2.jpg");
  image(img,0,0);
  img.loadPixels();

  img.pixels = mergeSort(img.pixels);
  //bubbleSort(img.pixels);
  //selectionSort(img.pixels);
  //insertionSort(img.pixels);

  img.updatePixels();
  image(img,0,0);
}

void shuffleArr(int[] arr) {
  for (int i = 0; i < arr.length*2; i++) {
    int index1 = (int)random(arr.length - 1);
    int index2 = (int)random(arr.length - 1);
    swap(arr, index1, index2);
  }
}

void swap(int[] arr, int index1, int index2) {
  int temp = arr[index1];
  arr[index1] = arr[index2];
  arr[index2] = temp;
  swap++;
}

boolean isSorted(int[] arr) {
  for (int i = 0; i < arr.length -1; i ++) {
    if (arr[i] > arr[i+1]) {
      return false;
    }
  }
  return true;
}

void bubbleSort(int[] arr) {
  comp = 0;
  swap = 0;

  while (!isSorted(arr)) {
    for (int i = 0; i < arr.length - 1; i++) {
      comp++;
      if (arr[i] > arr[i+1]) {
        swap(arr, i, i+1);
      }
    }
  }

  println("BUBBLE SORT");
}

void selectionSort(int[] arr) {
  comp = 0;
  swap = 0;

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

  println("SELECTION SORT");
}

void insertionSort(int[] arr) {
  comp = 0;
  swap = 0;

  for (int i = 0; i < arr.length - 1; i++) {
    int j = i;
    while (j >= 0 && arr[j] > arr[j+1]) {
      comp++;
      swap(arr, j, j+1);
      j--;
    }
    comp++;
  }

  println("INSERTION SORT");
}

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

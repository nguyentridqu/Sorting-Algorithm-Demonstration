int getMax(int[] arr) {
  int max = arr[0];
  for (int i : arr) {
    comp++;
    if (i > max) {
      max = i;
    }
  }
  return max;
}

int getMax(int[] arr, int i1, int i2) {
  int max = arr[0];
  for (int i = i1; i <= i2; i++) {
    comp++;
    if (arr[i] > max) {
      max = arr[i];
    }
  }
  return max;
}

void countingSort(int[] arr, int e) {
  int[] out = new int[arr.length];
  int[] count = new int[10];

  for (int i = 0; i < count.length; i++) {
    count[i] = 0;
  }
  for (int i = 0; i< arr.length; i++) {
    count[(arr[i] / e) % 10]++;
  }
  for (int i = 1; i < 10; i++) {
    count[i] += count[i-1];
  }
  for (int i = arr.length - 1; i >= 0; i--) {
    out[count[(arr[i] / e) % 10]-1] = arr[i];
    count[(arr[i] / e) % 10]--;
  }
  for (int i = 0; i < arr.length; i++) {
    arr[i] = out[i];
    animation.add(arr.clone());
  }
}

void radixSort10(int[] arr) {
  int max = getMax(arr);
  for (int e = 1; max / e > 0; e *= 10) {
    countingSort(arr, e);
  }
}

void radixSort2LSD(int[] arr) {
  int len = ceil(log(getMax(arr))/log(2));

  for (int i = 0; i < len; i++) {
    ArrayList<Integer> arr0 = new ArrayList<Integer>();
    ArrayList<Integer> arr1 = new ArrayList<Integer>();

    for (int a : arr) {
      comp++;
      if ((a>>i) % 2 == 0) {
        arr0.add(a);
      } else {
        arr1.add(a);
      }
    }

    int j = 0;
    for (int a : arr0) {
      animation.add(arr.clone());
      arr[j] = a;
      j++;
    }

    for (int a : arr1) {
      animation.add(arr.clone());
      arr[j] = a;
      j++;
    }
  }
}

void radixSort2MSD(int[] arr, int i1, int i2, int e) {
  if (e >=0) {
    ArrayList<Integer> arr0 = new ArrayList<Integer>();
    ArrayList<Integer> arr1 = new ArrayList<Integer>();
    
    for (int i = i1; i <= i2; i++) {
      comp++;
      if ((arr[i]>>e) % 2 == 0) {
        arr0.add(arr[i]);
      } else {
        arr1.add(arr[i]);
      }
    }

    int j = i1;
    for (int a : arr0) {
      animation.add(arr.clone());
      arr[j] = a;
      j++;
    }

    for (int a : arr1) {
      animation.add(arr.clone());
      arr[j] = a;
      j++;
    }
    
    radixSort2MSD(arr, i1, i1 + arr0.size()-1, e-1);
    radixSort2MSD(arr, i1 + arr0.size(), i2, e-1);
  }
}
float speed = 5;
String ANIMATION_TYPE = "ARCS";   //"LINES", "DOTS", "POINTS", "ARCS", "COLUMNS"
String COLOR_MODE = "COLOR";       //"WHITE", "COLOR", "SHADE"
String[] sorts = {"BUBBLE_SORT", "COCKTAIL_SHAKER_SORT", "SELECTION_SORT", "DOUBLE_SELECTION_SORT", "INSERTION_SORT", "COMB_SORT", "SHELL_SORT", "MERGE_SORT", "HEAP_SORT", "QUICK_SORT", "RADIX10_SORT", "RADIX2LSD_SORT", "RADIX2MSD_SORT", "BITONIC_SORT", "WEAVE_MERGE_SORT", "SLOW_SORT"};
int SORT_TYPE = 8;

// 0-bubble
// 1-cocktail shaker
// 2-selection
// 3-double selection
// 4-insertion
// 5-comb
// 6-shell
// 7-merge
// 8-heap
// 9-quick
// 10-radix base-10
// 11-radix base-2 LSD
// 12-radix base-2 MSD
// 13-bitonic
// 14-weave merge

int [] list;
long comp;
long swap;

ArrayList<int[]> animation = new ArrayList<int[]>();
ArrayList<int[]> swaps = new ArrayList<int[]>();
ArrayList<ArrayList<Integer>> mergeSortAnimate = new ArrayList<ArrayList<Integer>>();

void setup() {
  size(600, 600);
  background(0);
  stroke(255);
  frameRate(100);
  colorMode(HSB);
  fill(255);
  textSize(15);
  ellipseMode(RADIUS);

  switch(ANIMATION_TYPE) {
  case "DOTS":
  case "POINTS":
    strokeWeight(4);
    break;
  case "ARCS":
    noStroke();
    break;
  case "LINES":
  case "COLUMNS":
  default:
    strokeWeight(1);
    break;
  }

  list = new int[width];
  int div = 50;
  for (int i = 0; i < list.length; i++) {
    list[i] = i;
    //list[i] = round(i/div)*div;
    //list[i] = (int)random(height);
  }

  shuffleArr(list);

  sortArr(list, sorts[SORT_TYPE]);

}

void draw() {
  int frame = (int) speed * frameCount;
  if (frame < animation.size()-1) {
    drawArr(animation.get(frame));
    //drawSwap(frame);
  } else {
    drawArr(list);
  }
}

void drawSwap(int i) {
  int [] temp = swaps.get(i);

  stroke(255, 0, 0);
  line(temp[0], height - temp[1], temp[0], height);
  line(temp[2], height - temp[3], temp[2], height);
  stroke(255);
}

void drawArr(int[] arr) {
  background(0);
  for (int i = 0; i < arr.length; i++) {
    if (COLOR_MODE.equals("COLOR")) {
      color c = color(map(arr[i], 0, arr.length, 0, 255), 255, 255);
      if (ANIMATION_TYPE.equals("ARCS")) {
        fill(c);
      } else {
        stroke(c);
      }
    } else if (COLOR_MODE.equals("SHADE")) {
      color c = color(map(arr[i], 0, arr.length, 0, 255));
      if (ANIMATION_TYPE.equals("ARCS")) {
        fill(c);
      } else {
        stroke(c);
      }
    }

    if (ANIMATION_TYPE.equals("POINTS")) {
      point(i, height - arr[i]);
    } else if (ANIMATION_TYPE.equals("LINES")) {
      line(i, height - arr[i], i, height);
    } else if (ANIMATION_TYPE.equals("COLUMNS")) {
      line(i, 0, i, height);
    } else if (ANIMATION_TYPE.equals("DOTS")) {
      float r = abs(arr[i] - i);
      if (r > arr.length/2) r = 600 - r;
      float radius = 0.8 * min(width, height) * (arr.length/2 - r) / arr.length;

      point(width/2 + radius * cos (i * TWO_PI/arr.length - HALF_PI), 
        height/2 + radius * sin (i * TWO_PI/arr.length - HALF_PI));
    } else if (ANIMATION_TYPE.equals("ARCS")) {
      float r = abs(arr[i] - i);
      if (r > arr.length/2) r = 600 - r;
      float radius = 0.8 * min(width, height) * (arr.length/2 - r) / arr.length;
      arc(width/2, height/2, radius, radius, i * TWO_PI/arr.length - HALF_PI, (i+1.5) * TWO_PI/arr.length - HALF_PI, PIE);
    }
  }
}
void printCount() {
  println("Comparisons: " + comp + "\nSwaps: " + swap);
  comp = 0;
  swap = 0;
}

void shuffleArr(int[] arr) {
  for (int i = 0; i < arr.length; i++) {
    int i2 = (int)random(arr.length);
    swap(arr, i, i2);
  }
  swap = 0;
  animation.clear();
  swaps.clear();
}

void swap(int[] arr, int index1, int index2) {
  int temp = arr[index1];
  arr[index1] = arr[index2];
  arr[index2] = temp;
  swap++;

  animation.add(arr.clone());
  swaps.add(new int[]{index1, arr[index1], index2, arr[index2]});
}

boolean isSorted(int[] arr) {
  for (int i = 0; i < arr.length - 1; i ++) {
    comp++;
    if (arr[i] > arr[i+1]) {
      return false;
    }
  }
  return true;
}

void sortArr(int[] arr, String TYPE) {

  switch(TYPE) {
  case "BUBBLE":
  case "BUBBLE_SORT":
    bubbleSort(arr);
    break;
  case "COCKTAIL_SHAKER":
  case "COCKTAIL_SHAKER_SORT":
    cocktailShakerSort(list);
  case "SELECTION":
  case "SELECTION_SORT":
    selectionSort(arr);
    break;
  case "DOUBLE_SELECTION":
  case "DOUBLE_SELECTION_SORT":
    doubleSelectionSort(arr);
    break;
  case "INSERTION":
  case "INSERTION_SORT":
    insertionSort(arr);
    break;
  case "COMB":
  case "COMB_SORT":
    combSort(arr);
    break;
  case "SHELL":
  case "SHELL_SORT":
    shellSort(arr);
    break;
  case "MERGE":
  case "MERGE_SORT":
    mergeSortAnimate(arr, 0, arr.length -1);
    break;
  case "WEAVE_MERGE":
  case "WEAVE_MERGE_SORT":
    weaveMergeSort(arr, 0, arr.length - 1);
    break;
  case "HEAP":
  case "HEAP_SORT":
    heapSort(arr);
    break;
  case "QUICK":
  case "QUICK_SORT":
    quickSort(arr, 0, arr.length-1);
    break;
  case "RADIX10":
  case "RADIX10_SORT":
    radixSort10(arr);
    break;
  case "RADIX2LSD":
  case "RADIX2LSD_SORT":
    radixSort2LSD(arr);
    break;
  case "RADIX2MSD":
  case "RADIX2MSD_SORT":
    int len = floor(log(getMax(arr))/log(2));
    radixSort2MSD(arr, 0, arr.length - 1, len);
    break;
  case "BITONIC":
  case "BITONIC_SORT":
    bitonicSort(arr, 0, arr.length, true);
    break;
  case "SLOW":
  case "SLOW_SORT":
    slowSort(arr, 0, arr.length-1);
    break;
  }

  println(TYPE + ":");
  printCount();
}




func mergeSort() {
    
}

/*
 Combine two sorted list
    i
 A) 2, 8, 15, 18
    j
 B) 5, 9, 12, 17
    k
 C) 2, 5, 8,
 
 Compare two sorted arrays increment pointer add to list c
 
 Algo:
 merge(A, B, m, n)
 i = 1, j = 1, k = 1
 
 while i <= m && j <= n {
 if (A[i] < B[j])
 C[k++] = A[i++];
 else
 c[k++] = B[j++]
 }
 
 for (; i <= m; i ++)
  c[k++] = B[j++]
 
 for (; j<= n; j++)
   c[k++] = B[j];
 
 Iterative - 2 way merge sort
 - Assume in one unsorted array ar n list based on size in which each list is already sorted
 - sort pairs accross to create less sorted list about half(1st Pass)
 - Have to store in third array
 - Continue with 2 way merge sort(2nd Pass)
 - Final list after 3rd pass with ie was looking at
 n / 2 / 2 / 2, 8 = 2 ^ 3, log2,8 = 3 = nlogn
 Recursive - Merge Sort
 */

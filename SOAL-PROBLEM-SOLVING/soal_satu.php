<?php

/** Jawaban Soal Problem Solving - Test 1 - A
 * 
 * 
 * 
 * Logika :
 * 1. Urutkan Array sort($arr);
 * dilakukan agar kita dapat dengan mudah mengakses empat angka terkecil dan terbesar dalam array.
 * 2. Hitung Jumlah Min $minSum = array_sum(array_slice($arr, 0, count($arr) - 1));
 * lakukan array slice, untuk memotong array mulai dari indeks ke-0 hingga satu elemen sebelum elemen terakhir.
 * Selanjutnya, kita menggunakan fungsi array_sum() untuk menjumlahkan keempat angka tersebut.
 * 3. Menghitung Jumlah Maksimum
 * array_slice($arr, 1), memotong array mulai dari indeks ke-1 hingga elemen terakhir.
 * 4. array_sum(), untuk menjumlahkan keempat angka tersebut
 * 5. Return Hasil
 */

function findMinMaxSum($arr)
{
    sort($arr);
    $minSum = array_sum(array_slice($arr, 0, count($arr) - 1));
    $maxSum = array_sum(array_slice($arr, 1));

    return [$minSum, $maxSum];
}
$arr1 = [1, 2, 5, 6, 10];
$result = findMinMaxSum($arr1);

echo "Minimum: " . $result[0] . ", Maximum: " . $result[1] . "\n";


/** Jawaban Soal Problem Solving - Test 1 - B
 * 
 * 
 * 
 * Logika :
 
 */
/** Jawaban Soal Problem Solving - Test 1 - C
 * 
 * 
 * 
 * Logika :
 
 */

USE KampusDB

-- Cross Join
--menampilkan semua kombinasi mahasiswa dan matakuliah
SELECT NamaMahasiswa FROM Mahasiswa
SELECT NamaMK FROM MataKuliah

SELECT M.NamaMahasiswa, MK.NamaMK
FROM Mahasiswa AS M
CROSS JOIN MataKuliah AS MK

--menampilkan semua kombinasi dosen dan ruangan
SELECT D.NamaDosen, R.KodeRuangan
FROM Dosen D
CROSS JOIN Ruangan R

--Left Join
--menampilkan semua mahasiswa termasuk yang belum mengambil KRS
SELECT M.NamaMahasiswa, K.MataKuliahID
FROM Mahasiswa M
LEFT JOIN KRS K ON M.MahasiswaID = K.MahasiswaID;

--Menampilkan semua mata kuliah termasuk yang belum punya jadwal
SELECT MK.NamaMK, J.Hari
FROM Matakuliah MK
LEFT JOIN JadwalKuliah J ON MK.MataKuliahID = J.MataKuliahID;

--Right Join
--menampilkan semua jadwal, walaupun tidak ada matakuliah
SELECT MK.NamaMK, J.Hari
FROM MataKuliah MK
RIGHT JOIN JadwalKuliah J ON MK.MataKuliahID = J.MataKuliahID;

--Menampilkan semua ruangan, apakah dipakai atau tidak
SELECT R.KodeRuangan, J.Hari
FROM JadwalKuliah J
Right JOIN Ruangan R ON J.RuanganID = R.RuanganID;

--INNER JOIN
--menampilkan nama mahasiswa beserta nama kuliahnya, tapi melalui tabel KRS
SELECT M.NamaMahasiswa, MK.NamaMK
FROM KRS K
INNER JOIN Mahasiswa M ON K.MahasiswaID = M.MahasiswaID
INNER JOIN MataKuliah MK ON K.MataKuliahID = MK.MataKuliahID; 

--Menampilkan matakuliah dan dosen pengampu
SELECT MK.NamaMK, D.NamaDosen
FROM MataKuliah MK
JOIN Dosen D ON MK.DosenID = D.DosenID;

--Menampilkan Jadwal Lengkap
SELECT MK.NamaMK, D.NamaDosen, R.KodeRuangan, J.Hari
FROM JadwalKuliah J
INNER JOIN MataKuliah MK ON J.MataKuliahID = MK.MataKuliahID
INNER JOIN Dosen D ON J.DosenID = D.DosenID
INNER JOIN Ruangan R ON J.RuanganID = R.RuanganID;

--Menampilkan nama mahasiswa, matkul, dan nilai akhir 
SELECT M.NamaMahasiswa, MK.Namamk, N.NilaiAkhir
FROM Nilai N
INNER JOIN Mahasiswa M ON N.MahasiswaID = M.MahasiswaID
INNER JOIN MataKuliah MK ON N.MataKuliahID = MK.MataKuliahID;

--Menampilkan dosen dan matakuliah yang dia ajar
SELECT D.NamaDosen, MK.NamaMK
FROM Dosen D
INNER JOIN MataKuliah MK ON MK.DosenID = D.DosenID;

--Menampilkan nama mahasiswa dan nilai akhir
SELECT M.NamaMahasiswa, N.NilaiAkhir
FROM Mahasiswa M
INNER JOIN Nilai N ON M.MahasiswaID = M.MahasiswaID

--SELF JOIN
--Mencari pasangan mahasiswa dari prodi yang sama
SELECT A.NamaMahasiswa AS Mahasiswa1,
		B.NamaMahasiswa AS Mahasiswa2,
		A.Prodi
FROM Mahasiswa A
INNER JOIN Mahasiswa B ON A.Prodi = B.Prodi
WHERE A.MahasiswaID < B.MahasiswaID; -- agar pasangan yang sama 


--- LATIHAN 
1. -- Menampilkan nama mahasiswa + prodi, tetapi hanya mahasiswa yang memiliki nilai
SELECT M.NamaMahasiswa, M.Prodi
FROM Mahasiswa M
INNER JOIN Nilai N ON M.MahasiswaID = N.MahasiswaID;

2.-- Menampilkan nama dosen + ruangan tempat dosen mengajar
SELECT D.NamaDosen, R.KodeRuangan
FROM Dosen D
INNER JOIN JadwalKuliah J ON d.DosenID = J.DosenID
INNER JOIN Ruangan R ON J.RuanganID = R.RuanganID;

3.-- Menampilkan daftar mahasiswa yang mengambil mata kuliah beserta nama MK dan dosen pengampu
SELECT M.NamaMahasiswa, MK.NamaMK, D.NamaDosen
FROM KRS K
INNER JOIN Mahasiswa M ON K.MahasiswaID = M.MahasiswaID
INNER JOIN MataKuliah MK ON k.MataKuliahID = MK.MataKuliahID
INNER JOIN Dosen D ON MK.DosenID = D.DosenID;

4.-- Menampilkan Jadwal Kuliah
SELECT MK.NamaMK, D.NamaDosen, J.Hari
FROM JadwalKuliah J
INNER JOIN MataKuliah MK ON J.MataKuliahID = MK.MataKuliahID
INNER JOIN Dosen D ON J.DosenID = D.DosenID;

5.-- Menampilkan Nama mahasiswa, nilai akhir, matakuliah, nama dosen pengampu
SELECT M.NamaMahasiswa, MK.NamaMK, D.NamaDosen, N.NilaiAkhir
FROM Nilai N
INNER JOIN Mahasiswa M ON N.MahasiswaID = M.MahasiswaID
INNER JOIN MataKuliah MK ON N.MataKuliahID = MK.MataKuliahID
INNER JOIN Dosen D ON MK.DosenID = D.DosenID;




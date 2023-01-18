import '../../gen/assets.gen.dart';

class Onboard {
  final String judul, deskripsi;
  final AssetGenImage asset;

  Onboard({required this.asset, required this.judul, required this.deskripsi});
}

final List<Onboard> dataBoarding = [
  Onboard(
      asset: Assets.image.lpdp_board1,
      judul: "Selamat datang di E-Beasiswa!",
      deskripsi:
          "Aplikasi untuk mempermudah semua urusan Proses Administrasi Awardee."),
  Onboard(
      asset: Assets.image.lpdp_board2,
      judul: "Report",
      deskripsi: "Mempermudah semua proses Laporan Awardee."),
  Onboard(
      asset: Assets.image.lpdp_board3,
      judul: "Realtime status & Monitoring",
      deskripsi: "Bisa cek langsung status dan aktivitas kamu."),
];
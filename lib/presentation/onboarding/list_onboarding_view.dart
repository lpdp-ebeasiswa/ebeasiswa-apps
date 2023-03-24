import '../../gen/assets.gen.dart';

class Onboard {
  final String judul, deskripsi;
  final AssetGenImage asset;

  Onboard({required this.asset, required this.judul, required this.deskripsi});
}

final List<Onboard> dataBoarding = [
  Onboard(
      asset: Assets.image.onboard1Logo,
      judul: "Selamat datang di E-Beasiswa!",
      deskripsi:
          "Aplikasi untuk mempermudah semua urusan Proses Administrasi Awardee."),
  Onboard(
      asset: Assets.image.onboard2Logo,
      judul: "Report",
      deskripsi: "Mempermudah semua proses Laporan Awardee."),
  Onboard(
      asset: Assets.image.lpdpBoard3,
      judul: "Realtime status & Monitoring",
      deskripsi: "Bisa cek langsung status dan aktivitas kamu."),
];

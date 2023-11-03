import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../Model/data_kota.dart';
import '../../../../../Model/data_provinsi.dart';
import '../../Provider/find_hospital_provider.dart';
import 'dropdown_widget.dart';

class RowDropDownWidget extends StatefulWidget {
  const RowDropDownWidget({super.key});

  @override
  State<RowDropDownWidget> createState() => _RowDropDownWidgetState();
}

class _RowDropDownWidgetState extends State<RowDropDownWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Consumer<FindHospitalProvider>(
          builder: (BuildContext context, hospital, Widget? child) {
            return DropdownWidget(
              label: hospital.labelDdProvinsi,
              items: hospital.daftarProvinsi.map((Provinsi provinsi) {
                return DropdownMenuItem<String>(
                  onTap: () {
                    hospital.labelDdProvinsi = provinsi.name ?? "";
                    hospital.provinceId = provinsi.id;
                    hospital.getKota();
                  },
                  value: provinsi.name,
                  child: Text(provinsi.name ?? ''),
                );
              }).toList(),
              onChanged: (value) {},
            );
          },
        ),
        const SizedBox(width: 20),
        Consumer<FindHospitalProvider>(
          builder: (BuildContext context, hospital, Widget? child) {
            return DropdownWidget(
                label: hospital.labelDdKota,
                items: hospital.daftarKota.map((Kota kota) {
                  return DropdownMenuItem<String>(
                    onTap: () {
                      hospital.labelDdKota = kota.name ?? '';
                      hospital.cityId = kota.id;
                      hospital.getHospital();
                      hospital.isSelected = true;
                    },
                    value: kota.name,
                    child: Text(kota.name ?? ''),
                  );
                }).toList(),
                onChanged: (value) {});
          },
        )
      ],
    );
  }
}

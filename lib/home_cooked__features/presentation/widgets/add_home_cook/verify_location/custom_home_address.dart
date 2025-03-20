import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomHomeAddress extends StatefulWidget {
  @override
  _AddressFormState createState() => _AddressFormState();
}

class _AddressFormState extends State<CustomHomeAddress> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController homeAddressController =
      TextEditingController(text: "Alexandria, San Stefano, Egypt");
  final TextEditingController streetController =
      TextEditingController(text: "San Stefano");
  final TextEditingController buildingNumberController =
      TextEditingController(text: "12");
  final TextEditingController apartmentController =
      TextEditingController(text: "5");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Address Form")),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // GPS Button
              Align(
                alignment: Alignment.topRight,
                child: ElevatedButton.icon(
                  onPressed: () {
                    // Handle GPS functionality
                  },
                  icon: Icon(Icons.gps_fixed, size: 16.sp),
                  label: Text("GPS", style: TextStyle(fontSize: 12.sp)),
                  style: ElevatedButton.styleFrom(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 10.h),

              // Home Address Field
              _buildTextField("Home Address *", homeAddressController),

              SizedBox(height: 15.h),

              // Street & Building Number Fields
              Row(
                children: [
                  Expanded(
                    child: _buildTextField("Street", streetController),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: _buildTextField(
                      "Building Number",
                      buildingNumberController,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 15.h),

              // Apartment Field
              _buildTextField(
                "Apartment",
                apartmentController,
                keyboardType: TextInputType.number,
              ),

              SizedBox(height: 10.h),

              // Info Text
              Text(
                "Include your full address for verification — street, city, and postal code.",
                style: TextStyle(fontSize: 12.sp, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Reusable TextField Widget
  Widget _buildTextField(String label, TextEditingController controller,
      {TextInputType keyboardType = TextInputType.text}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 14.sp)),
        SizedBox(height: 5.h),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.r)),
          ),
        ),
      ],
    );
  }
}

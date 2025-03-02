import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CustomBuildUploadField extends StatefulWidget {
  final String label;
  final bool isMandatory;

  CustomBuildUploadField(this.label, {this.isMandatory = true, super.key});

  final CustomBuildUploadFieldState _state = CustomBuildUploadFieldState();

  bool isValid() => _state.isValid();

  @override
  State<CustomBuildUploadField> createState() => _state;
}

class CustomBuildUploadFieldState extends State<CustomBuildUploadField> {
  final Map<String, File?> _uploadedFiles = {
    "Gym Operating License": null,
    "ID or Passport of Owner": null,
    "Ownership Contract": null,
    "Tax Registration": null,
  };

  bool _validate = false;

  @override
  Widget build(BuildContext context) {
    bool isError =
        widget.isMandatory && _validate && _uploadedFiles[widget.label] == null;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () => _pickFile(widget.label),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                border: Border.all(
                  color: isError ? Colors.red : Colors.grey,
                  style: BorderStyle.solid,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: _uploadedFiles[widget.label] != null
                  ? Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(widget.label,
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400)),
                              const Divider(),
                              Container(
                                constraints: const BoxConstraints(
                                    minHeight: 119,
                                    minWidth: 400,
                                    maxHeight: 320,
                                    maxWidth: 500),
                                child: Image.file(
                                  _uploadedFiles[widget.label]!,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 27,
                          right: 1,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _uploadedFiles[widget.label] = null;
                              });
                            },
                            child: const CircleAvatar(
                              radius: 12,
                              backgroundColor: Colors.red,
                              child: Icon(Icons.close,
                                  color: Colors.white, size: 16),
                            ),
                          ),
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.label,
                              style: TextStyle(
                                  fontSize: 16,
                                  color: isError ? Colors.red : Colors.black),
                            ),
                            const Text(
                              "(Choose file)",
                              style:
                                  TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                          ],
                        ),
                        ElevatedButton(
                          onPressed: () => _pickFile(widget.label),
                          child: const Text("Choose file"),
                        ),
                      ],
                    ),
            ),
          ),
          if (isError)
            const Padding(
              padding: EdgeInsets.only(top: 4.0),
              child: Text(
                "You must add this file",
                style: TextStyle(color: Colors.red, fontSize: 12),
              ),
            ),
        ],
      ),
    );
  }

  bool isValid() {
    return _uploadedFiles[widget.label] != null || !widget.isMandatory;
  }

  Future<void> _pickFile(String fieldName) async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      setState(() {
        _uploadedFiles[fieldName] = File(pickedFile.path);
      });
    }
  }
}

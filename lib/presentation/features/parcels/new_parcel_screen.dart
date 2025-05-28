import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:benin_express/presentation/features/parcels/transport_selection_screen.dart';
import 'package:benin_express/presentation/features/auth/login_screen.dart';

class NewParcelScreen extends StatefulWidget {
  final UserType userType;

  const NewParcelScreen({super.key, required this.userType});

  @override
  State<NewParcelScreen> createState() => _NewParcelScreenState();
}

class _NewParcelScreenState extends State<NewParcelScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _expediteurNomController =
      TextEditingController();
  final TextEditingController _expediteurTelController =
      TextEditingController();
  final TextEditingController _expediteurAdresseController =
      TextEditingController();
  final TextEditingController _destinataireNomController =
      TextEditingController();
  final TextEditingController _destinataireTelController =
      TextEditingController();
  final TextEditingController _destinataireAdresseController =
      TextEditingController();
  final TextEditingController _colisDescriptionController =
      TextEditingController();
  File? _colisPhoto;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickPhoto() async {
    final XFile? picked = await _picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        _colisPhoto = File(picked.path);
      });
    }
  }

  void _removePhoto() {
    setState(() {
      _colisPhoto = null;
    });
  }

  @override
  void dispose() {
    _expediteurNomController.dispose();
    _expediteurTelController.dispose();
    _expediteurAdresseController.dispose();
    _destinataireNomController.dispose();
    _destinataireTelController.dispose();
    _destinataireAdresseController.dispose();
    _colisDescriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: const Text('Nouveau colis'),
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF008751),
        elevation: 0.5,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Expéditeur
                  _SectionContainer(
                    title: '👤 Expéditeur',
                    children: [
                      _InputField(
                        controller: _expediteurNomController,
                        label: 'Nom complet',
                        validator:
                            (v) =>
                                v == null || v.isEmpty ? 'Champ requis' : null,
                      ),
                      const SizedBox(height: 12),
                      _InputField(
                        controller: _expediteurTelController,
                        label: 'Téléphone',
                        prefix: '+229',
                        keyboardType: TextInputType.phone,
                        validator:
                            (v) =>
                                v == null || v.isEmpty ? 'Champ requis' : null,
                      ),
                      const SizedBox(height: 12),
                      _InputField(
                        controller: _expediteurAdresseController,
                        label: 'Adresse de collecte',
                        maxLines: 2,
                        validator:
                            (v) =>
                                v == null || v.isEmpty ? 'Champ requis' : null,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Destinataire
                  _SectionContainer(
                    title: '📍 Destinataire',
                    children: [
                      _InputField(
                        controller: _destinataireNomController,
                        label: 'Nom complet',
                        validator:
                            (v) =>
                                v == null || v.isEmpty ? 'Champ requis' : null,
                      ),
                      const SizedBox(height: 12),
                      _InputField(
                        controller: _destinataireTelController,
                        label: 'Téléphone',
                        prefix: '+229',
                        keyboardType: TextInputType.phone,
                        validator:
                            (v) =>
                                v == null || v.isEmpty ? 'Champ requis' : null,
                      ),
                      const SizedBox(height: 12),
                      _InputField(
                        controller: _destinataireAdresseController,
                        label: 'Adresse de livraison',
                        maxLines: 2,
                        validator:
                            (v) =>
                                v == null || v.isEmpty ? 'Champ requis' : null,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Colis
                  _SectionContainer(
                    title: '📦 Colis',
                    children: [
                      _InputField(
                        controller: _colisDescriptionController,
                        label: 'Description du contenu',
                        maxLines: 2,
                        validator:
                            (v) =>
                                v == null || v.isEmpty ? 'Champ requis' : null,
                      ),
                      const SizedBox(height: 12),
                      // Gestion de la photo du colis
                      _colisPhoto == null
                          ? GestureDetector(
                            onTap: _pickPhoto,
                            child: DottedBorder(
                              options: RoundedRectDottedBorderOptions(
                                radius: const Radius.circular(12),
                                dashPattern: const [6, 3],
                                color: Colors.grey,
                              ),
                              child: Container(
                                height: 80,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Center(
                                  child: Text(
                                    'Ajouter une photo (optionnel)',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ),
                              ),
                            ),
                          )
                          : Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.file(
                                  _colisPhoto!,
                                  height: 80,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                top: 4,
                                right: 4,
                                child: GestureDetector(
                                  onTap: _removePhoto,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.5),
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.close,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  // Bouton continuer
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 2,
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                        backgroundColor: const Color(0xFF22C55E),
                        foregroundColor: Colors.white,
                        shadowColor: const Color(0xFF22C55E).withOpacity(0.2),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder:
                                  (context) => TransportSelectionScreen(
                                    userType: widget.userType,
                                  ),
                            ),
                          );
                        }
                      },
                      child: const Text(
                        'Continuer vers sélection transporteur',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SectionContainer extends StatelessWidget {
  final String title;
  final List<Widget> children;
  const _SectionContainer({required this.title, required this.children});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      margin: const EdgeInsets.only(bottom: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Color(0xFF1F2937),
            ),
          ),
          const SizedBox(height: 16),
          ...children,
        ],
      ),
    );
  }
}

class _InputField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String? prefix;
  final int maxLines;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  const _InputField({
    required this.controller,
    required this.label,
    this.prefix,
    this.maxLines = 1,
    this.keyboardType,
    this.validator,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        prefixText: prefix,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        fillColor: const Color(0xFFF8FAFC),
        filled: true,
      ),
    );
  }
}

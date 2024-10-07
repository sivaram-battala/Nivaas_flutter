import 'package:flutter/material.dart';
import 'package:nivaas/common/colors.dart';

class AddYourHome extends StatefulWidget {
  const AddYourHome({super.key});

  @override
  State<AddYourHome> createState() => _AddYourHomeState();
}

class _AddYourHomeState extends State<AddYourHome> with SingleTickerProviderStateMixin {
  String? _selectedCity;
  String? _selectedApartment;
  String? _selectedFlatNumber;
  bool _isOwner = true;
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _slideAnimation = Tween<Offset>(
      begin: Offset(0, 0),
      end: Offset(1, 0),
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleTab(bool isOwner) {
    if (isOwner != _isOwner) {
      setState(() {
        _isOwner = isOwner;
        if (_isOwner) {
          _animationController.reverse();
        } else {
          _animationController.forward();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Your Home', style: TextStyle(color: AppColors.white)),
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('City', style: TextStyle(fontSize: 16)),
            DropdownButtonFormField<String>(
              value: _selectedCity,
               hint: Text('Select City'),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
              items: ['Anakapalle', 'Hyderabad', 'Bangalore']
                  .map((city) => DropdownMenuItem(
                        value: city,
                        child: Text(city),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _selectedCity = value;
                  _selectedApartment = null; // Reset apartment when city changes
                  _selectedFlatNumber = null; // Reset flat number when city changes
                });
              },
            ),
            const SizedBox(height: 16),
            // Show Apartment Dropdown only when City is selected
            if (_selectedCity != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Apartment', style: TextStyle(fontSize: 16)),
                  DropdownButtonFormField<String>(
                    value: _selectedApartment,
                    hint: Text('Select Apartment'),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    items: ['Juvi', 'Maple', 'Cedar']
                        .map((apartment) => DropdownMenuItem(
                              value: apartment,
                              child: Text(apartment),
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedApartment = value;
                        _selectedFlatNumber = null; // Reset flat number when apartment changes
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            // Show Owner/Tenant Toggle after Apartment selection
            if (_selectedApartment != null)
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () => _toggleTab(true),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                            decoration: BoxDecoration(
                              color: _isOwner ? AppColors.primaryColor : Colors.grey[300],
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            child: const Center(
                              child: Text(
                                'Owner',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => _toggleTab(false),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                            decoration: BoxDecoration(
                              color: !_isOwner ? AppColors.primaryColor : Colors.grey[300],
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            child: const Center(
                              child: Text(
                                'Tenant',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            if (_selectedApartment != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Flat Number', style: TextStyle(fontSize:16)),
                  DropdownButtonFormField<String>(
                    value: _selectedFlatNumber,
                     hint: Text('Select Flat'),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    items: _isOwner
                        ? ['BlockJ-101', 'BlockA-201', 'BlockB-301']
                            .map((flat) => DropdownMenuItem(
                                  value: flat,
                                  child: Text(flat),
                                ))
                            .toList()
                        : ['BlockJ-102', 'BlockA-202', 'BlockB-302']
                            .map((flat) => DropdownMenuItem(
                                  value: flat,
                                  child: Text(flat),
                                ))
                            .toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedFlatNumber = value;
                      });
                    },
                  ),
                ],
              ),
            const SizedBox(height: 24),
            if (_selectedFlatNumber != null)
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Handle On Board action here
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                    backgroundColor: AppColors.primaryColor,
                  ),
                  child: const Text(
                    'On Board',
                    style: TextStyle(fontSize: 16, color: AppColors.white),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

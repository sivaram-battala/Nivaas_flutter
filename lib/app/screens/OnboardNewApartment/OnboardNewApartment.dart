import 'package:flutter/material.dart';
import 'package:nivaas/common/colors.dart';

class OnboardNewApartment extends StatefulWidget {
  const OnboardNewApartment({super.key});

  @override
  State<OnboardNewApartment> createState() => _OnboardNewApartmentState();
}

class _OnboardNewApartmentState extends State<OnboardNewApartment>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  String? selectedCity;
  String? selectedPostalCode;

  // Dummy dropdown data
  final List<String> cities = ['New York', 'Los Angeles', 'Chicago', 'Houston'];
  final List<String> postalCodes = ['10001', '90001', '60601', '77001'];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    _controller.forward(); // Start the animation on screen load
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Apartment Onboarding',style: TextStyle(color: AppColors.white),),
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,color: AppColors.white,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Animated field 1: Apartment Name
              AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                child: FadeTransition(
                  opacity: _animation,
                  child: TextField(
                    decoration: const InputDecoration(
                      labelText: 'Enter Apartment Name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Animated field 2: Number of Flats
              AnimatedContainer(
                duration: const Duration(milliseconds: 600),
                curve: Curves.easeInOut,
                child: FadeTransition(
                  opacity: _animation,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Enter Number Of Flats',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Animated dropdown: City selection
              AnimatedContainer(
                duration: const Duration(milliseconds: 700),
                curve: Curves.easeInOut,
                child: FadeTransition(
                  opacity: _animation,
                  child: DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      labelText: 'Select City',
                      border: OutlineInputBorder(),
                    ),
                    value: selectedCity,
                    items: cities.map((String city) {
                      return DropdownMenuItem<String>(
                        value: city,
                        child: Text(city),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedCity = value;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Animated field 3: State
              AnimatedContainer(
                duration: const Duration(milliseconds: 800),
                curve: Curves.easeInOut,
                child: FadeTransition(
                  opacity: _animation,
                  child: TextField(
                    decoration: const InputDecoration(
                      labelText: 'Enter Your State',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Animated dropdown: Postal code selection
              AnimatedContainer(
                duration: const Duration(milliseconds: 900),
                curve: Curves.easeInOut,
                child: FadeTransition(
                  opacity: _animation,
                  child: DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      labelText: 'Select Postal Code',
                      border: OutlineInputBorder(),
                    ),
                    value: selectedPostalCode,
                    items: postalCodes.map((String postalCode) {
                      return DropdownMenuItem<String>(
                        value: postalCode,
                        child: Text(postalCode),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedPostalCode = value;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Animated field 4: Address Line 1
              AnimatedContainer(
                duration: const Duration(milliseconds: 1000),
                curve: Curves.easeInOut,
                child: FadeTransition(
                  opacity: _animation,
                  child: TextField(
                    decoration: const InputDecoration(
                      labelText: 'Enter Address Line 1',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Animated field 5: Address Line 2
              AnimatedContainer(
                duration: const Duration(milliseconds: 1100),
                curve: Curves.easeInOut,
                child: FadeTransition(
                  opacity: _animation,
                  child: TextField(
                    decoration: const InputDecoration(
                      labelText: 'Enter Address Line 2',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),

              // Submit button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Handle submit action here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:AppColors.primaryColor,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 110.0, vertical: 16.0),
                  ),
                  child: const Text('Send OnBoard Request',style: TextStyle(color: AppColors.white),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

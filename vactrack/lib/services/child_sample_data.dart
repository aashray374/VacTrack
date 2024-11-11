import 'package:vactrack/models/hospital.dart';
import '../models/child.dart';
import '../models/doctor.dart';
import '../models/vaccine.dart';

class SampleData {
  static List<Child> sampleChildren = [
    Child(
      name: "Alice Smith",
      adahar: "1234-5678-9101",
      gender: 0.0,
      dob: "2023-01-01",
      img: "path/to/alice_image.png",
      vaccinesToBeGiven: [
        Vaccine(
          name: "DPT",
          usage: "Combines protection against diphtheria, pertussis, and tetanus.",
          days: 42,  // 6 weeks after birth
        ),
        Vaccine(
          name: "OPV",
          usage: "Protects against poliovirus.",
          days: 70,  // 10 weeks after birth
        ),
      ],
      vaccinesTaken: {
        Vaccine(
          name: "BCG",
          usage: "Protects against tuberculosis (TB).",
          days: 0,  // At birth
        ): "2023-01-01",
        Vaccine(
          name: "Hepatitis B (Birth Dose)",
          usage: "Prevents liver infection caused by the hepatitis B virus.",
          days: 0,
        ): "2023-01-01",
      },
    ),
    Child(
      name: "Bob Johnson",
      adahar: "2234-5678-9102",
      gender: 1.0,
      dob: "2023-02-10",
      img: "path/to/bob_image.png",
      vaccinesToBeGiven: [
        Vaccine(
          name: "Hepatitis B (Second Dose)",
          usage: "Boosts immunity against hepatitis B.",
          days: 42,
        ),
        Vaccine(
          name: "DPT",
          usage: "Combines protection against diphtheria, pertussis, and tetanus.",
          days: 42,
        ),
      ],
      vaccinesTaken: {
        Vaccine(
          name: "BCG",
          usage: "Protects against tuberculosis (TB).",
          days: 0,
        ): "2023-02-10",
      },
    ),
    Child(
      name: "Charlie Brown",
      adahar: "3234-5678-9103",
      gender: 1.0,
      dob: "2023-03-05",
      img: "path/to/charlie_image.png",
      vaccinesToBeGiven: [
        Vaccine(
          name: "DPT",
          usage: "Protects against diphtheria, pertussis, and tetanus.",
          days: 42,
        ),
        Vaccine(
          name: "OPV",
          usage: "Provides immunity against poliovirus.",
          days: 70,
        ),
      ],
      vaccinesTaken: {
        Vaccine(
          name: "Hepatitis B (Birth Dose)",
          usage: "Prevents liver infection caused by hepatitis B virus.",
          days: 0,
        ): "2023-03-05",
      },
    ),
  ];

  List<Vaccine> allVaccines = [
    Vaccine(
      name: "BCG",
      usage: "Protects against tuberculosis (TB).",
      days: 0, // At birth
    ),
    Vaccine(
      name: "Hepatitis B (Birth Dose)",
      usage: "Prevents liver infection caused by the hepatitis B virus.",
      days: 0, // At birth
    ),
    Vaccine(
      name: "Polio (OPV 0)",
      usage: "Protects against poliovirus.",
      days: 0, // At birth
    ),
    Vaccine(
      name: "Hepatitis B (Second Dose)",
      usage: "Boosts immunity against hepatitis B.",
      days: 42, // Around 6 weeks after birth
    ),
    Vaccine(
      name: "DPT (Diphtheria, Pertussis, Tetanus)",
      usage: "Combines protection against diphtheria, pertussis, and tetanus.",
      days: 42, // Around 6 weeks after birth
    ),
    Vaccine(
      name: "OPV 1",
      usage: "Provides immunity against poliovirus.",
      days: 42, // Around 6 weeks after birth
    ),
    Vaccine(
      name: "Pneumococcal Conjugate Vaccine (PCV 1)",
      usage: "Protects against pneumococcal infections, which can cause pneumonia, meningitis, and sepsis.",
      days: 42, // Around 6 weeks after birth
    ),
    Vaccine(
      name: "Rotavirus 1",
      usage: "Protects against rotavirus, a major cause of severe diarrhea in infants.",
      days: 42, // Around 6 weeks after birth
    ),
    Vaccine(
      name: "Hepatitis B (Third Dose)",
      usage: "Further immunity boost against hepatitis B.",
      days: 70, // Around 10 weeks after birth
    ),
    Vaccine(
      name: "DPT (Second Dose)",
      usage: "Further protection against diphtheria, pertussis, and tetanus.",
      days: 70, // Around 10 weeks after birth
    ),
    Vaccine(
      name: "OPV 2",
      usage: "Additional dose for poliovirus immunity.",
      days: 70, // Around 10 weeks after birth
    ),
    Vaccine(
      name: "Pneumococcal Conjugate Vaccine (PCV 2)",
      usage: "Additional protection against pneumococcal infections.",
      days: 70, // Around 10 weeks after birth
    ),
    Vaccine(
      name: "Rotavirus 2",
      usage: "Additional protection against rotavirus.",
      days: 70, // Around 10 weeks after birth
    ),
    Vaccine(
      name: "DPT (Third Dose)",
      usage: "Final primary dose for diphtheria, pertussis, and tetanus.",
      days: 98, // Around 14 weeks after birth
    ),
    Vaccine(
      name: "OPV 3",
      usage: "Final primary dose for poliovirus.",
      days: 98, // Around 14 weeks after birth
    ),
    Vaccine(
      name: "Pneumococcal Conjugate Vaccine (PCV 3)",
      usage: "Final primary dose for pneumococcal infections.",
      days: 98, // Around 14 weeks after birth
    ),
    Vaccine(
      name: "Measles, Mumps, and Rubella (MMR)",
      usage: "Protects against measles, mumps, and rubella.",
      days: 270, // Around 9 months after birth
    ),
    Vaccine(
      name: "Japanese Encephalitis (JE)",
      usage: "Protects against Japanese encephalitis, a mosquito-borne virus.",
      days: 270, // Around 9 months after birth
    ),
    Vaccine(
      name: "Vitamin A (First Dose)",
      usage: "Supports immune function and healthy growth.",
      days: 270, // Around 9 months after birth
    ),
    Vaccine(
      name: "DPT Booster",
      usage: "Booster dose for diphtheria, pertussis, and tetanus.",
      days: 540, // Around 18 months after birth
    ),
    Vaccine(
      name: "OPV Booster",
      usage: "Booster dose for poliovirus.",
      days: 540, // Around 18 months after birth
    ),
    Vaccine(
      name: "Measles (Second Dose)",
      usage: "Additional protection against measles.",
      days: 540, // Around 18 months after birth
    ),
    Vaccine(
      name: "Typhoid Conjugate Vaccine",
      usage: "Protects against typhoid fever.",
      days: 730, // Around 2 years after birth
    ),
    Vaccine(
      name: "DPT Booster (Second Dose)",
      usage: "Second booster for diphtheria, pertussis, and tetanus.",
      days: 1825, // Around 5 years after birth
    ),
    Vaccine(
      name: "TT (Tetanus Toxoid) for Adolescents",
      usage: "Provides protection against tetanus.",
      days: 4745, // Around 13 years after birth
    ),
  ];

  List<Hospital> hospitalData = [
    Hospital(
      id: 1,
      name: "City Health Hospital",
      location: "Downtown City, Street 123",
      lat: 40.712776,
      long: -74.005974,
      contactNumber: "+1 212-555-1234",
      doctors: [
        Doctor(id: 1, name: "Dr. John Doe", email: "johndoe@example.com", specialization: "Cardiology", hospitalId: 1),
        Doctor(id: 2, name: "Dr. Jane Smith", email: "janesmith@example.com", specialization: "Pediatrics", hospitalId: 1),
        Doctor(id: 3, name: "Dr. Sarah Johnson", email: "sarahj@example.com", specialization: "Neurology", hospitalId: 1),
      ],
    ),
    Hospital(
      id: 2,
      name: "Greenfield Medical Center",
      location: "Greenfield Area, Park Lane",
      lat: 40.750000,
      long: -73.990000,
      contactNumber: "+1 212-555-5678",
      doctors: [
        Doctor(id: 4, name: "Dr. Emily Davis", email: "emilydavis@example.com", specialization: "Orthopedics", hospitalId: 2),
        Doctor(id: 5, name: "Dr. Michael Brown", email: "michaelb@example.com", specialization: "Radiology", hospitalId: 2),
      ],
    ),
    Hospital(
      id: 3,
      name: "Sunrise Medical Hospital",
      location: "Sunrise Valley, Hillside Avenue 25",
      lat: 41.203650,
      long: -77.024097,
      contactNumber: "+1 301-555-9876",
      doctors: [
        Doctor(id: 6, name: "Dr. Anna Williams", email: "annawilliams@example.com", specialization: "Gynecology", hospitalId: 3),
        Doctor(id: 7, name: "Dr. David Wilson", email: "davidwilson@example.com", specialization: "Dermatology", hospitalId: 3),
      ],
    ),
    Hospital(
      id: 4,
      name: "Lakeside Health Institute",
      location: "Lakeside Town, Elm Street 98",
      lat: 42.360081,
      long: -71.058884,
      contactNumber: "+1 617-555-3456",
      doctors: [
        Doctor(id: 8, name: "Dr. Lisa Carter", email: "lisacarter@example.com", specialization: "Internal Medicine", hospitalId: 4),
        Doctor(id: 9, name: "Dr. Robert Green", email: "robertgreen@example.com", specialization: "Pediatrics", hospitalId: 4),
        Doctor(id: 10, name: "Dr. Megan Clark", email: "meganclark@example.com", specialization: "Surgery", hospitalId: 4),
      ],
    ),
    Hospital(
      id: 5,
      name: "Mountain View Medical Center",
      location: "Mountain City, River Road 50",
      lat: 39.099730,
      long: -94.578572,
      contactNumber: "+1 816-555-2345",
      doctors: [
        Doctor(id: 11, name: "Dr. William Harris", email: "williamharris@example.com", specialization: "Cardiology", hospitalId: 5),
        Doctor(id: 12, name: "Dr. Julia Clark", email: "juliac@example.com", specialization: "Emergency Medicine", hospitalId: 5),
        Doctor(id: 13, name: "Dr. Henry Martin", email: "henrymartin@example.com", specialization: "Gastroenterology", hospitalId: 5),
      ],
    ),
    Hospital(
      id: 6,
      name: "Coastal Health Clinic",
      location: "Coastal Bay, Ocean Drive 110",
      lat: 37.774929,
      long: -122.419418,
      contactNumber: "+1 415-555-6543",
      doctors: [
        Doctor(id: 14, name: "Dr. Samuel King", email: "samuelking@example.com", specialization: "Pulmonology", hospitalId: 6),
        Doctor(id: 15, name: "Dr. Olivia Thompson", email: "oliviathompson@example.com", specialization: "Endocrinology", hospitalId: 6),
      ],
    ),
  ];


  List<Doctor> doctors = [
    Doctor(id: 1, name: "Dr. John Doe", email: "johndoe@example.com", specialization: "Cardiology", hospitalId: 1),
    Doctor(id: 2, name: "Dr. Jane Smith", email: "janesmith@example.com", specialization: "Pediatrics", hospitalId: 1),
    Doctor(id: 3, name: "Dr. Sarah Johnson", email: "sarahj@example.com", specialization: "Neurology", hospitalId: 1),
    Doctor(id: 4, name: "Dr. Emily Davis", email: "emilydavis@example.com", specialization: "Orthopedics", hospitalId: 2),
    Doctor(id: 5, name: "Dr. Michael Brown", email: "michaelb@example.com", specialization: "Radiology", hospitalId: 2),
    Doctor(id: 8, name: "Dr. Lisa Carter", email: "lisacarter@example.com", specialization: "Internal Medicine", hospitalId: 4),
    Doctor(id: 9, name: "Dr. Robert Green", email: "robertgreen@example.com", specialization: "Pediatrics", hospitalId: 4),
    Doctor(id: 10, name: "Dr. Megan Clark", email: "meganclark@example.com", specialization: "Surgery", hospitalId: 4),
    Doctor(id: 11, name: "Dr. William Harris", email: "williamharris@example.com", specialization: "Cardiology", hospitalId: 5),
    Doctor(id: 12, name: "Dr. Julia Clark", email: "juliac@example.com", specialization: "Emergency Medicine", hospitalId: 5),
    Doctor(id: 13, name: "Dr. Henry Martin", email: "henrymartin@example.com", specialization: "Gastroenterology", hospitalId: 5),
    Doctor(id: 14, name: "Dr. Samuel King", email: "samuelking@example.com", specialization: "Pulmonology", hospitalId: 6),
    Doctor(id: 15, name: "Dr. Olivia Thompson", email: "oliviathompson@example.com", specialization: "Endocrinology", hospitalId: 6),
  ];

}

import '../models/child.dart';
import '../models/vaccine.dart';

class SampleData{
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
}
class NumberToWord{
  String convertToIndianStyle(int number) {
    if (number == 0) {
      return 'Zero';
    }

    List<String> ones = [
      '', 'One', 'Two', 'Three', 'Four', 'Five', 'Six', 'Seven', 'Eight', 'Nine'
    ];

    List<String> teens = [
      'Ten', 'Eleven', 'Twelve', 'Thirteen', 'Fourteen', 'Fifteen', 'Sixteen', 'Seventeen', 'Eighteen', 'Nineteen'
    ];

    List<String> tens = [
      '', '', 'Twenty', 'Thirty', 'Forty', 'Fifty', 'Sixty', 'Seventy', 'Eighty', 'Ninety'
    ];

    String words = '';



    // Crores
    int crores = number ~/ 10000000;
    if (crores > 0) {
      words += '${convertToIndianStyle(crores)} Crore ';
    }
    number %= 10000000;

    // Lakhs
    int lakhs = number ~/ 100000;
    if (lakhs > 0) {
      words += '${convertToIndianStyle(lakhs)} Lakh ';
    }
    number %= 100000;

    // Thousands
    int thousands = number ~/ 1000;
    if (thousands > 0) {
      words += '${convertToIndianStyle(thousands)} Thousand ';
    }
    number %= 1000;

    // Hundreds
    int hundred = number ~/ 100;
    if (hundred > 0) {
      words += '${ones[hundred]} Hundred ';
    }
    number %= 100;

    // Tens and Ones
    if (number >= 20) {
      words += '${tens[number ~/ 10]} ';
      number %= 10;
    }

    if (number > 0) {
      if (number < 10) {
        words += '${ones[number]} ';
      } else {
        words += '${teens[number - 10]} ';
      }
    }

    return words.trim();
  }
}
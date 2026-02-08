double calculateDiscountedPrice({
  required String discountType, 
  required double originalPrice,
  required double discountValue,
}) {
  double finalPrice = originalPrice;

  if (discountType == 'percent') {
    finalPrice = originalPrice - (originalPrice * (discountValue / 100));
  } else if (discountType == 'amount') {
    finalPrice = originalPrice - discountValue;
  }

  if (finalPrice < 0) finalPrice = 0;

  return finalPrice;
}

<?php

$secret_key = "VUPPfF8isnhH";

$version = "6.0";
$merchant_id = "MM0003";
$payment_description = "";
$order_id = "00000000000000123456";
$invoice_no = "";
$currency = "";
$amount = "000000010050";
$customer_email = "tester@test.com";
$pay_category_id = "";
$promotion = "";
$user_defined_1 = "";
$user_defined_2 = "";
$user_defined_3 = "";
$user_defined_4 = "";
$user_defined_5 = "";
$result_url_1 = "";
$result_url_2 = "";

$strSignatureString = $version . $merchant_id . $payment_description . $order_id . $invoice_no . $currency . $amount . $customer_email . $pay_category_id . $promotion . $user_defined_1 . $user_defined_2 . $user_defined_3 . $user_defined_4 . $user_defined_5 . $result_url_1 . $result_url_2;
$HashValue = hash_hmac('sha1', $strSignatureString, $secret_key, false);

echo $HashValue;

?>




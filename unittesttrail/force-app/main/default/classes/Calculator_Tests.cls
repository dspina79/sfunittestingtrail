@istest
public with sharing class Calculator_Tests {

    @istest
    private static void addition_withSimpleNumbers() {
        Test.startTest();
        Integer result = Calculator.addition(8, 5);
        Test.stopTest();

        System.assertEquals(13, result, 'Expected result was 13');
    }

    @istest
    private static void subtraction_withSimpleNumbers() {
        Test.startTest();
        Integer result = Calculator.subtraction(16, 3);
        Test.stopTest();

        System.assertEquals(13, result, 'Expected result was 13');
    }

    @istest
    private static void multiply_withZero() {
        Boolean exceptionCaught = false;
        Test.startTest();
        try {
            Integer result = Calculator.multiply(16, 0);
        } catch (Exception ex) {
            exceptionCaught = true;
        }
        Test.stopTest();

        System.assert(exceptionCaught, 'Expected exception to be thrown.');
    }

    @istest
    private static void multiply_withNonZero() {
        Test.startTest();
        Integer result = Calculator.multiply(16, 5);
        Test.stopTest();

        System.assertEquals(80, result, 'Expected 80 to be returned.');
    }

    @istest
    private static void divide_withPositveItems() {
        Test.startTest();
        Decimal result = Calculator.divide(16, 4);
        Test.stopTest();

        System.assertEquals(4.00, result, 'Expected 4 to be returned.');
    }

    @istest
    private static void divide_withZeroDenomentator() {
        Boolean exceptionCaught = false;
        Test.startTest();
        try {
            Decimal result = Calculator.divide(16, 0);
        } catch (Calculator.CalculatorException ex) {
            exceptionCaught = true;
        }
        Test.stopTest();
        System.assert(exceptionCaught, 'Expected exception to be caught.');
    }

    @istest
    private static void divide_withNegativeDenomentator() {
        Boolean exceptionCaught = false;
        Test.startTest();
        try {
            Decimal result = Calculator.divide(16, -4);
        } catch (Calculator.CalculatorException ex) {
            exceptionCaught = true;
        }
        Test.stopTest();
        System.assert(exceptionCaught, 'Expected exception to be caught.');
    }
}

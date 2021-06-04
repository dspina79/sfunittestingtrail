@isTest
private class ExternalSearch_Tests {
  @isTest
  static void test_method_one() {
    HttpMockFactory mock = new HttpMockFactory(200, 'OK', 'I found it!', new Map<String,String>());
    Test.setMock(HttpCalloutMock.class, mock);
    String result;
    Test.startTest();
      result = ExternalSearch.googleIt('epic search');
    Test.stopTest();
    system.assertEquals('I found it!', result);
  }

  @istest
  private static void test_500_response() {
      String serverErrorText = 'A server-level error occurred.';
      HTTPMockFactory mock = new HTTPMockFactory(500, 'Server Error', serverErrorText, new Map<String, String>());
      Boolean exceptionThrown = false;
      Test.setMock(HttpCalloutMock.class, mock);
      Test.startTest(); 
      try {
        String result = ExternalSearch.googleIt('this should fail');
      } catch (Exception ex) {
          exceptionThrown = true;
      }
      Test.stopTest();
      System.assert(exceptionThrown, 'The exception was not thrown.');
  }
}
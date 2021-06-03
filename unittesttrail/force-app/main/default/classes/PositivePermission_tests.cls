@istest
public with sharing class PositivePermission_tests {
    private static User standardUser;

    @TestSetup
    static void loadInformation(){
        Account acct = new Account(Name = 'Test Account');
        insert acct;
        Private_Object__c privateObject = new Private_Object__c(account__c = acct.Id, notes__c = 'test');
        insert privateObject;
    }

    @istest
    private static void testCustomUserAccess() {

        standarduser = new User(
            ProfileId = [SELECT Id FROM Profile WHERE Name = 'Custom User'].Id,
            LastName = 'last',
            Email = 'brian@nowhere.wiki',
            UserName = 'brian@nowhere.wiki',
            Alias = 'alias',
            TimeZoneSidKey = 'America/New_York',
            EmailEncodingKey = 'UTF-8',
            LanguageLocaleKey = 'en_US',
            LocaleSidKey = 'en_US'
            );
        insert standardUser;
        
        Boolean exceptionCaught = false;
        Private_Object__c result = null;
        String exceptionMessage = '';
        Test.startTest();
        
        System.runAs(standardUser) {
            try {
                    result = [SELECT Id, OwnerId, Notes__c FROM Private_Object__c LIMIT 1];
                
            } catch (Exception ex) {
                exceptionCaught = true;
                exceptionMessage = ex.getMessage() + ex.getStackTraceString();
            }
        }
        Test.stopTest();
        System.assert(!exceptionCaught, exceptionMessage);
        System.assert(result != null, 'Result was null.');
        System.assert(result.OwnerId != standardUser.Id, 'Owner should not have been the standard user.');
    }
}

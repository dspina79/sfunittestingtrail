@istest
public with sharing class CSV_Tests {
    @TestSetup
    private static void loadTestDataFromStaticResource(){
        List<SObject> accounts = Test.loadData(Account.SObjectType, 'accountData');
    }

    @istest
    private static void testLoadAccountsFromStaticResource() {
        List<Account> accts = [SELECT Id FROM Account];
        System.assert(accts.size() == 3, 'Expected 3 accounts.');
    }
}